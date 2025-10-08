Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D733CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 17:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C150B10E202;
	Wed,  8 Oct 2025 17:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7Zr0oGn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679AE10E202
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 17:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759945799; x=1791481799;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XXEceALji9w5VXWtg4k/C8J7RNXOiJiKeLpPO0tbS0w=;
 b=Y7Zr0oGnVC4m3BwHdMDWFOGOS4pCbRc1NuwdirpPcNr+pmexGP7ishcH
 erh0Y75EGuiHKbL0rgqgwOq3yP7n9nQ6YXbNFZvMLh3rLZMeWp4iCHF64
 JJhoiQxlKqw44P2zIUmt3iOXeM5xNRaa6Goehyz2G+9TB49jfXAKNUU8C
 ELviw9OkOiCzq2O0QnsJwk7rfWXk88RVwrlfX+VreP77IpEaVJ+0Z5XAV
 DQJ7Kmp+SlT0VcVtTP8vOpZeQN89stz2rBb+hiJSvjzBDozFPDxZ0dtYM
 c6jUKRn6dLoyQO4uF5Dk6IDpaFZgWjz/XRNnzyiCEBHN2L5jTxtGTK5cB Q==;
X-CSE-ConnectionGUID: OI143MGHS7uhOaDRqAjAmg==
X-CSE-MsgGUID: 7zvzNZThQ42z0FL89slxdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62035779"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="62035779"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 10:49:58 -0700
X-CSE-ConnectionGUID: a8PLCfJGSG6dAOpE+H0onw==
X-CSE-MsgGUID: LGWeDZ0kSUWrTNlvRiZ93g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="180323643"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 10:49:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 10:49:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 10:49:56 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 10:49:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DW9haz1+MHLYsmj9MELC0Coy8mLmtAfWRFDay3v8EMBUK9w0n0QDwksd+vHRPO+RNsMWFg6CT1/lL1jeFXvnPw8oJ8hfr7nE5scKkTItrLbTizS1o78znK6HZmbzePthGOcmtQVztJo0F4Xbyopl0owNxHOQAvpMg0caRMBviM7b1HhS/JmNCSTJ62TH3WnuPUen0ktI/c1Wa9AdDGN6svrZQj3aEyYRH92M9dzgGnUeuCi9BrKsbVjL460JjxmjwF6mSMfxEhCsYq+fgdCqgEhexJqR4+3XLbvSVYnjga608sX6xuao6GWG+CL9P/wxiePppuaKpmJmvNv6MK8jGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXEceALji9w5VXWtg4k/C8J7RNXOiJiKeLpPO0tbS0w=;
 b=rQhjlHGvtjCth1oXQNR7uJAdafDhhIMkbxI3rGlf4d02ab9wNAT0+juFwSuaMiMFt/I0kM5vZpOJVcoipco7iRK5Z+qowH197RVMPr/Cac1K3+ghTjJPoaxyvaq1HMwF6wYd0U4ZPPju4jj7N5/HjYOtpFxNFdvF4L4bfyvdMlg4Xy61ZHYNH8AShCC0MvkNtnp4YVT2+j3XkenD9ahiAzsoV2lQVIkXgeeu0P+Yp1koonrWyECr6+lCYN1ZEqeSLyrq+3hO4AnqTADDqY+6w2t6f5zz202tSfw3JO0pnBWYHePnbvujSvp3jAtWD779CHUCDwr2M79ptM7QmC7v8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH0PR11MB5781.namprd11.prod.outlook.com (2603:10b6:510:14a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Wed, 8 Oct
 2025 17:49:50 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 17:49:49 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Check CT enable state before deregistering
 exec queue
Thread-Topic: [PATCH] drm/xe/guc: Check CT enable state before deregistering
 exec queue
Thread-Index: AQHcNVUHNYl88hkU00KcGAEuISb0DrS2ynHwgAADwICAACjCkIAAESoAgAGA2WA=
Date: Wed, 8 Oct 2025 17:49:49 +0000
Message-ID: <DM4PR11MB545661AA32D3C173E33DAC2BEAE1A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251004173033.2511250-2-shuicheng.lin@intel.com>
 <DM4PR11MB5456A079CF5E4276AE13580EEAE0A@DM4PR11MB5456.namprd11.prod.outlook.com>
 <aOUtP+15UGWK1YaB@lstrano-desk.jf.intel.com>
 <DM4PR11MB5456FBB99875139BBC207BA9EAE0A@DM4PR11MB5456.namprd11.prod.outlook.com>
 <aOVd1vor49g67mHt@lstrano-desk.jf.intel.com>
In-Reply-To: <aOVd1vor49g67mHt@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH0PR11MB5781:EE_
x-ms-office365-filtering-correlation-id: 9e47931f-652e-44d0-7fd4-08de069313fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RkF2YzRDK1RwUkpzT0FmWEd0ZHg3dVk2YUx6WXRncFhXeDQvd3dValZEYXRG?=
 =?utf-8?B?N2dqR29hVy9nbzh2czlobHg2MC9uMXR2WWd3c3Z6eko0UW0xQjNhdkRDN1ly?=
 =?utf-8?B?ZUdSR3IwNXVSZEZ1THJ5aVFpayt6Yi9DY1g4N3czaGp5ajQyWHBQT3UrMGkr?=
 =?utf-8?B?TUhpb2FGK0VudXpiMXo5U2p1dkpKUUoyMlFldWk3bGJGMkNHcC9zZlNHdUJq?=
 =?utf-8?B?cFpGZld5ZXVPNk05amVpSjh2RDdKR2RoUlZUazFHbXJUek1vdTFvMXdmRG1V?=
 =?utf-8?B?OW5jUTVqYW8xZGhYNzEzREhiRjdzYW53dnozdjV4RC96R2xvbitJOEtiYkRO?=
 =?utf-8?B?TEJ2Q01tb1FIaDJHMldncThHQWdrUmlZQmNjQ3BJcnV6QS90aUhjMEhsdlVO?=
 =?utf-8?B?azVUYnhuOUNiRmxNbkdpMmFtTGxOdzduQ3RRbkZxREpISUdTNzRHRkhRQ3Zx?=
 =?utf-8?B?QmQxYUZwN2gwLzhVVFFMa2lGajZjcmNIVlZkcGtMSEVqdFNxanhsOVIvWlNu?=
 =?utf-8?B?bTdlamxHVjJSSnZBalhrZmtqVGdZb0pmdUxVR0h6SWlUY090NnVUTlRxTWtv?=
 =?utf-8?B?cXQvVnBXdXFzbGdYV095NWRXVEhPRXJTZGpjdy9JbFZ1NEMzWHlrT3Z3SzlO?=
 =?utf-8?B?c3owUUZhRlRCSGNzSFZTT21ZeS9aZG1EREV0UUN2WUd4MFZBM3R1dGdmTnh0?=
 =?utf-8?B?d21Kcnc4WjVFOUtjRHEyZ3IvaXhsdGtQUjArTlZMcC9nUWg2a3AzaFJFMVhR?=
 =?utf-8?B?ODlyNU9wV3cyRWRJQXYvbHZFaGFieVkza0U3a3FMdmVjZkYyeFJLYjF2Zy9x?=
 =?utf-8?B?clc5RXVJNkRFRWk5NjRlT3dvL25mUWYreHNYQVhYcnpiRG5wekRMWnFDZjlP?=
 =?utf-8?B?UnRSam43VVJyUmdVV2hDRnl1Z1lVUkR2aTNYSElBL3U1WWlPdmFHbXB5d3Jp?=
 =?utf-8?B?cGpva2t5V1FoUTBmdjI4eWZXUHhWRW12Um1iSXN4Nk9ORXZKZ2w2VTVabWJ5?=
 =?utf-8?B?NkFBOXNabE5lNEFrMUVDaC9VblAvbFYxZTQ4TlhsR1dBZk5XV1BVWUJ0SVRj?=
 =?utf-8?B?d3cyeUYxZVZ3LzdjV0dnUzJJaFNDZCtuUWYvQVYyd3FUZFVYWmhURVBOMTV0?=
 =?utf-8?B?bkhzaUxVOEE1cXpCWGs2TWsyOUovdUxxamF5S2lHampXUE56ZmRiY0g3U1F2?=
 =?utf-8?B?Unp2YXgvYi9KVTVSOUcwZDlzZ20xeFgzbUkzZ3FqQTRLWGpXVC9QT1RQcEdG?=
 =?utf-8?B?V1R4SzNUcHo4bFFKak9jWUhWUFdsOW1QQXpvSUk3R3F1Q2tTTDNCQmQrV1NM?=
 =?utf-8?B?aFZWU1FhbUFxTlFOanBqQWlkZnFqb0E5czZKN2xyNjVMZlpFemNFaFVJbHVQ?=
 =?utf-8?B?cmZvMnJ1Y2hXVndTRUhDMDk0ZnZ0b25XTXkrWGJFcHg4Mm5PN0tNTjkxbEVS?=
 =?utf-8?B?V0FnVHJIeFVQWkc5eFNzTUQ4bWRDS0JvSC9Cd1ZHeVdsekUzWkYvQURzcFA1?=
 =?utf-8?B?aThrSVgzdjFaZm13dzhiY3pZcUt1MVJWK3RJalRMNG05WUxWSmRJQ0lQTERS?=
 =?utf-8?B?eTYzTnB0NFZIakorcHE4WnZDRzROUTQvZlkwS2JMUGZ0RitMam9IazhJU05F?=
 =?utf-8?B?ZnRBL1FaNVBJM0pTdG1RbjMzWlJYdmJZbzV6eVlUOWlRcVROWFZGYU9RdU5z?=
 =?utf-8?B?YWRsNVpEeGxBYUJMbVZkQVZ5SGg0RW5mcUZIcGhyYnJYV3JZWFNmSWxaNWJn?=
 =?utf-8?B?RjB2a1FKdFp3WGw5RmNhYTRhdzZud1k3YmR3V1BJckc3UDdSU3BEbUd3WlB2?=
 =?utf-8?B?aU1rVXpBVDlyMG15WFRKYThXdmp4dXNQSlRZQ3B6ZmJPU2NUenh1allzMTBy?=
 =?utf-8?B?eVVvUHlPNm02ZzAzakN5ODBnZzNsb0c4Y0JBN3Fvc2ozK0tIOEgzV2s3L1NS?=
 =?utf-8?B?dVZVaE9JT1NOQTdLWExqclM1bHRhTTBwTVRTZ1VoU3VaeGorNUMvS1l3RW9w?=
 =?utf-8?B?cXZ4UHZ4R1RnWmwzSW5XSk1LQU5xRk1NSUNVSkU3Syt6bkh0UkZBQ1NUQklK?=
 =?utf-8?Q?JrIsbD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVkxcnNMbTQwMFk1WUtyS3M0ZENRT3YyRzVVSGt2V0w5WWJ2eWJ6djhCVzB3?=
 =?utf-8?B?VGo1YVNoRkw0aEplcUplRDV0TitCTFhBRHFnQ3U4RGRhcVltUllaYkZVdlUw?=
 =?utf-8?B?SFNUN2tMeTI5ZDc3SjAxMTUyWnJaNlFvM1BrNEZDL0xSR1BtYVFCT1Q0V1k0?=
 =?utf-8?B?cUdqWWZ4aDVoV1dIUDZGamM1dzVCTnE2alZaSHl3NlU4aFpsbG1zREh2R0VL?=
 =?utf-8?B?RjZiOVFMMHcxMVB0RUI5bE5TQmJ3YXp3Qnh3RVV2Zkk4VVNGUXJvRUt4eGE0?=
 =?utf-8?B?eUlaSnkvSk53djQzclJwUDJST2ZFQmxyWEtKeXdDT3R6RE1YMGVrK0ZhWVl6?=
 =?utf-8?B?aWpVeGlwL0NhaVZCaVlpOHpSNHNLREZEcVZ1UE5aTE9LOTZzZnZLclBWOHVR?=
 =?utf-8?B?WUpIbmRydjJCQTFtdHhvMzJQa2Rxem5ZWTdzL0VjQXBaVVMraGpINUVrR1ho?=
 =?utf-8?B?UDZEWDhlOWV0RmZVaHpuQVMycE00QjZlN0J4VTkzVThLODltZHFsSzBMSEdK?=
 =?utf-8?B?Q2xHTTBud1BwZ2pBeWhZSHNFNjFHN29PVndzMDJ0N0dyMnB0NHJlbjZ1ckdp?=
 =?utf-8?B?ayt1YXRJQnpRREE5RGc0cEkxM0VvWlZDNjA2UXg1RmlEMWVhcGpzbVRtTHNT?=
 =?utf-8?B?cERYak9KNUtaTTRRT0tDMEM5UEp0VGdXUy9sbTVIblBKajZaUjNzeDdkdVRY?=
 =?utf-8?B?b29POEhnK2Q0aFdaU2tGMjNwZUNVM2E5Q2tqRkR0VUl3bDZpd2VJTnp6V24v?=
 =?utf-8?B?Q2xQNzBuT0hSbFBSbXRESGdQRHByMG96VmRJcUhzZ0h2bEdJV2g3M2NldjVn?=
 =?utf-8?B?WTJJME5kTVlQTGQyS0pFT3ozMDk0M2FzZE9URHl6YVEzSzJQR2dJK1VzQjB4?=
 =?utf-8?B?ZnVId3pmcGpDTHc5Sy9xN0NiUDVscnZVdzd1d25KaGE4TXNhSkZtb3ZLd0V0?=
 =?utf-8?B?SzVyT2lIZkZhbFJ6ZkpoOUNIVFlWVDFEN0QzZWYrbnJRc3VyOUZjcnFEdHcx?=
 =?utf-8?B?aWtCSDVEY3BtTzlOc1hickQ4bmxZTUN6dm5DTXd4VVpIbW5tRG9vQUhSM29E?=
 =?utf-8?B?OUdPcXBXb0ZTT054VVJweG9VdzA3NlRXR0Zod0lKZ240cnNjaDBGVm9vb3cy?=
 =?utf-8?B?WnFBWW9SYkRYYnhXVFRQKzlkblFHL3BiMGxrZjBLeDJGOG9tS1BIaVZTNkJa?=
 =?utf-8?B?cHdXcUVKL1hLU3VDb1diZHhWZlc4emUxSW5LSHYvTzVLdCtWTDFTbm54RmdW?=
 =?utf-8?B?ZmtZS2tRUjZmTnZDUFhtcTdORncvU1JRVC83THg3N3VhS3h4dFRDVlBIa3Ez?=
 =?utf-8?B?RXdHN0NFU3hpVUZrUDFVZzZnZmpnVVFKS2FwWEJFSnVpdVdWL1pSWDJRWXZO?=
 =?utf-8?B?TVZrZHE2WHdKZDFacXNDemFhaWpRMmtZR1RlYmRHSTFSVERUaGdaanVwR2pJ?=
 =?utf-8?B?S1dBb3BUL29zZHdTQkNUdjRNMTlFSFdkaWY4YkVuVjhzVVk3UHArYkM5T2Ex?=
 =?utf-8?B?QmFLYlIvYUhMQjA4RVBHbm9jOEVjeGkyZ3IvMXhnWWR2Y3BuUkZqSjRFbWpW?=
 =?utf-8?B?OGt3d2ZaOTRJWCs0VmY1eEptc3gvbzNlcldsVzZWcnp5S3MrZGFVN3NJQ2hU?=
 =?utf-8?B?NHNNSFVoV3c1SGFUbThOQStpcGRsdjZHRndTRUdjWkY2OHo5WHNESGVTUmUz?=
 =?utf-8?B?eGZuaW9mT3htZiszT3BNWE1rN2EyQW9lbjE1VVd1L3RhY3Z1QXdQclJRa1h3?=
 =?utf-8?B?UzgycGlhVTQwNlFCclRTVGxJNlBRZWt1WkoyZDZqajAyZWRNUlVtQVRDMmxK?=
 =?utf-8?B?T2hmTllZWjA5WDFxcHE4RWRKVUo5TE84dVY2WWtURjRTQ0JiVkZXSk1hUXBG?=
 =?utf-8?B?RU9uWTFLbHNaSWY3TGEzVVRYdW8wOXgwVVVoRHl4K09aVGE0RXhmQWovNVhh?=
 =?utf-8?B?SWZrZEZxWDhsM0JGZFA2NnlSendwVDdLSWhaNzFtZkozTzc1R0ltald1dUZr?=
 =?utf-8?B?SFpZaTRZaGJjZ2NSbkJJU1Zkb091U281VTlZUlNlbnNyWVoxOW4ydzRGdk54?=
 =?utf-8?B?Q0QvZGdLM2Z3R1JYK0pHNlZGZlBMbXhwRVRwb2w1dkx2UFZZQWpJdy9VUlJ2?=
 =?utf-8?Q?zhvpdXXEtjlbp9CHuTI4xSfM8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e47931f-652e-44d0-7fd4-08de069313fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2025 17:49:49.5805 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Br2FGdD9XyV4T243Hra3rSS2/MSDgfKTJuBDHKTROWXkgoTMZbMtSF1ZNCfWNu4HtWMQF/FtszhLIMjujV9EWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5781
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgNywgMjAyNSAxMTozNyBBTSBNYXR0aGV3IEJyb3N0IHdyb3RlOg0KPiBPbiBU
dWUsIE9jdCAwNywgMjAyNSBhdCAxMTo1OTozMEFNIC0wNjAwLCBMaW4sIFNodWljaGVuZyB3cm90
ZToNCj4gPiBPbiBUdWUsIE9jdCA3LCAyMDI1IDg6MTAgQU0gTWF0dGhldyBCcm9zdCB3cm90ZToN
Cj4gPiA+IE9uIFR1ZSwgT2N0IDA3LCAyMDI1IGF0IDA4OjU5OjI1QU0gLTA2MDAsIExpbiwgU2h1
aWNoZW5nIHdyb3RlOg0KPiA+ID4gPiBIaSBhbGwsDQo+ID4gPiA+IENvdWxkIHlvdSBwbGVhc2Ug
aGVscCBtZSByZXZpZXcgaXQ/IFRoYW5rcyBpbiBhZHZhbmNlLg0KPiA+ID4gPg0KPiA+ID4gPiBC
ZXN0IFJlZ2FyZHMNCj4gPiA+ID4gU2h1aWNoZW5nDQo+ID4gPiA+DQo+ID4gPiA+IE9uIFNhdCwg
T2N0IDQsIDIwMjUgMTA6MzEgQU0gU2h1aWNoZW5nIExpbiB3cm90ZToNCj4gPiA+ID4gPiBJbiBu
b3JtYWwgb3BlcmF0aW9uLCBhIHJlZ2lzdGVyZWQgZXhlYyBxdWV1ZSBpcyBkaXNhYmxlZCBhbmQN
Cj4gPiA+ID4gPiBkZXJlZ2lzdGVyZWQgdGhyb3VnaCB0aGUgR3VDLCBhbmQgZnJlZWQgb25seSBh
ZnRlciB0aGUgR3VDDQo+ID4gPiA+ID4gY29uZmlybXMgY29tcGxldGlvbi4gSG93ZXZlciwgaWYg
dGhlIGRyaXZlciBpcyBmb3JjZWQgdG8gdW5iaW5kDQo+ID4gPiA+ID4gd2hpbGUgdGhlIGV4ZWMg
cXVldWUgaXMgc3RpbGwgcnVubmluZywgdGhlIHVzZXIgbWF5IGNhbGwNCj4gPiA+ID4gPiBleGVj
X2Rlc3Ryb3koKSBhZnRlciB0aGUgR3VDIGhhcyBhbHJlYWR5IGJlZW4gc3RvcHBlZCBhbmQgQ1QN
Cj4gY29tbXVuaWNhdGlvbiBkaXNhYmxlZC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEluIHRoaXMg
Y2FzZSwgdGhlIGRyaXZlciBjYW5ub3QgcmVjZWl2ZSBhIHJlc3BvbnNlIGZyb20gdGhlIEd1QywN
Cj4gPiA+ID4gPiBwcmV2ZW50aW5nIHByb3BlciBjbGVhbnVwIG9mIGV4ZWMgcXVldWUgcmVzb3Vy
Y2VzLiBGaXggdGhpcyBieQ0KPiA+ID4gPiA+IGRpcmVjdGx5IHJlbGVhc2luZyB0aGUgcmVzb3Vy
Y2VzIHdoZW4gQ1QgaXMgZGlzYWJsZWQuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBIZXJlIGlzIHRo
ZSBmYWlsdXJlIGRtZXNnIGxvZzoNCj4gPiA+ID4gPiAiDQo+ID4gPiA+ID4gWyAgNDY4LjA4OTU4
MV0gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tIFsNCj4gPiA+ID4gPiA0Njgu
MDg5NjA4XSBwY2kNCj4gPiA+ID4gPiAwMDAwOjAzOjAwLjA6IFtkcm1dICpFUlJPUiogR1QwOiBH
VUMgSUQgbWFuYWdlciB1bmNsZWFuDQo+ICgxLzY1NTM1KQ0KPiA+ID4gPiA+IFsgIDQ2OC4wOTA1
NThdIHBjaSAwMDAwOjAzOjAwLjA6IFtkcm1dIEdUMDogICAgIHRvdGFsIDY1NTM1DQo+ID4gPiA+
ID4gWyAgNDY4LjA5MDU2Ml0gcGNpIDAwMDA6MDM6MDAuMDogW2RybV0gR1QwOiAgICAgdXNlZCAx
DQo+ID4gPiA+ID4gWyAgNDY4LjA5MDU2NF0gcGNpIDAwMDA6MDM6MDAuMDogW2RybV0gR1QwOiAg
ICAgcmFuZ2UgMS4uMSAoMSkNCj4gPiA+ID4gPiBbICA0NjguMDkyNzE2XSAtLS0tLS0tLS0tLS1b
IGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0gWyAgNDY4LjA5MjcxOV0NCj4gV0FSTklORzoNCj4gPiA+
ID4gPiBDUFU6IDE0IFBJRDogNDc3NSBhdCBkcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3ZyYW1f
bWdyLmM6Mjk4DQo+ID4gPiA+ID4gdHRtX3ZyYW1fbWdyX2ZpbmkrMHhmOC8weDEzMCBbeGVdICIN
Cj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFNodWljaGVuZyBMaW4gPHNodWlj
aGVuZy5saW5AaW50ZWwuY29tPg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jIHwgMiArLQ0KPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiA+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiA+ID4gaW5kZXggNTMw
MjRlYjU2NzBiLi45ZDMzZjYzZDk3MmIgMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiA+ID4gPiBAQCAtMTQ4OSw3ICsxNDg5LDcgQEAgc3Rh
dGljIHZvaWQNCj4gPiA+ID4gPiBfX2d1Y19leGVjX3F1ZXVlX3Byb2Nlc3NfbXNnX2NsZWFudXAo
c3RydWN0IHhlX3NjaGVkX21zZyAqbXNnKQ0KPiA+ID4gPiA+ICAJeGVfZ3RfYXNzZXJ0KGd1Y190
b19ndChndWMpLCAhKHEtPmZsYWdzICYNCj4gPiA+ID4gPiBFWEVDX1FVRVVFX0ZMQUdfUEVSTUFO
RU5UKSk7DQo+ID4gPiA+ID4gIAl0cmFjZV94ZV9leGVjX3F1ZXVlX2NsZWFudXBfZW50aXR5KHEp
Ow0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gLQlpZiAoZXhlY19xdWV1ZV9yZWdpc3RlcmVkKHEpKQ0K
PiA+ID4gPiA+ICsJaWYgKGV4ZWNfcXVldWVfcmVnaXN0ZXJlZChxKSAmJiB4ZV9ndWNfY3RfZW5h
YmxlZCgmZ3VjLQ0KPiA+Y3QpKQ0KPiA+ID4NCj4gPiA+IENoZWNraW5nIHRoZSBDVCBoZXJlIGlz
IG5vdCB0aGUgY29ycmVjdCBhcHByb2FjaCDigJQgdGhpcyBpcyBhIHN0YXRlDQo+ID4gPiB0aGF0
IGNhbiBjaGFuZ2UgYXQgYW55IHRpbWUuIEZvciBleGFtcGxlLCB0aGUgQ1QgbWF5IGdvIGRvd24g
YW5kDQo+ID4gPiBjb21lIGJhY2sgZHVyaW5nIFZGIG1pZ3JhdGlvbi4gSWYgeW91IHJhY2Ugd2l0
aCB0aGF0IHN0YXRlIGNoYW5nZSwNCj4gPiA+IHRoZSBHdUMgd2lsbCBob2xkIHJlZmVyZW5jZXMg
dG8gdGhlIHF1ZXVlLCBhbmQgdGhpbmdzIHdpbGwgcXVpY2tseSBnbw0KPiBzaWRld2F5cy4NCj4g
PiA+DQo+ID4gPiBJIHRoaW5rIHdoYXQgeW91IG5lZWQgaGVyZSBpcyBhIGRyaXZlciB1bmJpbmRp
bmcgY2hlY2suIERvIHdlIHdlZGdlDQo+ID4gPiB0aGUgZGV2aWNlIGR1cmluZyB1bmJpbmQ/IElm
IHNvLCB5b3UgY291bGQgZG8gc29tZXRoaW5nIGxpa2U6DQo+ID4gPg0KPiA+ID4gaWYgKGV4ZWNf
cXVldWVfcmVnaXN0ZXJlZChxKSAmJiAheGVfZGV2aWNlX3dlZGdlZCh4ZSkpDQo+ID4gPg0KPiA+
ID4gU2hvdyBtb3JlIGxpbmVzIElmIHdlIGRvbuKAmXQgd2VkZ2UgdGhlIGRldmljZSwgd2XigJls
bCBuZWVkIHNvbWUNCj4gPiA+IHhlX2RldmljZS0gbGV2ZWwgZnVuY3Rpb24gdG8gaW5kaWNhdGUg
dGhhdCB0aGUgZHJpdmVyIGlzIGJlaW5nIHVuYm91bmQuDQo+ID4NCj4gPiB3ZWRnZWQgZmxhZyB3
b24ndCBiZSBzZXQgZHVyaW5nIHVuYmluZCBwcm9jZXNzLiAgSG93IGFib3V0ICJndC0NCj4gPnVj
Lmd1Yy5zdWJtaXNzaW9uX3N0YXRlLmVuYWJsZWQiIHNldCBpbiB4ZV9ndF9zYW5pdGl6ZSgpPyBJ
IGd1ZXNzIG5vIHNpbmNlIGl0DQo+IGlzIGxpa2UgeGVfZ3VjX2N0X2VuYWJsZWQoKS4NCj4gDQo+
IHhlX2d1Y19jdF9lbmFibGVkIHN0YXRlIGNhbiBjaGFuZ2UgaW4gcXVpdGUgYSBmZXcgcGxhY2Vz
LCBJIHRoaW5rDQo+IHVjLmd1Yy5zdWJtaXNzaW9uX3N0YXRlLmVuYWJsZWQgaXMgYml0IG1vcmUg
cmVzdHJpY3RpdmUuDQo+IA0KPiA+IEhvdyBhYm91dCB4ZV91Y19md19pc19ydW5uaW5nKCksIG9y
IHdlIHNob3VsZCBub3QgcmVseSBvbiB0aGUgZ3VjIHN0YXRlLCBhcw0KPiBpdCBtYXkgYmUgY2hh
bmdlZCBsYXRlcj8NCj4gDQo+IEkgdGhpbmsgZWl0aGVyIG9mIHRob3NlIHdvdWxkIGxpa2VseSB3
b3JrLiBJdCBzaG91bGRuJ3QgYmUgcG9zc2libGUgdG8gZW50ZXIgYQ0KPiBzY2hlZHVsZXIgd29y
ayBxdWV1ZSBpbiBub3JtYWwgb3BlcmF0aW9uIHdoZXJlIGVpdGhlciBvZiB0aG9zZSBpcyBjbGVh
ciAoaS5lLiwgSQ0KPiBiZWxpZXZlIHRoaXMgaXMgb25seSBwb3NzaWJsZSBpZiB0aGUgZHJpdmVy
IGlzIHVubG9hZGluZyAvIHVuYmluZGluZyBvciB3ZSBoYXZlDQo+IHdlZGdlZCB0aGUgZGV2aWNl
KS4NCg0KSSB3b3VsZCBsaWtlIHRvIGdvIHdpdGggdGhpcyB3YXkuIExldCBtZSBmdXJ0aGVyIGNo
ZWNrIHRoZSBwbGFjZXMgdGhhdCB3aWxsIHVwZGF0ZSB0aGUgc3RhdHVzLg0KVGhhbmtzIGZvciB0
aGUgZXhwbGFuYXRpb24uDQoNClNodWljaGVuZw0KDQo+IA0KPiA+IFlvdSBwcmVmZXIgdG8gYWRk
IGEgbmV3IHZhcmlhYmxlIGxpa2UgInhlLT51bmJvdW5kIiwgYW5kIGNoZWNrIHRoZSBiaW5kDQo+
IHN0YXRlIGhlcmUsIHJpZ2h0Pw0KPiA+IFRoYW5rcy4NCj4gDQo+IFRoaXMgbWlnaHQgYmUgYmV0
dGVyICg/KSwgYSBiaXQgb2YgYSBiaWtlc2hlZCBhbmQgSSdtIHBlcnNvbmFsbHkgZmluZSB3aXRo
IGVpdGhlci4NCj4gT3RoZXIgbWlnaHQgaGF2ZSBhIHN0b25nZXIgcHJlZmVyZW5jZSB0aGFuIG15
c2VsZiB0aG91Z2guDQo+IA0KDQpPbmUgY29uY2VybiBhYm91dCBzb21ldGhpbmcgbGlrZSAieGUt
Pmd0LT51bmJvdW5kIiBpcyB0aGF0LCBzaG91bGQgSSBzZXQgdGhpcyBmbGFnIGF0IHRoZSBiZWdp
bm5pbmcgb2YgdW5iaW5kIHByb2Nlc3Mgb3IgYXQgdGhlIGVuZCBvZiB1bmJpbmQgcHJvY2Vzcz8N
CklmIGF0IHRoZSBiZWdpbm5pbmcsIHRoZSBHdUMgbWF5IGJlIHN0aWxsIHJ1bm5pbmcgYW5kIGd1
YyBjb21tdW5pY2F0aW9uIGlzIHN0aWxsIGFsbG93ZWQuDQpJZiBhdCB0aGUgZW5kLCBpdCBtYXli
ZSB0b28gbGF0ZSBhcyB0aGlzIHBhdGggbWF5IGJlIGNhbGxlZCBkdXJpbmcgdGhlIHVuYmluZCBw
cm9jZXNzIGFsc28uDQpJdCBzZWVtcyBJIHNob3VsZCBzZXQgdGhlIGZsYWcgYXQgdGhlIGJlZ2lu
bmluZywgYW5kIGNvbWJpbmUgdGhlIGd1YyBzdGF0ZSB0b2dldGhlciB0byBkZXRlcm1pbmUgdGhl
IGJlaGF2aW9yLCB3aGljaCBzZWVtcyBzb21laG93IGNvbXBsaWNhdGVkIGFuZCBtYXliZSB0b28g
cmVzdHJpY3RpdmUuDQoNClNodWljaGVuZw0KDQo+IE1hdHQNCj4gDQo+ID4NCj4gPiBTaHVpY2hl
bmcNCj4gPg0KPiA+ID4NCj4gPiA+IE1hdHQNCj4gPiA+DQo+ID4gPiA+ID4gIAkJZGlzYWJsZV9z
Y2hlZHVsaW5nX2RlcmVnaXN0ZXIoZ3VjLCBxKTsNCj4gPiA+ID4gPiAgCWVsc2UNCj4gPiA+ID4g
PiAgCQlfX2d1Y19leGVjX3F1ZXVlX2Rlc3Ryb3koZ3VjLCBxKTsNCj4gPiA+ID4gPiAtLQ0KPiA+
ID4gPiA+IDIuNDkuMA0KPiA+ID4gPg0K

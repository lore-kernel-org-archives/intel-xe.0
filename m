Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C69CCA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 18:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED0010E034;
	Thu, 28 Aug 2025 18:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nICbQiBu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5820110E034
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 18:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756407592; x=1787943592;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=d5tbI895Do3VWkfR5JCW22nfe0EXMGm+45dwQ6FoTTI=;
 b=nICbQiBuQ0tPy5MXSLm6lgUFS5rQ7W/0YASUGClRyn62T6HZbRkPiQzo
 zNCSnEWT377hrbojNPA4wdh9eviCxFN9HX60pwV/XbHJcRZQhEiWmCJ79
 HpLNOMyWbfZS2GPsSnEltVy3Roa8zuRst5A017d1fOASAqzz7EvOV4u7u
 kKtPTaNrzo2trt2eyScGx9ZHP46oNU44ftL2z8MBuUYr4ChX+r2VEF3em
 F7t7O/drgnZVw+R2Ki6WcmdFv+j7UBXdEWzUiQ72muAm0OitA8FFVDyZu
 nn206+LGT+ZcbDgVcSTtCxPDf4x6KiaaxKXsSmK2+9R35mzxMKNsKLkDR A==;
X-CSE-ConnectionGUID: L4fFUZfLTeijDGrjmnmHww==
X-CSE-MsgGUID: mZq8nI/FTSyy2JgzTn9kZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69283456"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="69283456"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 11:59:52 -0700
X-CSE-ConnectionGUID: fsELrcQbRTqvUy3pbKCQOQ==
X-CSE-MsgGUID: kYoWvWL4SY+UnnNl0/UZpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="174569837"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 11:59:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 11:59:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 11:59:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.76)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 11:59:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YprWkzAUh65PrGooaxmdic1+yw1wPLBXev+ZZQDJCI7NYgXLFqcI58doJ7ALQJD+NRPUvfTRAdZTBMKhCxwCYNK0sT69o+loZXn4YjT2rFmDLkjvUaaSz4vOOCTGlfbWT7u9TsTIbAyoll7pc0ZSbvgsgCpxUmtn9Bx5NPiGqQvHEpaMUHbTHRJhw+qFu1DVNwhWlczKoAQkWYO+kCGAKrVHAax9g8nVcC1b86d+9Y74zYC5MCbosYFgKdmPYqlU01rXgMJxrAfcSEWwYDBpogTFBXJnXRww+TV4lkTJNH3EhVI9rm5T8CsyGWlTiABuHm1X2H6bP/07Pd1cKDPxhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5tbI895Do3VWkfR5JCW22nfe0EXMGm+45dwQ6FoTTI=;
 b=PeVBwWPJN17M8BisIDiSMJ/QTxVlEc1KmQPqw4d/kWK7gLH1bdfISxY0gRSPc3ZV1nJDs4TtUQYNWCjrKvYpPOoVCIHJboca2jp4axuZ/L3D7gbDRbfy8Usyy/Cmu8zwPqGihyGJ8XL+lTus1IfwA+fg9gXdirq6dc/NMkm2GM0kdOCHXf0mjMMImdrJ5A43nvo5XYX1gFepc/WTEhuTK0qWfLnMFbufixnxD16PPCxhwPHhFC1L6m0cdkzrnpm9pNOEvvqBS+i661piEfpmnMk9gNL5OwVjhtO80PckKOtsgpvZF5Q2y8ks1rJ/IjJBeOGA06EKoDx3sWms2Pg5vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CY5PR11MB6341.namprd11.prod.outlook.com (2603:10b6:930:3e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.22; Thu, 28 Aug 2025 18:59:48 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9052.021; Thu, 28 Aug 2025
 18:59:48 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Update GuC log buffer type value
Thread-Topic: [PATCH] drm/xe/guc: Update GuC log buffer type value
Thread-Index: AQHcF5zmd8mt97z5gU+1KB7AkZwgObR4bJ6A
Date: Thu, 28 Aug 2025 18:59:48 +0000
Message-ID: <658967b09cecdf0f20ad3547d4ab5ed3e016964d.camel@intel.com>
References: <20250827215217.1030775-1-zhanjun.dong@intel.com>
In-Reply-To: <20250827215217.1030775-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CY5PR11MB6341:EE_
x-ms-office365-filtering-correlation-id: 7e3dc248-8e20-4ed1-2d0a-08dde6650fbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VnhkTHRORlF5NTV3bjV5SjJQeVJYRDZYRjE0YXhWNVVycDhzNXdRTUNaeXVS?=
 =?utf-8?B?MUtadW5OTXdodlBpN3BucjhKb05SbUs4RWZ5NmxXd2tTcmNRcXNpbUVPN1c4?=
 =?utf-8?B?UkUzZlRKZHRlSVY3cWhaSEJacE0wT3dJeUhOU1BSVitmbXY2a0h2eWR1eDlp?=
 =?utf-8?B?a090S0hxVjdqNU9aeDU2SUE0V25xNXhZZ1UvckJMQkt3Nk0wYk8xWnJXaDFH?=
 =?utf-8?B?WTk5b3JTd085TXUvdVQ4QThDYWY3ZnhJajZEanQ0NWhtMkNWSDJrVFlnQVlu?=
 =?utf-8?B?YXNwaFAyeG1xVGtnVFpKNzRVL2lPM0JLckdoeHFYYjhXRFNrc0RBWjlxN1JU?=
 =?utf-8?B?RjRaZTROckkvUmlYZWN0RkFSaDB6VlRrQjRLZFFmb0VFVmVobXBuaDk4UHRY?=
 =?utf-8?B?clhSZEdFYS84K0dDOWdMZHBZRkJBZ1dmZVAwUUdGNkVObVFnMzZKaUppWXJT?=
 =?utf-8?B?bFpOa3VZK0ZrUlc5UGdJOEtkWmVWSTVRdDNMOEE2cmpMbjZuaVNWSFVONE1t?=
 =?utf-8?B?cVJVNXloTmF1V0YrU1NuaFZCNWdibncyMjQwc1U0WVNFb2pPQWhLRjQydnFH?=
 =?utf-8?B?clg2aWR6ZnFhMkk4WC9sUTVaSmpmN2IyS2pCeEJvVkx3UDNKVTF1N2xrajVl?=
 =?utf-8?B?dVhCRTRIWCt6b2ZSMWxyanh4bTBjWjZwT3RvbC9KYkNPV200R015TkQrNkZD?=
 =?utf-8?B?YzlkSXo1ekNTckllb0VHSjF6alJMNGxOWEhpSkI0UEJteENqNys2anNlbGdQ?=
 =?utf-8?B?Vk9hdzNaTFlhTmlaRnNqNEQ3MmxlUkg1QWw3cVE3QzZxWkhkM2U3dllKand1?=
 =?utf-8?B?YmJqRkJJYW5Fbm1PWGJqbDVyUzlNUldqTTdiNkR5MjBEZEtlWllHTk4zMjUr?=
 =?utf-8?B?dWZuaVRRNzRyMmhqSjE1TjNvOTNJSmFhc2JNWC82WFVoU2dHdkFCU3pteTdr?=
 =?utf-8?B?Y2ZSL3VVWUk5S2ZKdHl6dGhCSDFsekROQ0xTSlhzUmRVc21RNXFHendVNzBq?=
 =?utf-8?B?aWFJQ0tSY0wyYURDb21VWUNyU1JFbDBZV1ZZQW02S3JLcUtkai9vUUw0YXVU?=
 =?utf-8?B?Um16TWNPQzU1aUtpSURFM2pLZWFMOFhiTHdhRHVtNFhHOFQzUjlyYk1Cd242?=
 =?utf-8?B?Mnh3RUJVa1FteWdXTlBlVTlrVWlkVktkZytqRUFrL25sZFdpSUtoM2hLNnBm?=
 =?utf-8?B?WWZRc2c4ajFHVmNMYUt5U05MYTBKYXFPSnpMUTNVd2U3NmhqNnNsbzZtMUd6?=
 =?utf-8?B?WG1LaGMrMXNCTGJKYkhkNEJFNm9qQ28wTFZqMlFxMkxHZWkvYTF4eHlpdDVE?=
 =?utf-8?B?SzZsVkVocS9LT21wTTBoZWFQVGVpVmpLQXFtajhSelpLaTdSUml0K0luMTdO?=
 =?utf-8?B?WFAxN212V3l1SGhWYWpjTUIzWGhIMCs4a3JlSERSMlF6eUJ1NGJtaU50U0Jq?=
 =?utf-8?B?OW92Y3FYTnVXclJoazJYOUtnSHE5SE4rQldsdmJxdERiY3FkMU40dlVjUTRO?=
 =?utf-8?B?Mi8xUDJ1M0tLd3p6cE9Cbi9YOEovWk9DMXVTRHRrK0t1WWdSRkRPVFV3VnU0?=
 =?utf-8?B?M1NtcEpid2liUkxxb1pudjF3RWJFRnp5aFRLVkx4ZjZWM2tMbEd5ejZ2TklF?=
 =?utf-8?B?OUlwL2R2cHpGd3gyK29XUXBJR2tvb3ZuVXF6K29CZWtFczRDZzVQejZ4TjFB?=
 =?utf-8?B?QkZEemYzMmNyYy9LcThqakc0TXdyM2pZMHQwT1Z6ZGZId0NKRmtKbHBhVTdx?=
 =?utf-8?B?Mlg0ajNnQmhvdTN4b1NwMTFTY3dRUXc2VUZObUFMczBvSFQrREsrUTlHOWFu?=
 =?utf-8?B?M3pXMERaZ2FhVTJzSlVUTVFPeUJwNFBFQ1crbXY2clJaelZTS2ZRVHlkcHhp?=
 =?utf-8?B?K0xPR1BGT01TT0hEL09KMUw3blJSUWNIWHVPU3lDYnI3QW5Ha2pnRnpKV2FR?=
 =?utf-8?B?SHlGZVVrUHIrSEh0UHJvbHJjOG5mSzdXa2ViTDhjS0x3dlk5MUNscThIbXli?=
 =?utf-8?B?MGdnTnhvZ21RPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUJVbGFKaHF6MHQ5bWUwT3VrYWt2YWlVTHdxVXhiSUtSeWxxN1JVTmFDc2hK?=
 =?utf-8?B?S21FVnRKRlVjQVVLYTB0Z1k0YTA5VDVaLytBR2Q0b1hiMmVLd01qZ2RZbnV6?=
 =?utf-8?B?bzZUTWhSbWxEbGFFWGRCenZROFF6dlNIYS8zdkV6NnR3Vnl6YWhpWDE5RUh6?=
 =?utf-8?B?ZXRpOW5GTUJ3QzE5WVcrcHNSQ3R0amlvTkhGM29rRmdKSk42VjcyZVVySm9n?=
 =?utf-8?B?WjJzYmpOQjkxVGpFNFJXQXhJejYweWdVOFhHMVNWVVE5TWduNTkyVXNncDdl?=
 =?utf-8?B?blp0Tk95WE9qRSsrYW4wNHdXZjFQSWUwZFEwZHdHR2FlbVpsalJEaVJ5eStp?=
 =?utf-8?B?Q2dUbGhCQlpIZkxYdGZpazF2TTVuWjR5QmNXMjduM0dCL2NORWhEaVdCWjAr?=
 =?utf-8?B?TTJBS2w0cFdEbVlHbWgzcjM0T1huM1hTZnJveFUwdGtYV1gzRmNUYjRQWENx?=
 =?utf-8?B?NzhpeW8vMDRTa1hsUW5kb3czR0twWXFlWjROMVBYNi9SNWN4OUJVY0lVQkxY?=
 =?utf-8?B?MG4xMGIyRmJUOU13c3lhY3ZHSUY1emdFTXVWOGZQU2czdDR4bUEwNUhuWE5S?=
 =?utf-8?B?SmZLQzhwc3FMdGlhWE9zczZBSzFWK1VuRFpkem1wajlUWDI5Yy9iM1lmdVJ0?=
 =?utf-8?B?RGJsME9YQmdDZkxLNU4zd3l1aWdKNDhWcWI4aG1vZVF3RmdIeDl1dXkzdk9V?=
 =?utf-8?B?b0Z0SENwSWxvcUw0bkVsZnJoMXYyb1BvU0phQ2NKc0NEMWg2VVdPMVltU0Zz?=
 =?utf-8?B?aUtkRWFkdHZkZHFGRlNlM2dNdUFhVFlsMmxnUUVwU0c1T09ZOXJhK29lRmwr?=
 =?utf-8?B?Rk92SVFhazJMRnk3MDVpK0syclZIUnRCSXU3MFBVcFNwWURpbzdqOVJHR2tq?=
 =?utf-8?B?Nnh4eEtCNjdKcFd0eS94dVJ5b3JYQUx2V1hZSndaNXRBTy9GMEZTMWpacThT?=
 =?utf-8?B?aDEwTCtRL0MxRVRGakx5Q1ZGUE9XL1NhZlBZY0hpM2FvUW1ZTGFHTGtLL29G?=
 =?utf-8?B?N05hcFpYVnhPdit5S0xWZUMwYnBsYUpBam1TWGJ1THp1eTRTY0RXcUgxTVRn?=
 =?utf-8?B?dTV4TnU0VlpQNnZxZUFwNTdaVWhNa2JaNjB1akFwQWR3TC9oOElsUVdSamVw?=
 =?utf-8?B?aVdybmxVemM3R2dGUWZEdnZKU3AvclVRZmpYdXlQZG9lRW5IbWVBQW5HSUUy?=
 =?utf-8?B?NGpqbi81V21zeEpiMnR5MXZwcnhSbm5YaXFsMXRRR0J5NUlEMHorQUNING1X?=
 =?utf-8?B?N0FYZldxMUdTcTg3cmxnalI0MXZvbnhlOWxYRmt1TkVtN3hrZUtBc3VnQk12?=
 =?utf-8?B?bzZNT0Jhdy9IMUsxNnFsVkxaeHRJV0FvRWgyd3JCWFFvOWdHNy9abTUyNjNS?=
 =?utf-8?B?TFJvUjlOakR2RWIweEhYcUxKM2N1Z3pyYVp0NUo3clJUd0pjdFBPUTAraVZ4?=
 =?utf-8?B?ZkdpTWN3T0RGUzNtRThqZmpVbGl6QTc5blhTSDhCcEdybzZwcU80d0ZVeTI2?=
 =?utf-8?B?dmhKY3Z2Tm4rNkx6VDNNZ2lPbk5zV2Y5d0lMT0JmSWFXYnN2MzRNdU9lTDhI?=
 =?utf-8?B?dXFlZjYyMEFxbndIL0R2akd2MWJMTnJHQVo3M0RpUFFKbnFSWVpraG5qZU41?=
 =?utf-8?B?MGZBK3d3WkY5ZFBSdHg0ZkZsWXNXRkt0V3BqTTdwbmxHclJnVmNnVHhpZHFY?=
 =?utf-8?B?VnpDczdMSnNoUENoU05IK1RhY3JyeUR4ZTUvUTA3TExwY2psN3dXa2pFaHJQ?=
 =?utf-8?B?cHhDVjljRXlmcmhaTzdjVWVzV2xwaXdLNUk2OUsxVkFzNGQxSFRpQWhGY1pV?=
 =?utf-8?B?dzFkQXMxbFdSa0d5b1N2NThWUWRrZTlVVTRjSXcyVTBhcXBmY1JOODdsbjRp?=
 =?utf-8?B?akVYZzFQYkg3QTJNQU1OZEN4Z2RQT1BHQW5YNXc5T0xadkFZMUNUUm8rSmhh?=
 =?utf-8?B?MXBjTVkyRWJoanpKckZNMThNUjBxNGxPR1NON2JRNEQzcmlBSkxUK0xaMkQv?=
 =?utf-8?B?ZmVwSUlLcm9OMWtabnk4UytBc2RUQ0M4Y3ZndWlpVGFkaTRqMk9RVWZBNFZ2?=
 =?utf-8?B?YmFEYVF2V0FtdC92NFhIcUZMMGcxTXlIT3dzTW5RNExCRkVSZVpCTUFjZUhx?=
 =?utf-8?B?bnR3Z1pHdXFZSU1LdWx3YUJiTk02eURYbStEWXZRVlM1dUxnZExsaEhOeFc4?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E821D2CF729AFF438D741CC40937D7FF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e3dc248-8e20-4ed1-2d0a-08dde6650fbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 18:59:48.6314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2jwR4PYjiXRQ0vWlC7Hb27rDnLvu8DnAtm9OzLNnlAck8A17Ptyaf2eOymS7uFltIj0dGF/OwejZnmwOho2XDd/YS10GfpqGQ0vqfNJpoIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6341
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

T24gV2VkLCAyMDI1LTA4LTI3IGF0IDE3OjUyIC0wNDAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQo+
IFVwZGF0ZSBHdUMgbG9nIGJ1ZmZlciB0eXBlIHZhbHVlLCBtYWtlIGJ1ZmZlciB0eXBlcyBlcXVh
bCB0bw0KPiBndWNfbG9nX2J1ZmZlcl90eXBlIGluIGludGVsX2d1Y19md2lmLmguDQoNClRoaXMg
aXMganVzdCB0byBtYWludGFpbiBjb25zaXN0ZW5jeSB3aXRoIGk5MTU/IENhbiB5b3UgYWRkIGlu
IHRoZQ0KY29tbWl0IG1lc3NhZ2UgdGhhdCBpbnRlbF9ndWNfZndpZi5oIGlzIGluIHRoZSBpOTE1
IGRyaXZlcj8NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWmhhbmp1biBEb25nIDx6aGFuanVuLmRv
bmdAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUvYWJpL2d1Y19sb2df
YWJpLmggfCAyICstDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19sb2cuY8KgwqDCoMKg
wqAgfCAyICstDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL2FiaS9ndWNfbG9n
X2FiaS5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL2FiaS9ndWNfbG9nX2FiaS5oDQo+IGluZGV4
IDU1NDYzMGI3Y2NkOS4uYjE4MTk2NzlmYTM1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUvYWJpL2d1Y19sb2dfYWJpLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL2FiaS9n
dWNfbG9nX2FiaS5oDQo+IEBAIC0xMCw4ICsxMCw4IEBADQo+IMKgDQo+IMKgLyogR3VDIGxvZ2dp
bmcgYnVmZmVyIHR5cGVzICovDQo+IMKgZW51bSBndWNfbG9nX2J1ZmZlcl90eXBlIHsNCj4gLcKg
wqDCoMKgwqDCoMKgR1VDX0xPR19CVUZGRVJfQ1JBU0hfRFVNUCwNCj4gwqDCoMKgwqDCoMKgwqDC
oEdVQ19MT0dfQlVGRkVSX0RFQlVHLA0KPiArwqDCoMKgwqDCoMKgwqBHVUNfTE9HX0JVRkZFUl9D
UkFTSF9EVU1QLA0KPiDCoMKgwqDCoMKgwqDCoMKgR1VDX0xPR19CVUZGRVJfQ0FQVFVSRSwNCg0K
Q2FuIHlvdSBtb3ZlIEdVQ19MT0dfQlVGRkVSX1RZUEVfTUFYIGluIGhlcmUgYXMgdGhlIGxhc3Qg
ZW51bSBhbHNvIHRvDQphbGlnbiB3aXRoIGk5MTU/DQoNCj4gwqB9Ow0KPiDCoA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19sb2cuYw0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfbG9nLmMNCj4gaW5kZXggYzAxY2NiMzVkYzc1Li40NzBjODNlYWQ1NDMgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfbG9nLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19sb2cuYw0KPiBAQCAtMzMwLDcgKzMzMCw3IEBAIHUzMiB4
ZV9ndWNfZ2V0X2xvZ19idWZmZXJfb2Zmc2V0KHN0cnVjdA0KPiB4ZV9ndWNfbG9nICpsb2csIGVu
dW0gZ3VjX2xvZ19idWZmZXJfdHlwDQo+IMKgwqDCoMKgwqDCoMKgwqBlbnVtIGd1Y19sb2dfYnVm
ZmVyX3R5cGUgaTsNCj4gwqDCoMKgwqDCoMKgwqDCoHUzMiBvZmZzZXQgPSBQQUdFX1NJWkU7Lyog
Zm9yIHRoZSBsb2dfYnVmZmVyX3N0YXRlcyAqLw0KPiDCoA0KPiAtwqDCoMKgwqDCoMKgwqBmb3Ig
KGkgPSBHVUNfTE9HX0JVRkZFUl9DUkFTSF9EVU1QOyBpIDwNCj4gR1VDX0xPR19CVUZGRVJfVFlQ
RV9NQVg7ICsraSkgew0KPiArwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBpIDwgR1VDX0xPR19C
VUZGRVJfVFlQRV9NQVg7ICsraSkgew0KDQpJIHNlZSB0aGF0IGk5MTUgaXMgZ29pbmcgZnJvbSBp
ID0gR1VDX0xPR19CVUZGRVJfREVCVUcgYW5kIG5vdCBmcm9tIDAuDQpTaG91bGQgd2UgZG8gdGhh
dCBoZXJlIHRvbz8NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpZiAoaSA9PSB0eXBlKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBvZmZzZXQgKz0geGVfZ3VjX2dldF9sb2dfYnVmZmVyX3NpemUobG9nLCBpKTsNCg0K

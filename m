Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1006FCCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 22:10:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B7F10E0DE;
	Thu, 16 Oct 2025 22:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nHoVasUD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15FB10E0DE
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 22:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760652645; x=1792188645;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8vcNPUGt88R0zEnsr3CnHZAu1PEBBj9AF2mmCaVouP4=;
 b=nHoVasUDLA36dO1pym85X8yjPGkNg4MQHqE1yhuiWZqZq5HEdONk2ZZK
 rcOAXd/tQYgrlsQxjhSUqIpsnFL8/XhpQ+SlnWhWzeb+sl6mT37r9qMFH
 ocrzLLQOVtaBxsEhW527ysyTemW7U42m/vBFdYOM1hRt3B9AM7nN0oXMe
 PzD63h15BsTR2SnEd8ojt2zPC7NFpeuawMPr6rFZOMCuWtX9OVWxiCakJ
 eWrdVqV3VlLvZh994wJXq87dmL9Y3tZ2uGPu5kWf9BF6yvBBp1Fv4ltDR
 dvinQLdwGqXzv5cewdgtlgC5uYiSgZFsiw/Drbz18XTeosLRYkqYP/zPE w==;
X-CSE-ConnectionGUID: RXqWDZYUT5GuKFRm8zz+YA==
X-CSE-MsgGUID: l4WRrelITaWfxH/W7ozkvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="73531353"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="73531353"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 15:10:44 -0700
X-CSE-ConnectionGUID: +XPAl2ioS06CW8baEleedw==
X-CSE-MsgGUID: vSUqGy/0RgucQPFIExt88g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="181772281"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 15:10:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 15:10:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 15:10:44 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 15:10:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPUVfI9T36JRbO2ukB4sYahaOd2rY0OCmehEOLVHbpNecoRjzr2RKKbXapO6XFUXb0rAazMmQH/yn02M5g2hvS0HB5QhW7JBLNywHyiXWOljq26WVtLYV+ClQq0qRMkkiaR6OqbSF3RXker0cINHKmRBnGc36O0qTG2qS+QukDp7FjsJbPzAiicXvR6ZVGCkK1jVb+zXQpW6G6HhAlvO5oyE9va3a2pj0hPrUpxoUh3twW2qYO3u/Mw5RvlrRyFAN9qhR6b+n1DBCuosOAv8ttDIczUK0zk6Y8v2PgfJAyqSUle+GePwwhNyw9Fp+Jw/kjd5Bb1oMQXynavuLVNjug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJx4UM8OMm+LUnNLAUhLMD1Z6tXO2DRoW4Ya61ZntbI=;
 b=F8rRtwefhbccb9Dpf/7stMXorQJld6RpIF1MdlUpSkPcWytbOgOOJeZllyHYlCjh+L+uh6sePEAY1bzlJS91TKRsZv5JCuETR7wN+gZ5sveAIG/MwLy1YrERDYrY16+DVBhievfFQ5QWuUIB7IvRXaoPuGfRogeK+f+nXDI7+BYYh/TSpgvw4n/MKrYZ2rupNAXKnNXfE0pZQJRGDmeXU/TBuWAqrgAX138Nbypzifco4ZaNQI9aWEJf/GVXNA2q9VUOlQ090V3Y3PuCv8V47NuoFiaXhHbDXU5rHlJR671CkmxKTtNwIAylni7iv7Zrf8B6AtZPmfdCSaHO36w84g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF777B3455C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 22:10:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 22:10:42 +0000
Date: Thu, 16 Oct 2025 15:10:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: [PATCH 6/6] drm/xe: Clean up GuC software state after a wedge
Message-ID: <aPFtYIRh2Q/3Z64G@lstrano-desk.jf.intel.com>
References: <20251014180927.105077-1-stuart.summers@intel.com>
 <20251014180927.105077-7-stuart.summers@intel.com>
 <fa2d3d56688c64f27baadda86bc1aa8be118179b.camel@intel.com>
 <aPBpkZCqyqgfGO4g@lstrano-desk.jf.intel.com>
 <6b77ddd884c30312f76ded9adfd1cfb79fb9f92c.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b77ddd884c30312f76ded9adfd1cfb79fb9f92c.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0295.namprd04.prod.outlook.com
 (2603:10b6:303:89::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF777B3455C:EE_
X-MS-Office365-Filtering-Correlation-Id: b2d4e2e1-31aa-40a0-2d19-08de0d00d904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWFubWlxclpwam9EYThuYWtTelNHVmt3SHR3T084ckdrRUZ6YnRXRzRhOU90?=
 =?utf-8?B?a1dLeU00WGpRaFpUZGRvRkorQnlrSGtTc2lTUFNBTzk3MTNqRURJeW5zbnpP?=
 =?utf-8?B?RGNpZjZtUEFBV3ljN3VXMlVKR2dNL2g2cUZGckxhWktJQmNsc0ZlYWhkRGI1?=
 =?utf-8?B?MlFLdFhLcE92RXlRTFJqekUvdEl1OEpOTHowVHlqZmttYjRZUEVTcm85SHlJ?=
 =?utf-8?B?UkdZYmNnTXQyNFlSMzI5cmZPL0FOcmxpeHE3cVdldjFNajdIM0pGVlBIOHJC?=
 =?utf-8?B?T2h3M09rSEZTSnZadFNmY2ZsRlRENkVvYTFVRWVVLytzTVdJUThnWkJjUFdC?=
 =?utf-8?B?dmdENXJuNUJpK3JrOE1BSEhVeVRESjZma1lmQjVsbkE1N1pZTVlENU5DWkR1?=
 =?utf-8?B?VkdnaTNVUlhnVEpXZUxvQzJaeER6Y1lSNTN3NkZKVktMUE9oOUFrb2FxYkFx?=
 =?utf-8?B?M2JWaW8wamdYZlZPU25FS0ZOdDF1TmtYdTNvUHdJUTNSUE1XZFgzOVdWNGVD?=
 =?utf-8?B?cElvK1A3TlJyY0lYT0hISDhLbklFREl1ZklvbER4QzZkT1BFb1lORGNTU3Vo?=
 =?utf-8?B?VmVvS0NMZkdqUTdudlBLbmVwUjhjQ2x6bUxoK0FNVEJ3UURmYWlVWFNXMVhr?=
 =?utf-8?B?Q0RpK3pVSk5lakhEdVRVZlRMd2E2ZHRTNXpDR3I4dllNTGFGc1FVS3VBZE1M?=
 =?utf-8?B?QW5wcmtmb0V3d1dodDFYWXYwK0RJYmsvN1ZDVEx4T3hwWjRhVnd2Z2cwVDZK?=
 =?utf-8?B?aW5lZUdUM2svZVNIbXR6Y01uclg2aHQzaldJOGhjc29WbVh4NDBLaWJuOExt?=
 =?utf-8?B?VFJ6MUQraUZOOFRuT25JRDR5OXJjVnZSQjRRSVlRS2N5dUxIay9OdEtLTGx0?=
 =?utf-8?B?TUFWOEJFTUxYMUQweTR6SFk1UjJmVjhXV0ZwMVlhRXZ4VXF5dS91MzR0RTZa?=
 =?utf-8?B?SktoOWdQcFdCTmxzellpUW9iSDVma05iNGNtckFvTXdTTkl4WmxKNEJaZ2xN?=
 =?utf-8?B?SGxtMlB5VlphMXhwZ09LeHBvcXp3aFp3dDBHUlRRR1J0QXNVSWUrWEFtenNt?=
 =?utf-8?B?THJ4QzdXbE5FODNSenN5akxnSS9HV29EdFhqWFQyQlB4UDg4U1BTZnU5UzNa?=
 =?utf-8?B?V3JMb3o5ZisyVmlDWjRBOWRkSFNUNXFDOGdseHJTS1dBejhmUk5pbndISmd4?=
 =?utf-8?B?c2tRcTBaaWlxZkpzVlBLYjY0WW1kbWZIeXJDREpiSnZ3RWxQOGw3TlQzRk9I?=
 =?utf-8?B?aGNTb2tRWEZEdjc0azIwWlpqVHc1RkRpRjR2MkRUUEg3M0FjaXp0V1pMVnFF?=
 =?utf-8?B?bmE3SERaWFBOTmttdUtwVWEyZ1dMY2RzWVcvM1dPb2g4eEZPRlQ0TXI2dWV2?=
 =?utf-8?B?L1Nrd01iSWJuYWNyUTZSZWsvNXZIaDJ1MmlqZi9vRzh5N0NaYjFkdWg4RjZW?=
 =?utf-8?B?dHNRQXhBbXFZeGpmWTRVOFRBV1U1cmFtSFRTQkVOUjh1MFJYQ0djaWxJTjVp?=
 =?utf-8?B?Z3ZxSmprNTQvUk90eDc0RmV5S1NDT2Z3aFFIY3ZPTzJUTzFhZmgvWE9LRVFN?=
 =?utf-8?B?L0I1VzM4Z3lYLzY0c2JNdEdVL1lSSlh2ZnJsWnJpU2V5Uy92dk14azBoVXVu?=
 =?utf-8?B?bW9KczNWNEliemE5WjRnYTkvRDRLdmpva1dQMXdubzgzNUZ2bG1ndzJ2Z3Js?=
 =?utf-8?B?SEhNNXZoaXB3WUNBUVJpOE5Sekoyc1lwVDJ6djdoV3FwVE5GL21QUG1pVGgr?=
 =?utf-8?B?RnFocVlLYkF4SjdNNzAyMjg2TVNUeXlJQ1FKaDVreHBaN1REZlZUWExsMVp1?=
 =?utf-8?B?Y1lNNDZtVUk2N2JhMjZqbExyWFA2WXU4cUpMVHI1UzBCRG1ibjllSXhBZmY0?=
 =?utf-8?B?SzlTa3AxMjVwcDkyV1B2WkpuOW4yemdQVzFtMFJnZU9zMjBaTStNVHgvQlFZ?=
 =?utf-8?Q?qO0e8hCnmymf7SpCOj9tC4y4c0BzUw4/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmNNWjlDVlJHYWN3SVEwUURFZkxTWEVTZ2NaZlBVZVVFbS94b3BPVVdwMGts?=
 =?utf-8?B?bDNPUU53eVZoV3RLTUl0bjFXdU5UV2FqbzV1MllZaVRLQkhVdzFNVmg2ejVP?=
 =?utf-8?B?cUp1MEdISk54RXZ5S05hUHF4RUg5dTlGbzhwbGNhM2NrdmJuNmhwWnd2NFI4?=
 =?utf-8?B?V0NpNXN3MHplMHd6dW81MHBqU3hVanVvRUNWOVg4cXBOczJUN1NNTVZYSEZV?=
 =?utf-8?B?RUNlTHRVeG5qZFh0MGVEbTVBR0dCRWJqMm5TeHhsR1FZMDBpYmlBOXZyQzJL?=
 =?utf-8?B?ZkJyWHlUVFNaRTF5RXhJaFBuQnRaRnVZL3Y2bkN1c28wekdKZzFTTzlIS2tY?=
 =?utf-8?B?Tmh4V0haVCtnbVJWUzVOdDM1ZFB2YjVmdzZMZkhOdkViZkVLNndQMG0zaGdE?=
 =?utf-8?B?TUxUNGFQa2J0WTlVRE1jZHpkSTl1UVpMM0g4L3VHOXdxWUtkVld5Y2FZWllP?=
 =?utf-8?B?WjBoekRZYURnSEdCdm13dlV2SEJWeEhPSzg1NWZLQ1VtSWRSYWhpY2xjSkZa?=
 =?utf-8?B?S3ZVRUhhdTVleWRFZzJUeklSakQzUFozRXhDaHQ4WGFLczZBT1BJbDNFeS9J?=
 =?utf-8?B?REFpMU10T2xTa2d5d1hEL09NaXU4TSszNG5wVHQ5U3BOR1U0emNhZi9nVUJr?=
 =?utf-8?B?T052anJVcXBzalVxSWdRZDd1aS84dncvcW54T2lHQzduQTMvQ2ZCeHF6Skx3?=
 =?utf-8?B?a0hicXQrb2NRV2grdUdoekpGU1JNNi9jdFFPQWZtZzI0QmgxaDFZS1hnQzU3?=
 =?utf-8?B?WEQxY0k4Rnp6UDduMEpCOFJHN0l4dS9GbjlkckdzbGtXRUExejQ3L1UrNWU2?=
 =?utf-8?B?ckIvdzQydmN4dE9kUzhvT0NWVDhUSVBpM1NLS3NFbXpGRk1IQkg0eWV2YXY4?=
 =?utf-8?B?VzJaaDBKem4wK1BWZWphbnAyUmpFbDJ3aVA4dUNsTzNuaHM5WVE4bXJhemhP?=
 =?utf-8?B?dWVQYTYxalFvQ3FrNFh5YjFOaU9icmNkMnZ0Mkl4WGdLV2h6NjBqVHgyUW8v?=
 =?utf-8?B?SXJkTnpSeXkvcFI0MFFIaEkwa29VYzc3Qmt2UC94SHZWRUZqcStpUkY5TzJm?=
 =?utf-8?B?RUlCUEF5bmNwOCtRZ2dibElOVjBNaWtHUkkrcmhRcXhaNk5XU3pwamViU0Rv?=
 =?utf-8?B?c0JYQzNQUXFDZ3FVWUU3VXd0YkRZdWVGUGZieGxYbUdKNjh0K1hpemRlREIx?=
 =?utf-8?B?OHhMTm1QenArUDJTdzM3WW9ZNXA4cGhDaHRaM2tDWG0rYk9rVUN0Z1pBQyt6?=
 =?utf-8?B?aDZOdlZlc0I0MmxHK1dOVTlGSFlOZTFyYTJrb2F4VGVVYllqbGlUVHpINXFC?=
 =?utf-8?B?RzZLTUV3d3R4Z0tGM1JaR2ZlVWpwMitzeVlKenZaUG9HaWI4QlFSQlNVeXY0?=
 =?utf-8?B?emEyY1RrcXFDN0MyR1QyM21xUmYyNVlJakhCMUF5YXBHVmMzbndDQlBvMzY4?=
 =?utf-8?B?aU9HY2tZQzRHQ01vT0FReUZCN2hoSjUvN2NENW54ODVIeGVNTEFZYXNIMVgw?=
 =?utf-8?B?bG5lMitmZVNiRWtEcGpZcVhIWXp1ODUyQWxZelo2SURGZk1FZ2FBanR6Ym9X?=
 =?utf-8?B?cXNZSDV4bzZVMloyZk1Yc09uUkFTc0o0aDJnNU4vZldwWGNKUHlGMTA5QUhZ?=
 =?utf-8?B?QmdiMVdlMnZoNXZTaHRKR2tWUGxWNUtldjgzMjUwS3ZIdEYrbTZDOVlOTlpE?=
 =?utf-8?B?cEhDeXQ5K2tJaGsrRVlFMzcwZzQ3dm1hcmsvdnpQMXRraE1xYXFvS2J3Mm4x?=
 =?utf-8?B?SzVuU2ZFcTVUbXQ2SEZYUkE2aHpUcGo1RVliYkJ3TGpLMUZnM0FhcHJMVzhU?=
 =?utf-8?B?VG9tTVg1QTJSUHBvNWRUeDUzMGJiZkVMSjNWSEUwVnBGbHJwR2tYYlpGbVJm?=
 =?utf-8?B?SHY4RmFQbXZOOE11UWY1SkFyWk8zdmVDam83MktOUy8zWnVwRXBXc1EvRnVP?=
 =?utf-8?B?Z2VnNFZvdjNuUHN1ei9rbXg1c0pxbHh5bHdJUm5zaTZtYTRYZUZLbnJrT2ZQ?=
 =?utf-8?B?U0w1YnpMUmRmZ005UXphQldWMFhpQmZIcEtxK2ZwRkVuYThpbUNpMFpEcGJB?=
 =?utf-8?B?ZG9nVmJteFRvOFJVVFhrRThuTzc1V2VZNXIwZXdzMmRGaHdNeGszcnRINU9H?=
 =?utf-8?B?SDYyMmNPUitBRGN6dkx4YkpEbHlxYTY1aDVTOURBT3BsbzRKdXA4TXJ6OVNZ?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d4e2e1-31aa-40a0-2d19-08de0d00d904
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 22:10:42.7154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qf2L62dsM2pYmke4oG3T0mETCqvASWYDbjPjxFhUGeZdL29654aWTWwlrVz4yOmEN9d5ODt8i9/Odeyd7qrOrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF777B3455C
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

On Thu, Oct 16, 2025 at 11:50:44AM -0600, Summers, Stuart wrote:
> On Wed, 2025-10-15 at 20:42 -0700, Matthew Brost wrote:
> > On Wed, Oct 15, 2025 at 01:45:35PM -0600, Summers, Stuart wrote:
> > > On Tue, 2025-10-14 at 18:09 +0000, Stuart Summers wrote:
> > > > Comments also added to the code, but in the event of
> > > > a wedge or a hardware failure while communication with
> > > > GuC is outstanding (e.g. during a schedule disable or
> > > > context deregistration), the driver doesn't automatically
> > > > reset the software state as it would in a typical GT reset
> > > > since we are trying to save the state for debug. However
> > > > once the user unbinds the driver we still need to go through
> > > > and clean everything up for these exec queues so we don't
> > > > leak memory on the DRM side (e.g. LRC or LRC BO).
> > > > 
> > > > Add a kick start to the DRM scheduler to handle any outstanding
> > > > messages on hold during the wedge and go through the GuC stop
> > > > flow to simulate that reset on teardown.
> > > > 
> > > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > 
> > > Please hold on review here. I think there's still something missing
> > > on
> > > the wedge cleanup case that causes issues after wedging and then
> > > doing
> > > binds/unbinds in a loop after. I'm working to resolve that and I'll
> > > post a new series after.
> > > 
> > 
> > Sure. Just couple of thoughts below which might help.
> > 
> > > Thanks,
> > > Stuart
> > > 
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_guc_submit.c | 15 +++++++++++++++
> > > >  1 file changed, 15 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 5ec1e4a83d68..0bbae336c722 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -276,6 +276,14 @@ static void guc_submit_fini(struct
> > > > drm_device
> > > > *drm, void *arg)
> > > >         struct xe_gt *gt = guc_to_gt(guc);
> > > >         int ret;
> > > >  
> > > > +       /*
> > > > +        * If GuC stopped responding during deregistration
> > > > +        * some queues can be left in a bad state. Ensure
> > > > +        * these are all cleaned up by going through the
> > > > +        * GuC software reset flow.
> > > > +        */
> > > > +       xe_guc_stop(guc);
> > > > +
> > 
> > I think we'd need to restart here at minimuum after cleanup.
> 
> Yeah this was one of the key issues, just trying to find the right
> pieces to insert here..
> 
> > 
> > > >         ret = wait_event_timeout(guc->submission_state.fini_wq,
> > > >                                  xa_empty(&guc-
> > > > > submission_state.exec_queue_lookup),
> > > >                                  HZ * 5);
> > > > @@ -295,6 +303,13 @@ static void guc_submit_wedged_fini(void
> > > > *arg)
> > > >  
> > > >         mutex_lock(&guc->submission_state.lock);
> > > >         xa_for_each(&guc->submission_state.exec_queue_lookup,
> > > > index,
> > > > q) {
> > > > +               /*
> > > > +                * Kick start the scheduler since some messages
> > > > +                * might have been added while the scheduler was
> > > > +                * stopped during a wedge event.
> > > > +                */
> > > > +               xe_sched_submission_start(&q->guc->sched);
> > > > +
> > 
> > I don't think possible to get here with a stopped queue, I think it a
> > bug elsewhere if we do.
> 
> Hm.. so this would either be we went through a GT reset prior to the
> wedge (which should have restarted at the end of that) - which isn't
> the case here - or the job timed out and stopped the scheduler for that
> queue. Seems like there might be a bug in that path...
> 

The job timeout mechanism should always restart the queue. I just
checked, and it looks like there's a bug in the vf_recovery flows, but
that shouldn't affect this case. I did review the GT reset path, and if
that fails after xe_uc_stop is called, the queues are not
restarted—which is a problem. We likely need to call something like
xe_guc_submit_pause_abort (or a GT-layer equivalent) to restart the
queues. If we don’t it could lead to memory-unsafe behavior as things
will not get freed. This call should happen after wedging the device.

Matt 

> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > >                 if (exec_queue_wedged(q)) {
> > > >                         mutex_unlock(&guc-
> > > > >submission_state.lock);
> > > >                         xe_exec_queue_put(q);
> > > 
> 

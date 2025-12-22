Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56950E67815
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 19:26:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DF710E72B;
	Mon, 22 Dec 2025 19:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LrLwve3m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A4D10E72B
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Dec 2025 19:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766431590; x=1797967590;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tpO4NzRYybFaX9kP5hAOFhMlTmRUlLnwXOPES+Ez36Q=;
 b=LrLwve3m8CnfW+oY24+w53ikAefp7QTJcpofxtIago0TsuloxPoAWcO0
 kDGl6QAybuFxVdz+RHxdHja3RsE1ZWgQOtTFsvF8z+ruNFOz+HIxdeJnx
 LnNHwVs2dhQI0OIt2rUPiHAS1CahRsGAD0FR5EkIXv3i5bKM/TmGNMdDJ
 offBN5ZwxHXU1TFpHLv5OeVQZQ1LoFkElgaks/sJp3s9Hf8HHnRsz6315
 DOXqGZYGWsvERB0t0KP/NsjouvI28+m2l4rlLbyafl/1jTiMV2nfyjk9Z
 3hGvQ3BFCqpbrm04t0BDfK8uM4FMGg779NnOs+mI87OK8YEsoJV11CWTc A==;
X-CSE-ConnectionGUID: +L7+5ZzKScqV+XyMEko++w==
X-CSE-MsgGUID: 6nU6kpqCTW6TQGDzkjc61w==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="70867479"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; d="scan'208";a="70867479"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 11:26:29 -0800
X-CSE-ConnectionGUID: OA3OGbyPTGqMgAkHv0TMpQ==
X-CSE-MsgGUID: KILUE537R5itfeXFtMhfuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; d="scan'208";a="230608767"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 11:26:30 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 11:26:29 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 11:26:29 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 11:26:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRwdjJz5ryHlU3iF6mFHlpFwuJ7ddroIvyUugT3IIW4qCSIretd5vlvDmCgr3esfaBX7wDL+K3aJE4xabRGDWFlne2tuiuNpBVBQhNLY5wRCgmfKyCSb/qbQg98R+zwLFgSQoqjuYNi222XA0UyW1IgDG1nZaWXEvh0xFWFEhAAu2yShIgDni6rPuIPDXy/1kybku6oy2sDnBlHxXSzjdLKhFi5xN1Dk2Kqbba/eLRocgyYjNUE2cdHSsmFJY8b58XAek15oeQEus1+YjdqpEHcYYS/T49tV0YXpWugcU2zamO2kTDNdyDgpsVNayE7Dn1gRAmV37q4/96JoGTo7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/vjRkZM7UM1nZLrnrBZ/m8/GHuSYkmi82X22ryHi3A=;
 b=BWUL1hWcxt8QL563zeXRFr2eWrkC/rn97sph53JIq8gWWjv9kJzAxhBlNrLIemg4PLshLmc8hAoft5tN0No34X8FDU3Mv8oGk5sYrVAuBe200X6eQlRyWETeUAYmY0U4DD+YpgyFJ+Rm6bfhGC94FiDdpdA4OheAoIwfWvUQ3OqwvvULG+TJETpTF62aMF6ekyximOPzQ9fqVOzDeumq6VQ5qSBaxiAaJLHzTmM0Tx9qyvcN9y9vfnspKMXlvUMBWBL6lR/UjoTfaMIVvoX4C3xMiBoWKRbH2omSiwYMC9GrlC7am2pgOanvGnGb/tkgIndCWHfp7RyWNBPA0X3QKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH7PR11MB6881.namprd11.prod.outlook.com (2603:10b6:510:200::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 19:26:24 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 19:26:24 +0000
Message-ID: <90bd5e42-135a-4bc5-9264-82406e37d237@intel.com>
Date: Mon, 22 Dec 2025 20:26:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/4] drm/xe: Update wedged.mode only after successful
 reset policy change
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
References: <20251215174613.3701-1-lukasz.laguna@intel.com>
 <20251215174613.3701-3-lukasz.laguna@intel.com> <aUXLIynGVV5YA7yU@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <aUXLIynGVV5YA7yU@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0134.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::27) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH7PR11MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 83f55b52-5fed-41bb-301f-08de418ffe5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUlZOHBxTjFzQ0prVnlpTUNUUzdEeWFsdHNlL3FwSWVmdmFDdlpBY2NlRlBH?=
 =?utf-8?B?Vm44U0JVQkdrd1QrQ2pHSzFQMVZleUVzaWVNNDNmYkdxT0k5anVJdlVIdGs3?=
 =?utf-8?B?bzJSb0FoTTg1eko3UDdaaDFUbWptaldHWkhReVlUZVJUMlREVjFqemZLY2JX?=
 =?utf-8?B?WXJ0d0tab0lOWkFDK05GeThBNDNtUkRGb0paUFpKMkZ2NkRtaDA0V3RLMHIr?=
 =?utf-8?B?KzBBUDJ6QVVNeXgwTVFGUmd0eE4ySDdVc0JyUTJFaWxDR29vdCtURkVXZWxh?=
 =?utf-8?B?WVRFY2EwcHUyejBHVlExZ2toQytsZHE4UUdHZ2NrcGRrbmc5NVNsazFlT3lQ?=
 =?utf-8?B?U3VDb1pZRHhxSTBVVi9vdisvQ21UbzFkNERHNkIvYWMxN0lrYjU3UGUvOEhw?=
 =?utf-8?B?RE9PMFF6M2QrOEFXOVNnT3VzL3cvZW9nYkpBYjBvQzlYTjNJMkdCK040Qm11?=
 =?utf-8?B?NUdib3ozUWFkMUtiRkoyNG5BOHhIZzV5V3dYZjM2enNxQ2RXMllkdkZ4SkpX?=
 =?utf-8?B?Q2NJSlV4dlhrRnFNWFgvdHhwdkxQWlFXQkVFQzlrVXkvZURISHZ0a0pQeXVQ?=
 =?utf-8?B?aklCUms5MUdYdm1NWU9UbzdyeWc2c1h1TityNmpiUTdJR1Rqd3NxSWp0UHky?=
 =?utf-8?B?K0ZHV3haYjlobC9MN0RKK3oyaUllL2gyWUUyREgyVlVDTlczMXBaa1hPU09i?=
 =?utf-8?B?Nkgwa0c5RElscnNYQ1dBVzhCaVdmMTdKaSs0RmtzcG1ra3UyNzhVeWFOSVU2?=
 =?utf-8?B?NjdUdForajNYMXoxdnBMaGltcy9HTHJJbnk5a09EUm1NMml2dStuaWJZZHdx?=
 =?utf-8?B?allQd0VBQ2ovOGM0NGlxQkxhUUlXK2RXVjhDMng0cDRTcGJXZGpPZjM2OExE?=
 =?utf-8?B?TjJGZlNCS0ZYS3U4akJZWE44T2FkZzA0ZG1tc2djMlJIcG1Hc29VanU2NkNL?=
 =?utf-8?B?Vm9iUWgwb05tSVVxRnorMmlpMC9jMm02Uk9IQ3o5YWZVeFBxcFlWbVNPQjd0?=
 =?utf-8?B?Njc3QTFVUURhOWtWQzdNd0RJU3FiS0JadGRZazNSZWp6N0NCVGVsMXlrWkd4?=
 =?utf-8?B?dml1K1JaRDhTeUhUTUFzV1N1TG9JOU8wbjNsdGhXeEZSRWJDQXZRNXo0a2k0?=
 =?utf-8?B?L0VvWmJ2WDlLRmtYNXIvdVkzNTJSOVNlalk1MFJrejJZaUZ5b3BncGs1dDlH?=
 =?utf-8?B?enFDbVdVNEpuZUd1R0M3eVQyOWxNUmZwTXNWUms1em1WdGZzamUvM1BTU3RW?=
 =?utf-8?B?RHB5S2hIMGRyOGdyMytETlZHbVFaeVlCMUtxdERTNUhYV2RQRmd5YmNWU2x5?=
 =?utf-8?B?SkFhcEQ4WWJ3M090Y0ZPMVd3MlloWmRuazBtT1hwV3B2VHZickVzbXBkN29q?=
 =?utf-8?B?VDJwYlFLYVNrSXRMamVGckV3WFNFNTRINjdIRVhjQkd6U2htVWl0OFg5YTFs?=
 =?utf-8?B?aDk1TndHYXFBSERjNjF3VElqSzZMdERZbFJ1TWlyWXFxS1FXdnYwQWRHWGgy?=
 =?utf-8?B?bGZLY1NUTEVIbWRST3lZdDRpQ3V6Q1NGU2hoM05tZEtKMkRNeGFCTStydk9Y?=
 =?utf-8?B?czV0RHFsWGxneGRZTFZxUDdwcjZrWmtKL2tSWDFoQ04yaXIxZ3FRaHZmd1Bz?=
 =?utf-8?B?cVBRWXJrV2JRUmp3ejlEQk16SU15b2JhNzRnWnl4ZTQreFhaZi9vZUt4OXNy?=
 =?utf-8?B?RVdiU3JEenBpM1N4R3FqYURkVU5kcld5NXJ1eTROYVlwdWtUanJxakRGSCtZ?=
 =?utf-8?B?b3ovZTlqbVdMRDlPN0FtUnBnemY0OEtXOFlNTXM3c0FmWjZpSzkyQ1NSR1dt?=
 =?utf-8?B?d1ZjY25TTVorY3hjSTNVQmE3MHBiaER6RkNLa0tKUEJKNkxSTkorVGZpd2RE?=
 =?utf-8?B?dG0wdFB0MGdoTVNxZEpSQ3pOTGdzOWZ3dXFXMDFRWWVRUUtkS1pGcWlDeHNU?=
 =?utf-8?Q?gssCvIe2lUZdxYAQ0PohQZfyC2CMo2Bv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkpLc3UycVU1TDhwYVYwVnNvdXBUTU5PNkVyazFtZGFROGJTM0hOMVVVUG0r?=
 =?utf-8?B?SzdQa0cza1FPRGtWaUxHdkorK0lubE92ekUzRFlaNFNmMEJUT0pzbGFtZUlt?=
 =?utf-8?B?ZzVPYnNNSjZLS0RoOWw1L0g4UlM5VlE3Q0p2MHpDZ2VzMDRidWlWV3Y3SlNz?=
 =?utf-8?B?MjRQdkRDRTVqd1JPNy85N1VPNmJWbVNQWE1jN3dCMXMyTnhNVDU2SGhjKzls?=
 =?utf-8?B?MFkwZ1hkdEdmM0FZRWlBQjNrWDRseTgrSlB5NmVmeFBvYzIxdVZVeXlIVndG?=
 =?utf-8?B?dkhYOFdERW1mQ1NsR244S3c2cVRKaExXMUVUd0JMYnVRdy91aWlBNTFnQWlt?=
 =?utf-8?B?WmhHblc4Z3haU2hJa1B0VDRieDJPYk9CcVpkM2c2eGpNUjFnYWc2ck8zclc1?=
 =?utf-8?B?YWNvZGhmQW5TNHF4UXVPZVBXZFZiYlNNR2R6MnZyUFlFcDZFTjFuMUVHSjlM?=
 =?utf-8?B?OWtaV0lKSU9sQkFCQ3pkOURVMjIwZDJ1TU5HOFplQWZYQ05temFmdkxzM2dH?=
 =?utf-8?B?d3VqazJ3NUY4bmkvUnUvMTJaYzNDdGYrTUNwSGd0L3VIbXRQVGhYQ3IxSUlT?=
 =?utf-8?B?MytGUEZ5SnkvRk5TVllNNXR0eU9PQTFMNGNQNnByWU1sWkRBVGNXRDNUQmN2?=
 =?utf-8?B?SmM0b2FOMWV6cVE1OHA3NFZNSTZnQWRnTFBqUTMzT3E3ZXZFZjAvMnV6Q05l?=
 =?utf-8?B?VGdWRnZEbVVqSjdEVGlub2pTdHRzWm9DQUZQc3ZPcWtBZUxTQzluRkdhWnBG?=
 =?utf-8?B?Yjd0Sm40R0M5ekNQdE1sS1NZQ2x2cXFDTFBNdFdGQnp1TTZsb3Y3L2dwZUcv?=
 =?utf-8?B?NWJ0ZURyMEYveExEV2VDUkZTVDczSEo0b0hITXo3T0NiUjRGWFAvRzdRR1Bu?=
 =?utf-8?B?R0FOaEJaS2lJaXN1Wm1FWkdsN1J4T08zSUlwWmlzOEJKQ2FkeHpPVGxHU3lT?=
 =?utf-8?B?Tlo0b3B3UlN6KzVZV25naDduM01YK0lab0Y1RE51MGxOcmpjYjlqOTRLQkVC?=
 =?utf-8?B?MWYwUmRxQmhPMVUxdE9FdTU5MFFnb0x1ZzhiNmR6T0dnRnQ4TmplQ0REWlk4?=
 =?utf-8?B?U1VSb0hSOXVCVFV4YmRSZzk5MnRWdmZjUERoVXlNYzBaSzBFanE1TnA1UUZM?=
 =?utf-8?B?QjBOb0RGdHNMVEJFY1owNWpicE9SRys2aUpteEhndWhUQTlNYU5FTXRKN1E5?=
 =?utf-8?B?bGxaZVBPdDh2UGVLdk82OWllT3RiR0Z5QUUybFAyWU5rWStpVHNiaWhqUjZw?=
 =?utf-8?B?TnRQTWdwanE4eDhrVW5sb2hrbXcyWWJGby9KZjRxRWZhL3RYZjJFZGtweUh4?=
 =?utf-8?B?bnBQT1dxSU41eEswSXFkVk9yWnhUN294dDM4UnVNRjZmZFo0THpkc0pnOWNl?=
 =?utf-8?B?UjgycmFXZW1kNWtZbFNvS3c2ajhRckdrbEJTVnhWK1lRb05idURCeTU0YzJD?=
 =?utf-8?B?UitxMWdYcUZQWElPbHBpc2VHUDNwTWhJbjd2RDI0OFhWWmgyZzZpODJCUDY5?=
 =?utf-8?B?MnEwL3ZGZkxWdVhVQjZ1RU5zUWd4NXZQNngyVEhtcGZVc2JBMG9lRGZJL09T?=
 =?utf-8?B?QVorZHlxc3JhQVdPWnZYTFZ2cnNJUHJVSE9LSjBoNCtjd1NCcHozTVNLdnps?=
 =?utf-8?B?ZU14UUhFZnNOY0ZySzA4aDNWRVNFOFdsSi9PS2phcTgraUdsd3lYVGJMR0VH?=
 =?utf-8?B?NGlDN3NSRWVZdHpaTzVIUGFVeTZjdjlEaUY2VDhFUi9SSVFEa2xHQU5rNnJo?=
 =?utf-8?B?SzlrbkpFc3BUVzZGQnFieFNibGdmeldxSWd2dHdwY2pDTVg3Szg5UkR6VndU?=
 =?utf-8?B?bDRRTHBVZEdiTExRZ0JFUVZ3YjlwMDRDOEw4Zy9BUGEzQnliekdsR3dEL0Z3?=
 =?utf-8?B?NnR6U1NBNzh1ekxmbklzWHhTNTZUa0pIamZXeUxRV2ZJZlJyMGQ2NW9WUXlo?=
 =?utf-8?B?OG5rb1RDZkc4VTg5RFB0bTdOZXl2MHRtKzlrQzZMRGdFNXNOUHAyMEJoRmdp?=
 =?utf-8?B?WEw3cWdkREp3eFhtOHB0T3l3WWhpWmVqd2xjckt3UFFnbnlXV2VBSm5vY2xu?=
 =?utf-8?B?T2xaZHUzdm11R1dEWWg1NDBXOWFTb1B5VURoTDM1c2dHcllLVU9rNklnK0xy?=
 =?utf-8?B?ckZhMlhtWFZOMUYzRk5DSFE2MktZLzVybEU0M0tzaVJnbFZWT2lpUjJrbWYr?=
 =?utf-8?B?SitFRUNQamlFNlNjQ3lRTlA3V2dxc0JRVmFscjN6RnNqR3FuUWVjK2FXK1Vi?=
 =?utf-8?B?MFptd0xmbDFQcnJRRGdsb1ova1lydGcxdE9IZHU3LzQxWU1DQnRIYlJMUU16?=
 =?utf-8?B?NHFPK1hRSWQzZ3hIZVQ4M1hITUhiSjU2VDNmQ0pHcnB6QVJQTXN5UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f55b52-5fed-41bb-301f-08de418ffe5f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 19:26:24.0391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4I/D8OnDbfwMvwPuoAi6vL8O1QiBloVphJZpYnvEZqRwzFp7t4CJwxe50+JtmLDSo4cwyEoD5OI3hd0dt/AS/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6881
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


On 12/19/2025 23:01, Rodrigo Vivi wrote:
> On Mon, Dec 15, 2025 at 06:46:11PM +0100, Lukasz Laguna wrote:
>> Previously, the driver's internal wedged.mode state was updated without
>> verifying whether the corresponding engine reset policy update in GuC
>> succeeded. This could leave the driver reporting a wedged.mode state
>> that doesn't match the actual reset behavior programmed in GuC.
>>
>> With this change, the reset policy is updated first, and the driver's
>> wedged.mode state is modified only if the policy update succeeds on all
>> available GTs.
>>
>> This patch also introduces two functional improvements:
>>
>>   - The policy is sent to GuC only when a change is required. An update
>>     is needed only when entering or leaving XE_WEDGED_MODE_UPON_ANY_HANG,
>>     because only in that case the reset policy changes. For example,
>>     switching between XE_WEDGED_MODE_UPON_CRITICAL_ERROR and
>>     XE_WEDGED_MODE_NEVER doesn't affect the reset policy, so there is no
>>     need to send the same value to GuC.
>>
>>   - An inconsistent_reset flag is added to track cases where reset policy
>>     update succeeds only on a subset of GTs. If such inconsistency is
>>     detected, future wedged mode configuration will force a retry of the
>>     reset policy update to restore a consistent state across all GTs.
>>
>> Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>> v11:
>>   - add more detailed commit description (Rodrigo).
>> ---
>>   drivers/gpu/drm/xe/xe_debugfs.c      | 70 ++++++++++++++++++++++------
>>   drivers/gpu/drm/xe/xe_device_types.h |  2 +
>>   drivers/gpu/drm/xe/xe_guc_ads.c      | 14 +++---
>>   drivers/gpu/drm/xe/xe_guc_ads.h      |  5 +-
>>   4 files changed, 71 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>> index 0b65c3940f41..f62174f7035a 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -254,14 +254,64 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
>>   	return simple_read_from_buffer(ubuf, size, pos, buf, len);
>>   }
>>   
>> +static int __set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
>> +{
>> +	bool enable_engine_reset;
>> +	int ret;
>> +
>> +	enable_engine_reset = (mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET);
>> +	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
>> +						       enable_engine_reset);
>> +	if (ret)
>> +		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
>> +
>> +	return ret;
>> +}
>> +
>> +static int set_reset_policy(struct xe_device *xe, enum xe_wedged_mode mode)
>> +{
> since these new functions are in a generic debugfs file and not
> in a exclusive wedge component, it would be better to identify wedge in the name
> of the function.
>
> Or perhaps we are in a point deserving a xe_wedge component?
>

Good point.
These helpers are currently only needed here, so keeping them local to 
xe_debugfs.c seems to be sufficient for this series. I'll rename them to 
make the wedge context explicit.

A dedicated xe_wedge component might make sense longer-term, but that 
would require a broader refactor and would go beyond the scope of this 
series, which focuses on wedged.mode validation and proper reset policy 
handling.

Thanks,
Lukasz

>> +	struct xe_gt *gt;
>> +	int ret;
>> +	u8 id;
>> +
>> +	guard(xe_pm_runtime)(xe);
>> +	for_each_gt(gt, xe, id) {
>> +		ret = __set_reset_policy(gt, mode);
>> +		if (ret) {
>> +			if (id > 0) {
>> +				xe->wedged.inconsistent_reset = true;
>> +				drm_err(&xe->drm, "Inconsistent reset policy state between GTs\n");
>> +			}
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	xe->wedged.inconsistent_reset = false;
>> +
>> +	return 0;
>> +}
>> +
>> +static bool needs_policy_update(struct xe_device *xe, enum xe_wedged_mode mode)
>> +{
>> +	if (xe->wedged.inconsistent_reset)
>> +		return true;
>> +
>> +	if (xe->wedged.mode == mode)
>> +		return false;
>> +
>> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET ||
>> +	    mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>>   static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>>   			       size_t size, loff_t *pos)
>>   {
>>   	struct xe_device *xe = file_inode(f)->i_private;
>> -	struct xe_gt *gt;
>>   	u32 wedged_mode;
>>   	ssize_t ret;
>> -	u8 id;
>>   
>>   	ret = kstrtouint_from_user(ubuf, size, 0, &wedged_mode);
>>   	if (ret)
>> @@ -271,20 +321,14 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>>   	if (ret)
>>   		return ret;
>>   
>> -	if (xe->wedged.mode == wedged_mode)
>> -		return size;
>> +	if (needs_policy_update(xe, wedged_mode)) {
>> +		ret = set_reset_policy(xe, wedged_mode);
>> +		if (ret)
>> +			return ret;
>> +	}
>>   
>>   	xe->wedged.mode = wedged_mode;
>>   
>> -	guard(xe_pm_runtime)(xe);
>> -	for_each_gt(gt, xe, id) {
>> -		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
>> -		if (ret) {
>> -			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n");
>> -			return -EIO;
>> -		}
>> -	}
>> -
>>   	return size;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 20a847965b20..e41f82518d75 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -626,6 +626,8 @@ struct xe_device {
>>   		enum xe_wedged_mode mode;
>>   		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
>>   		unsigned long method;
>> +		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
>> +		bool inconsistent_reset;
>>   	} wedged;
>>   
>>   	/** @bo_device: Struct to control async free of BOs */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index e95604416f2d..25ea17a74a64 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -983,16 +983,17 @@ static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_off
>>   /**
>>    * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
>>    * @ads: Additional data structures object
>> + * @enable_engine_reset: true to enable engine resets, false otherwise
>>    *
>> - * This function update the GuC's engine reset policy based on wedged.mode.
>> + * This function update the GuC's engine reset policy.
>>    *
>>    * Return: 0 on success, and negative error code otherwise.
>>    */
>> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads,
>> +					     bool enable_engine_reset)
>>   {
>>   	struct guc_policies *policies;
>>   	struct xe_guc *guc = ads_to_guc(ads);
>> -	struct xe_device *xe = ads_to_xe(ads);
>>   	CLASS(xe_guc_buf, buf)(&guc->buf, sizeof(*policies));
>>   
>>   	if (!xe_guc_buf_is_valid(buf))
>> @@ -1004,10 +1005,11 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>>   	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>>   	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
>>   	policies->is_valid = 1;
>> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
>> -		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>> -	else
>> +
>> +	if (enable_engine_reset)
>>   		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>> +	else
>> +		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>>   
>>   	return guc_ads_action_update_policies(ads, xe_guc_buf_flush(buf));
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
>> index 2e6674c760ff..bec404dda56b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
>> @@ -6,6 +6,8 @@
>>   #ifndef _XE_GUC_ADS_H_
>>   #define _XE_GUC_ADS_H_
>>   
>> +#include <linux/types.h>
>> +
>>   struct xe_guc_ads;
>>   
>>   int xe_guc_ads_init(struct xe_guc_ads *ads);
>> @@ -13,6 +15,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
>>   void xe_guc_ads_populate(struct xe_guc_ads *ads);
>>   void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
>>   void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
>> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads);
>> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads,
>> +                                             bool enable_engine_reset);
>>   
>>   #endif
>> -- 
>> 2.40.0
>>

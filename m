Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77317C61DD6
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 10:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACF410E358;
	Fri,  4 Sep 2026 10:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RruTcUFn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C8D10E358
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 10:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788518421; x=1820054421;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B+9m5d9y24JAVHmSfsUQmFTHHFSP8KQoAZE1u4jIBLQ=;
 b=RruTcUFnyr4zFPb7PjzQd6oKyQhYwpwJ2+3BDatQ6go7B6Wxb8xNsuef
 UvxnCPQrPXM2MpcxNVuZWHZJw6lBQys/BOvxtmNGqEUz37VVRF1Bkd0fy
 63OEktsjUW9vXkaFCB+ONyiInsUPprD8eWeTji7bdH8HBSl0SRCd1e8qp
 yfgO7WGPFcSdltSQ9vV3cRgxS2X7yFCI2LtVYhKqnyuitGe0UiE6Ev9K4
 GedSaS8MCd+XmRZTmeXrCnrgoB8d8Qe2XcA0g+tGAKXg++qw0VOVsgyI6
 cr2zD1+vaDw09lsP1xmft18g4lvl85FuxyBJ91xP2J74+bc/oi0uiK5Rb Q==;
X-CSE-ConnectionGUID: KX++kJDJRVitHkQoTiB/xA==
X-CSE-MsgGUID: nZVh32vMQD6l2Ye6jGVpLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100535628"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="100535628"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 03:40:20 -0700
X-CSE-ConnectionGUID: 83TKg5hFSJqKsO+rru6OpQ==
X-CSE-MsgGUID: tznsK0FgTYyaIXB40krDgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268276360"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 03:40:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 03:40:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 03:40:20 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 03:40:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGLQXMcJXy2l10KvSjfnar528n9OenrQ1pJP4grgfz3k4b1jU8HgUV6XLvoFOaENOZAH0/AVXA1LnT0zSeQabH6hXPHNRxJAopxXkPL07Ij1R4FGH9dxUD9ySSa8NkwA28OZq8lAM+kBgRVieHgkzKMer2XjjhciRGCDkFT6Dzhi+wg/yPXorwM9zqMLMLNLP7kSJdRjFFEYoHNsP/Pa413dF3Hs0E/QUlJHZdi3cm94bApYmF0HubhFPXupuU7cTY0o9J4zKEP7t2Eyll4yRmsOqrxPEjHklPLyNZYPxgrX3Xk0LA4jCM2ReQTrkzaccm3ObwlVMH3WZ4APojEgwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzP+sLl0lhnaJgFZ6ymTx3mg+FOOjscBZJfpyK2Zvis=;
 b=hNFyY2vZw1pJ/xz4lydtLQ5YXnU6GwXOFOh+lA2VPiJGszxICpab+UoX3aRxZ3WoYq7vXT+pHtUaQWGEtm85BRod0tJwma8Yypkjvip7GTBzR32UT23qVFqVAsJpZhqSHkBorHYFlwice+6guOPcVOPdWELZXC5IXKQOxPiud7Bd3wKW/Fq9WHLoImM5J0cG7syeWld8CKYceVPiyyiwe+5wJBp6CmxETrFV5ifNuizZx+QFWluczUAzvNDIhYbYwCHhH3q5MD5mkqFoRpArgYshqa6Ra5IxUp4hJJuWUTNw0TUp/Rx2pkcy9ycKNkVxweeCWRF25Zq3hDHcUnJkZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS7PR11MB6040.namprd11.prod.outlook.com (2603:10b6:8:77::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.12; Fri, 4 Sep 2026 10:40:16 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 10:40:16 +0000
Message-ID: <d16a1fc8-2524-4ad5-90b5-e943f112c4a2@intel.com>
Date: Fri, 4 Sep 2026 16:10:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] drm/xe/xe_ras: Handle page offline requests for
 device memory ecc errors
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <tejas.upadhyay@intel.com>,
 <himal.prasad.ghimiray@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
 <20260825063615.3697317-9-riana.tauro@intel.com>
 <17780d34-b06b-4db7-888e-e3734530ae31@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <17780d34-b06b-4db7-888e-e3734530ae31@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0256.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS7PR11MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 917b390e-0271-4d2e-9865-08df0a70e826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|18002099003|6133799003|10067099003|4143699003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: A8PyWbjkRUJ9zTHt/IEWFQ7iTBhZ3aLHSm7pCuFnCfsxTour1VFRSvQWmTOz1oFcGn1CoLRLssxhnBFKtPeRfvxwKCrsSGMZYvRHdh5nOdnCoLZWyj4W7xBGO2KC/hb1lkKJqFAMMPWtyRaufeGfzc994ZxyHCDjzIQT7sCrbSLMs+VpIUKWJgok2cQske/ZTd9uTqGOmbUa4veNbxB6QWEkiTv7J2yOBiLPwFiyEPLtE0psfhKYeAdZFaR6lkTOOxJwn/5V1YsU4mU3U3AgJsClF5C79jbrTKexkomnSrNmdynSz6Gwz+FAYNaePQlsO/fGMXmwjB06v0ZC6Z3fgdOyckfzuqd7k7vZ9UppCMkoC9Pc0at4qj2Fcekd6/ad1GNL4F4CKd1TI3ik/FB/kJOuR+kNr7N1avs9XSTHqr8CenmN7tOnhdj4Spq6/Ar03jRGihIyrVjwtDwsh2KTdttkbcR9eGw4bgXJqkeEUcdLrGw8D7kyg41Ia2ujCeD2ck/GVK4RjjMshtLifSlPKDkn6MepWTPX4otWLadRzcnQME7/mXzOw8/diwcUMxgiZCuivi63CjoGE+Dvp9sVfG0/R/QQlapVwOQvxRCRZkXks5+MBi/lAegFVqYdY0DLClT1miK6jEjO0xCpwxKJl9zJ1k1FywmdnKSGlrNQspk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akhyamt2WFl0VUhWc3JoVHRGdEk4V1lVWmVyWUJicVA5aExHeW5VRTlMa3NH?=
 =?utf-8?B?cmNHMngzNC9ZYVpKWlUvMlZSWlpYZmppU21GWkdjRG9RNktGUzZnbyt2MVNU?=
 =?utf-8?B?dDBOYkZCYU9sSk9SN0c4U3dTVytmZWRTUGhnZzd5T3pYMlkyQjBiZDlUUmk2?=
 =?utf-8?B?TXZYMEk5dWVzNHFCcXNyNFR4NWRrR2pKTUFQTUNidkthMDZXNDNrdFNEejJ4?=
 =?utf-8?B?c0g1bDFMZDdtV0xYcjhaMm1oZ1BRanpxWHgvdFFQempjeURha0NwVEs3bTNr?=
 =?utf-8?B?SGVHK0JQNFJOcW92MHhBbW9hNTdkNyt0NW9ZWld5WDJXOFBvQTBUMExJbXdk?=
 =?utf-8?B?c1RHcEtPZWVBOGJXYU12d2dva0VlTDdwTWFjVU9pUEtKUU5iVko3WG1KajNt?=
 =?utf-8?B?UUpRVk1YSFV6YldESW1VYUdhVnZvVHdoelE3NkJLbDNmUXJtUFR5Y0JzR1Ix?=
 =?utf-8?B?OHY3eG9LN2hxMnRVbXFtNlJ2bkxsUkR4ekNPVzFmVUFGeVhvUnJXV2xJTDQ5?=
 =?utf-8?B?RFFUNnFIM1pjUUpQUEVwS3lWNUozeW5RT2JrS01RZDlqWi8ydWV6a3NGY05W?=
 =?utf-8?B?NDZMYUs3cWN1aDN5VCtNV2l0WjUwV1RQS3dOYzRiYWE2T0RmUnZzWVE4RnhX?=
 =?utf-8?B?bkZIZUN0bUMyK1ZHajNKK0gxYlJXbFdCNUJ6dlB4aTBPUzVKVTFLQ285Wmo5?=
 =?utf-8?B?bHIrVFNGRjdTT3JQMGJhY1YzZTJ6bFl4YS8xSDVqZnRoL085bWJCZVlMYUlx?=
 =?utf-8?B?ZHNad1drM1gzZTJVbXB4OVhqVEVXN2g0UjNJbzlXSVBOdllZNWw2WDNnOCto?=
 =?utf-8?B?Q2V5WlVYV0ZXYkVvbmhMS0dqaGRnQlJZZndQSy9iV1RTYXVkTWRSKzJtTEJy?=
 =?utf-8?B?eWJsZThjYXkxT05ublZsejNrODJtaWV1dm5TMzJ5TTFSL1QrODd0SmxCV0gr?=
 =?utf-8?B?K2UreGdHOTJzY2gvOHUySTdGd09GV01iRmJmanVUWWRNQjRDSUR0R1l6ZVRX?=
 =?utf-8?B?Y3A0UkQ2eXNSdWdKeXZwNHRWWk00amY4V1dxQlo1UkZBUDVSYUdiWGxBMlNS?=
 =?utf-8?B?LzNsRUlPVGRkTFdMUmk5QUFSaDMvUXdDMzRIS2o1Z09JUElScDdOS01jdEVV?=
 =?utf-8?B?Nk9UUTJXTG9iS3M5YkRJdVA1UFR3MGdPTWRqQWNJQzN2UVp5a2pSaVZReFdC?=
 =?utf-8?B?UHNYd0dYSXAyaGkrVUV5RklsVGJGYlY0YURuSC84bUYzM0FhaXpQQXJTRjdF?=
 =?utf-8?B?TTZkdlJ1MjM2dCt1VG5RRFFLN3JuVlVWRnlYMzlxM0JxektHeVZiLzNPbjhP?=
 =?utf-8?B?MGVoZDgrTkRDOTlSaHo5Q3RaZDE1R21EYzYrc3RhczNOYVlmVUNyems0VlY0?=
 =?utf-8?B?c0NmZUlPNVl5M3k2dVlNazJlUldreUFPQVpaMEU1Z3JTQW9jem1DK0pwbWly?=
 =?utf-8?B?NCtsMndaQkRaaS9vVm9OVjYxTUNyNzhia3orbkpIUmcybzRPUUNwZ1JOR0s1?=
 =?utf-8?B?N1RGWUpJbTcySnpYTlZrSWsvdGlzUjMrT291OWI2T3lPZEIzQ2ZqZDBtVzE5?=
 =?utf-8?B?bVkrYm4rWGRKaGFEc05sdXVmRk5sZmRnbkF4eGEzMDc2U3JmaGgrcDZRRVJm?=
 =?utf-8?B?MEVESWhYTTBwSkdqNGx3L3NiY29iSm8xdGhOenRwQUp6d2t5M0RJMjZVaHJz?=
 =?utf-8?B?ck1TRy8raEFoazczY2YvTmErNVNGL2x3c0lCSHRNbFpkMGZmSGhSNzVTbGtV?=
 =?utf-8?B?ZU1TM2d3a2dKUzBNQ2ZFYlpwTnZtajN5bzRJd1pIUjNtQjRTMm01Nm5pK1B5?=
 =?utf-8?B?ZHZ0M2t2Mml6cDl0NUVCOTUrLzRpMDBLTnVSY0JYNWNSZTJ4eHVpaXEyN1d2?=
 =?utf-8?B?bHYzYXNncE4yL0wrOGx2Q3BRd3h1S2RLNzZDd1ppWURCMnVuY25leWJrN0Fv?=
 =?utf-8?B?Qm9xMkZDcHlWcDJsN1hoZTROUS81S3VvL2RwUkRvUVRWMGlJdGduZlMycitO?=
 =?utf-8?B?YVB2VmNJNnBXdFJUc1ZnZFQ3YUdjMHNFcUMwd2R4TE8xMFc2MjFIWjUrcVFi?=
 =?utf-8?B?NWtEQmp3L0Z1a3dTWUc2ZUM5aGxsdXBTeHNVTmc3WmZFNHB6czlya1JNbFpl?=
 =?utf-8?B?TVlsSjZyR0RZSSttTEFyT041dnhtMW42ZEdRSDJUUmd3cE1SRm5kVUFHUW9Q?=
 =?utf-8?B?Wlg2em05cm4xQkovTTAzbWd1OXR6SWFtaXZ4eWNDc3prSFJYRlBSYi9HcllC?=
 =?utf-8?B?bVVOUmx4NlJQRzFyYmRZeDg4V0FjVWlJZzJleDIvZWtDSFZSSDBZTm1BQ0x6?=
 =?utf-8?B?VDEwU2VaWnRSVSszL3JkWkN6bEVGU0VDUXVtNUpPeWRUbzNKM3d2dz09?=
X-Exchange-RoutingPolicyChecked: GL/FA12O2Hr2BdOwTWb+1kShzCqPPNYcEHD38YYRJTKcRQP9/UKi2CcF2vkmFrW3wyNK8EHNUYLf/YfRdbjx/cWHzoKVhFGsKY1WEBh67v2WdFnnTBJ5nyffK4bOoOwlw6ZO0bg9jl/dqLrj6DOHRnw+2C1dTrdU+xJUa/qqnSWKgSRzLBDmq7KxCwBlC/nGQP6XEkTXEgZc12UGA/xkSsEfIKCLdznQHm3ODGL+aLCNXDimA/v7gZapJNXbJFuGf6E3yAO9ZDY/kJaAsgjiJvBDnx/NYRA7jxkqB3AUA5CpEtMxcq4yJ5+JLM8eZvenZM87H/js+WOX4avX3Ws2ng==
X-MS-Exchange-CrossTenant-Network-Message-Id: 917b390e-0271-4d2e-9865-08df0a70e826
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 10:40:16.0971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1Tx4q3gFvISgLJgLViI+7bZxH8M4A/mJYZXwvxuiuFjt41Vrh3PFYJiSRIhmlYibr7M4mgonIeS8HGNS+pBtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6040
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


On 02-09-2026 12:00, Mallesh, Koujalagi wrote:
>
>
> On 25-08-2026 12:06 pm, Riana Tauro wrote:
>> This will be integrated with the related address-fault handling flow
>> once this patch is merged.
>> https://lore.kernel.org/intel-xe/20260818104055.3833974-14-tejas.upadhyay@intel.com/
>> Sending for initial comments.
>>
>> Add basic support for sending page offline/decline requests to system
>> controller and use it for device memory ECC error handling.
>> Pages that belong to critical BOs cannot be handled by offlining and
>> require a SBR (Secondary Bus Reset).
>> Pages that are configured for log-only handling are not marked as bad by
>> firmware.
>>
>> For all other valid page addresses, the first occurrence of error
>> indicates a poison error and the page is offlined only by software.
>> Firmware avoids permanently marking the page as bad. The second occurrence
>> of an error indicates a Double-bit ECC error and the firmware
>> permanently marks the page as bad.
>>
>> Cc: Tejas Upadhyay<tejas.upadhyay@intel.com>
>> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 121 +++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_ras_types.h             |  35 +++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>>   3 files changed, 153 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index d25d25f77531..c643c7137a42 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -3,6 +3,7 @@
>>    * Copyright © 2026 Intel Corporation
>>    */
>>   
>> +#include "xe_bo.h"
>>   #include "xe_debugfs.h"
>>   #include "xe_device.h"
>>   #include "xe_drm_ras.h"
>> @@ -200,6 +201,115 @@ static inline const char *comp_to_str(u8 component)
>>   	return xe_ras_components[component];
>>   }
>>   
>> +static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
>> +				 enum xe_ras_page_action action)
>> +{
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_page_offline_request request = {0};
>> +	struct xe_ras_page_offline_response response = {0};
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	if (!xe->info.has_sysctrl)
>> +		return 0;
>> +
>> +	if (action >= XE_RAS_PAGE_ACTION_MAX) {
>> +		xe_log_err(xe, DEVICE_MEMORY, -EINVAL, "Invalid page offline action %d\n", action);
>> +		return -EINVAL;
>> +	}
>> +
>> +	request.page_address = page_address;
>> +	request.action = action;
>> +
>> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
>> +				  &request, sizeof(request), &response, sizeof(response));
>> +
>> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +	if (ret) {
>> +		xe_log_err_fatal(xe, SYSCTRL, ret, "failed to send page offline command\n");
>> +		return ret;
>> +	}
>> +
>> +	if (rlen != sizeof(response)) {
>> +		xe_log_err(xe, SYSCTRL, -EINVAL,
>> +			   "unexpected page offline response length %zu (expected %zu)\n",
>> +			   rlen, sizeof(response));
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = ras_status_to_errno(response.status);
>> +	if (ret) {
>> +		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
>> +			   response.status);
>> +		return ret;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int handle_page_offline(struct xe_device *xe, u64 page_address, bool send_cmd)
>> +{
>> +	enum xe_ras_page_action action;
>> +	int ret = 0;
>> +
>> +	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
>> +		xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned physical page address: 0x%llx\n",
>> +			   page_address);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/*
>> +	 * TODO: Call function to handle address fault
>> +	 * ret = xe_ttm_vram_handle_addr_fault(xe, page_address);
>> +	 */
>> +
>> +	/*
>> +	 * Handle return code from address fault handling function:
>> +	 *  0: Page soft offlined, decline to firmware
>> +	 * -EIO: Address belongs to a critical BO/stolen area that cannot be offlined
>> +	 * -EOPNOTSUPP: Address is valid and can be offlined but user policy is not to offline
>> +	 * -EXIST: Address is soft offlined but yet to be offlined by firmware for second occurrence
> nit: -EEXIST?

Thanks. Typo will fix it


>> +	 */
>> +
>> +	switch (ret) {
>> +	case 0:
>> +		action = XE_RAS_PAGE_ACTION_DECLINE;
>> +		xe_log_err(xe, DEVICE_MEMORY, 0,
>
> I know, it's switch case using ret, please make use of errno as ret 
> from xe_ttm_vram_handle_addr_fault ().
>

This is 0.. do you mean replace 0 with ret?

> and make it consistency across all below xe_log_err.
>
>> +			   "Poison detected at physical address 0x%llx, page software offlined\n",
>> +			   page_address);
>> +		break;
>> +	/* User policy set to decline page offlining */
>> +	case -EOPNOTSUPP:
>> +		action = XE_RAS_PAGE_ACTION_DECLINE;
>> +		break;
>> +	case -EIO:
>> +		xe_log_err(xe, DEVICE_MEMORY, -EIO,
>> +			   "Physical page address belongs to critical BO: 0x%llx\n", page_address);
>> +		return ret;
>> +	case -EEXIST:
>> +		action = XE_RAS_PAGE_ACTION_OFFLINE;
>> +		xe_log_err(xe, DEVICE_MEMORY, -EEXIST,
>> +			   "Double-bit ECC error detected at physical address 0x%llx, page already software offlined\n",
>> +			   page_address);
>> +		break;
>> +	default:
>> +		xe_log_err_fatal(xe, DEVICE_MEMORY, ret, "Failed to handle address fault 0x%llx\n",
>> +				 page_address);
>> +		return 0;
> hmm, In default case, we need to use return ret; right?

If we return err, then we would cause a SBR
which is needed only in cases of system controller's failure to respond 
or belongs to critical bo.
Any invalid address can be ignored.


>> +	}
>> +
>> +	if (send_cmd) {
>> +		ret = send_page_offline_cmd(xe, page_address, action);
>> +		if (ret)
>> +			xe_log_err_fatal(xe, SYSCTRL, ret,
>> +					 "Failed to offline page for physical address 0x%llx\n",
>> +					 page_address);
>> +		return ret;
> 'return ret' should be inside {} 

It is inside {}

>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class *counter)
>>   {
>>   	u8 severity = counter->common.severity;
>> @@ -367,11 +477,12 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>>   static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>>   {
>>   	struct xe_ras_memory_error *info = (void *)arr->details;
>> +	int ret;
>>   
>>   	/*
>>   	 * For memory errors, the recovery action depends on the error category
>>   	 *
>> -	 * TODO: Double-bit ECC errors: Page offlining
>> +	 * Double-bit ECC errors: Page offlining
>>   	 * Poison and data parity errors: Log only
>>   	 * For any other memory errors, request a reset as recovery mechanism
>>   	 */
>> @@ -383,10 +494,10 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>>   		xe_info(xe, "[RAS]: Data parity error detected\n");
>>   		break;
>>   	case XE_RAS_MEMORY_DB_ECC:
>> -		xe_info(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx\n",
>> -			info->sw_address);
>> -		/* TODO: Add page offlining for Double-bit ECC error */
>> -		fallthrough;
>> +		ret = handle_page_offline(xe, info->sw_address, true);
>
> In case of soft page offline, we need not required reset right? 
> however when send_page_offline_cmd
>

We do if system controller fails to respond or if it belongs to critical BO.

Thanks
Riana

> return err that case, reset is required. is that correct behavior?
>
> Thanks,
>
> -/Mallesh
>
>> +		if (ret)
>> +			return XE_RAS_RECOVERY_ACTION_RESET;
>> +		break;
>>   	default:
>>   		return XE_RAS_RECOVERY_ACTION_RESET;
>>   	}
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 99b2466e2062..2fac968879b6 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -17,6 +17,19 @@
>>   #define XE_RAS_MEMORY_POISON			BIT(2)
>>   #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
>>   
>> +/**
>> + * enum xe_ras_page_action - Page offline actions for page offline request
>> + *
>> + * @XE_RAS_PAGE_ACTION_OFFLINE: Instruct firmware to offline the page
>> + * @XE_RAS_PAGE_ACTION_DECLINE: Instruct firmware to remove the page from queue
>> + * @XE_RAS_PAGE_ACTION_MAX: Max value
>> + */
>> +enum xe_ras_page_action {
>> +	XE_RAS_PAGE_ACTION_OFFLINE,
>> +	XE_RAS_PAGE_ACTION_DECLINE,
>> +	XE_RAS_PAGE_ACTION_MAX
>> +};
>> +
>>   /**
>>    * enum xe_ras_recovery_action - RAS recovery actions
>>    *
>> @@ -245,6 +258,28 @@ struct xe_ras_memory_error {
>>   	u32 reserved2[10];
>>   } __packed;
>>   
>> +/**
>> + * struct xe_ras_page_offline_request - Request for page offline command
>> + */
>> +struct xe_ras_page_offline_request {
>> +	/** @page_address: Page address (4KB aligned) */
>> +	u64 page_address;
>> +	/** @action: Action to be performed, see &enum xe_ras_page_action */
>> +	u32 action;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_page_offline_response - Response from page offline command
>> + */
>> +struct xe_ras_page_offline_response {
>> +	/** @status: Status of the page offline request */
>> +	u32 status;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
>> +
>>   /**
>>    * struct xe_ras_get_health_request - Request structure for obtaining gpu health
>>    */
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index d0341538ad05..3363f48da2b7 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -26,6 +26,7 @@ enum xe_sysctrl_group {
>>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>>    * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>> + * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a page
>>    * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>>    * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>>    */
>> @@ -34,6 +35,7 @@ enum xe_sysctrl_gfsp_cmd {
>>   	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
>>   	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
>>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>> +	XE_SYSCTRL_CMD_PAGE_OFFLINE             = 0x08,
>>   	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
>>   	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>>   };

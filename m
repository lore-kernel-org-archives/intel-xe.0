Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C34F606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 01:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bGlix6Am;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=GTBYL3X6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3616010E6FF;
	Mon, 23 Nov 2026 01:19:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF5D10E6FF
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 01:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795396787; x=1826932787;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HMrc6B+UD2p1cIzwqMSE/39z9CfznHt2yYlbW8CClTg=;
 b=bGlix6Am78HJY3dFavfe92+1fCoMgEVe1F0NFmScmdLo9KwB43GNuSZz
 Cjklb8zbkgvAkv6xvdtEwPLm27i4vDDCpht5N72mIRFjqlPsgSht5bhAs
 S54x6eimuxas6ojOKHtsITBm6X9Bn2UvaJ+dSfR7UzLu44ZcY/UzVc5oN
 cNEiPlUT2Dwc1+irTpSyneFnjq3Qx/yyhAt8/i5EhJFAGGAlYGRUUOFR/
 g9Q14cLHTDYD1VVN9YPqjpTPLfOZQvq6EN3HGRXQWbQIQ/zMzt0KVT2uv
 dGHeduqd/GWGocx9H8Zn+5qYepDgLmCnYxpgjzTTk43e4H3KBvDjLCch2 Q==;
X-CSE-ConnectionGUID: fuhIfhv/TzC68psvrG/erg==
X-CSE-MsgGUID: dPeeGZYfR72yxiIJ9F3uHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4194757"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4194757"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 17:19:47 -0800
X-CSE-ConnectionGUID: 6Cy5QMFtQI+G0NAVLroNFw==
X-CSE-MsgGUID: ReaA6tcLSPauPdovC/Y5OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="12991819"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 17:19:46 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 17:19:46 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 22 Nov 2026 17:19:46 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 17:19:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlUezQ5UWeUxNKeJoByf8RDm910HcrrWizBrvGi2bBmhipgH15L6zTMLAlvf2aHXDWLOJoGlEiOhu6ccl9FsChFEWrottoxAOyzioPssHdKjfh7fJrIZqg+eMpMcPctP7b+b4Kzk+UqSqNTxKgNDkfQ9tq7wKCaC/YLhAqxZfyskq+YgBgshowkNjqi0M/iOGjEelLCx89m5QLXeo7ycm4peDvMQHhyWZRxtAfuWk3g7F47s68dSKvbKSkRU6dVHdCMC76n85E8B0AlL9GNDDcY5PauHWFsNcNtPWLQC+X5Oi1M4ewvVxM620wBZpH3NurDsyjmt/6W6KQRQVgQ/bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhEFi7Vh+vg6zfuMRal39RuFTnAGj8rYJJCZJuTOnpc=;
 b=S2ea/CKTENls4xIyr9pYw15zB/t4OVdRWrXqnBC5+pYIt+SXqtykQqusTUTBJ09z7N6tfaBAdTbjIsNJk0k44Vgc/zDh8RT0Js6Mav6n3kp4KxVBSqelkvwoBdWfojibr0WJRSohjlUZCOmwnQdaWmq9u6PIFdrMlf0FUJNhnsdFYHY0TGR13oxyIhwMYKUit/NNPz6Jsgrx9HwKJYzjpG38mKX7D73eMIXicbc6M8DUp5RJENnA64QQePQleIVwUXEwgd3lz/eZhxqfszg5I+bkz0EEhndSBOUNkrozsG1hsfee9O5mCrmKPwyePbQjV5Zc6P7Fr3xGDLIODAtzYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhEFi7Vh+vg6zfuMRal39RuFTnAGj8rYJJCZJuTOnpc=;
 b=GTBYL3X6uZDhWa1oneVpMkIYdfVEUmAbCRwS3kg1DYTW22HjfdG6WDjMu+PCvhyGPmv+mGhIdcOwzols7Qhc3B7TvUSNzcA1aGyTxaHQcm5Ph4U22JrIfFHggcua3AszZiYUqV7WoSxsMm9vLLVYwTD7eBUWswRZHjXFUUZoHDE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 01:19:43 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 01:19:43 +0000
Message-ID: <82df07bf-5f74-4211-8257-b5f41deb98b4@intel.com>
Date: Mon, 23 Nov 2026 06:49:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] drm/xe/log: Add software CPER information to KUnit
 output
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20261119060019.2031897-8-mallesh.koujalagi@intel.com>
 <20261119060019.2031897-13-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261119060019.2031897-13-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::11) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|LV3PR11MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bef78c2-db22-478d-96e4-08df48ffda8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|11063799006|4143699003|56012099006|261021121427099003|261021123027099003|261022075727099003|261026140227099003|261022105027099003|261022113327099003|261009223027099003|261028144727099003|261102123227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: pFIk/mcovQ25rkTDe2pm/NFRR6vl8J72voPcZgZtiNPZMFIUmxzLlD+LwbtELosCx1X8/dO0kn9q8s+oFpEw/h5eIsh/Anmg6P80bI2rSwTOp7Watnpd5veigpfMitWj1Dk4ITyK6N0TSaaZkGD7G5hK+NF7hsCrbHaI8tQC7vnFlCMjyJR//uG5hR2JxV/xHzl6UzmsRqeoJK+ZtahJrXGTzrbV/4tGyc8ccRv0iIKZN4cTUvO4PvMxGnHUyyjplTbst0j8MNkpvE2J5/j2xs9Va98LEUkucM5iDKML8cEzowvmyGA9YnKZmaiC17R5DXlZtlKcKaFqKASakbStvmV5kL3ayC5YbTel0RZMzQFE6SKoyR+qPnnBXsP4qrK+CuCNidw8YrXzdaGMuAmQ04o+3wSeTgpD7XruhraedchijrXzhTRnaFTiYhaBlEznbYnwic5dOeu7oTfic1iVoqk2RdLrDxQ33vHs9+czvZyCkLUmdjm68J3wffFnnbGKiHJQmmmUebHjG5MPWVK1i7i87Jb6eaiTEhvaCrWaH5zifBKIGa3GXhBlGwk9+Iswend/JFFSQKAOwgoE7cYopT+SzdtPRrnfjOmaHUpo4MDAWsD6x9J7+XMAlwhibg4R04RikR6kB/maOP46orTiqQ1pHIKq2AZRmaTaq2rXW9E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261021123027099003)(261022075727099003)(261026140227099003)(261022105027099003)(261022113327099003)(261009223027099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmVzaWQzQjNGRHVYblVDSzAxL1BtMG9ndUdvZjM3czl5Rk9kWHJwdHFnTms2?=
 =?utf-8?B?NWFUdU1reVdBMDRxMEtqZkpkeUFZbFo0em5GUnpxa3NVbkFRSUpzWm1ZcDV5?=
 =?utf-8?B?MHJKZmY4SlZWUlJubkkrWWc3d3dHVGFiYkhmWnV4N1ViQ200eW81RXBGV1FH?=
 =?utf-8?B?blZxZmk5M2ZTUENtZ0ZRSFgyb3hOVEVSVDlmQXYwb2VOR0N6Uk1VdjU3eUlD?=
 =?utf-8?B?TnVLeEtFNjRsZWsxSkVPaS9hdzBlVnNtWVVCNnhySHdBZncwNGpUdXRJN3lz?=
 =?utf-8?B?QTdLTzlQZzZDWDZRT3lUL200ekVkZ1NPTTA4OE9tRTd1T1UvK3VFbWN3TUpu?=
 =?utf-8?B?Nys0cGVuOUtFRmlrdGJPVmZDVkJ5RVRRbkNTZkVIdUg3WnlUUjZwZ0RNNEZz?=
 =?utf-8?B?ZEd1MVV4UlJ2TGE1MGlVSmFSWWFDd1pMU1JYellBNTBDSFlQdVRac3d3emJZ?=
 =?utf-8?B?NllGL0tDWGxWQUJWVVZIYkpIc2NmQm9SRTl6WDNQc28zc2E5bnY4ZlFiakMr?=
 =?utf-8?B?eVlNUXVUVEl4ZlMvL1J2ZDZyTXExZXh0TUJNWUhtUklIcjNDemYyWHNab0Uy?=
 =?utf-8?B?Q1RGcE1QS0hOOGg0SzJLeGFma05VZVRkZVhqaDdYNnNpNGFKSW9VcWVDRWVD?=
 =?utf-8?B?bTZJUURqOVVHbWxZV2pRNk01NnRMZXRPMGYxUEVqWkNORzZNWTBvT3puQy90?=
 =?utf-8?B?WThlQUNPdStGZVVvT2FRekNPTDc3R2hVZGFrMldoam1oNHVsMURGeTV5OEho?=
 =?utf-8?B?SERsbWFmVFhOMkZjaHNqc3FqNkpsaUVybDE1RHNIVFA4YU4xZ0c5V3A1WVdM?=
 =?utf-8?B?MXRITjNzcjBsSGdiOGFMSmYwdFBmYXJ3YWs0RzRxWXdHNUgrMDBkWHJGTU5G?=
 =?utf-8?B?WkgxdlltSHBGSEpXVkJXelQ5TlduR09QYnNNY0VYWW8waU5OTzRxdlBFYXFQ?=
 =?utf-8?B?TjNtbkIyWUdycktZeHF5Tm8rUlFMNDJmc2NSQ3ZEL3RYMDJIajYvUVROWi8r?=
 =?utf-8?B?Q0N1eUVSV0JDQWprc3NzMUxyNE5PR0tIQUx2clRJejI4RkIrdTZmamVMOFps?=
 =?utf-8?B?MWRPN3JFQmprZFhXeVZuQi9SOWVod2FMRUE3U0dRd2ZMbzc4a09PdjQ1blI2?=
 =?utf-8?B?NGhMT1BObk5NREpFWk5MUytNWnFQODFXWW9KbzdEQUxaR1hteTJIS0U4RnZn?=
 =?utf-8?B?dzYwaC9RR2pXUTZ0WExzK1paVk80aFI3ZEgxWGM3NFFjMmlUNnFOdlpWbXlO?=
 =?utf-8?B?em5tYWhlNE11bWt2eEY4c1pJT2dTOXd1U0pDTml2UExjR1RqSlZQSUIwRG5p?=
 =?utf-8?B?Z25jN1h2NzdOakZnUnZzUVVpWW5FUHNETW1hdU1Fb05YK3o4cWYzekdqTkdG?=
 =?utf-8?B?enVjenExZ2lHdmQ4NkRySDFmTUJGZi9OUXBObHhOYWtEcGhvQ3l4UFl6Z3lW?=
 =?utf-8?B?Umtocngwa1ZOK3gyVTA4MmZMVC9UN3BYS2RuK09jb3BpSkJIbTd0MHdFc25Z?=
 =?utf-8?B?dGFhR2I2RWg5OW43Mi9Ndk5zZGI0b0hySXFJT3hIL0xoeHVNVUdjeVVBdkp3?=
 =?utf-8?B?YTErRUZheW1Rd1k4ak5nNkFESzVOeXVwOTBzQjl5VUNCWFJxTU0vS3ppc3Yx?=
 =?utf-8?B?YzFOS3lSYytjenZNNmhUVGZSZjIwbWhtQ0ZNcVd5Rk4zK2YyQmZKK1Yzbitw?=
 =?utf-8?B?azVSYnZISFNTRzM1cVkrZWh0UmR2cUZYQXRZOHRmSGxwaXgwZy9RQWFrL3FM?=
 =?utf-8?B?MmQ3TXU5b1V1aytvbDBvQlVEbWFtTlhMS3MrbnVWQkFLbXVCT2h4cXBNS2ZC?=
 =?utf-8?B?SmRIMXlRMENlQW1ROTJiR0Q2M093QzVkR1MvQzhseVhjeWZCd1hNdklVdHZl?=
 =?utf-8?B?OVIwdDUrY1JEMVdZNFZaRlVhTXFJb2J6ZUhrRm12UE5MTWQ3dVhqQm5BNk1H?=
 =?utf-8?B?SWcyVmtNVXBnQmpzdG1BSUJ0VHc2ckNuQ1F3clZHMnNvTjFrT1F3aGVWbHdZ?=
 =?utf-8?B?SnliTDZqRjgvWjV0bEVOL01SbGwvZ3RKa08yTlZTWmZjY3JzRUZ3d0hDVER4?=
 =?utf-8?B?bWtMY0lOSjJUM0xIWTRseDRJcENjUXBvV0dqczZWT1R0UnNtczhleDd1OU1S?=
 =?utf-8?B?amZIMktoZWhRVldiaGVuZE9uQTZON2xRR2tVdnV5NUN2ZW1ka0tseXk1R2Iw?=
 =?utf-8?B?UmRCUkpOeEpMNXd4bStqUDlRaEFLVFJzUlkrZHRSa3BOeWdNUkRkU0lxWGNT?=
 =?utf-8?B?cTVtNDdMWWtudTJEMXRSV3BPZ1d5Rk8xay9TeDlRTVVuMHBRVk9FWlJqVFUx?=
 =?utf-8?B?cXhvSjJVbWQ3ZnJpeUptZksxQmhmYlgyQjZWd01IZGg4Mm1IN0VuQT09?=
X-Exchange-RoutingPolicyChecked: XovA75aevEHqZ2D5NAnV8nI20aCADrBhaLxyPJEBZpSvxaKx+XH9e+lyMjqtpdRv2QBHUbPSCMKfhqxXJ+1srWFxlb+itCFVFIVBgs80FWpGL6PhBIbmUcvXuvuxzNxHaqbxWruBQjiv/ed04iAIbg1DbqSxSqVaZWrRDGq76VhNrqfXWt2E45RZDcxkqytFbqenuIqLvCjg8J04kLlU0Jiwj260l+1lht9LMprFP3JQ0ySRkQcT3RDNZ2IMCSVlvz/uIikEw7CeqThv2m11qHzEt4Pu10AKI1C4yRkfg/iPHXqOA+IIcgSIGQZ5iFo1GPv01J/4B2TFw+vGkcbwoQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bef78c2-db22-478d-96e4-08df48ffda8c
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 01:19:43.4222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKKUSCMU3DFB6c0pIGKl2AP1i1PZzbmM0yvTJJ1YS2j97mr0tnlc0kTPgzajmJaG/HEG0mbMyaIMknyEfeCn+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8603
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 19-11-2026 11:30, Mallesh Koujalagi wrote:
> Print driver classification details for software CPER records
> in the fake CPER emitter used by KUnit tests.
>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_log_kunit.c | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_log_kunit.c b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
> index 56c36c8a08e1..08828ecc9098 100644
> --- a/drivers/gpu/drm/xe/tests/xe_log_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
> @@ -6,11 +6,14 @@
>   #include <kunit/static_stub.h>
>   #include <kunit/test.h>
>   #include <kunit/test-bug.h>
> +#include <linux/minmax.h>
>   
>   #include "tests/xe_kunit_helpers.h"
>   #include "tests/xe_pci_test.h"
> +#include "xe_cper.h"
>   #include "xe_device.h"
>   #include "xe_log.h"
> +#include "xe_ras_types.h"
>   
>   static void nop_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
>   {
> @@ -43,6 +46,19 @@ static const char *location_type(u32 location)
>   	       location ? "?" : "";
>   }
>   
> +static bool is_sw_cper(enum xe_sigid sigid)
> +{
> +	return in_range(sigid, INTEL_SIGID_GPU_XE_SOFTWARE_START, INTEL_SIGID_BATCH);
> +}
> +
> +static void fake_emit_sw_cper(int cper_sev, u32 component, u32 location, const void *data)
> +{
> +	/* mirrors xe_cper_driver_error_class: full 16-bit component/tile, unconditional */
> +	pr_info("SW CPER CLASS=severity:%u component:%u tile:%u cause:%u\n",
> +		cper_sev, (u16)component, (u16)location,
> +		IS_ERR(data) ? (u32)-PTR_ERR(data) : 0);
> +}
> +
>   static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
>   			   enum xe_sigid sigid, u32 component, u32 location,
>   			   const void *data, size_t len, struct va_format *vaf)
> @@ -51,7 +67,8 @@ static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
>   	int n;
>   
>   	pr_info("\n");
> -	pr_info("CPER SEV=%u SIGID=%u\n", cper_sev, sigid);
> +	pr_info("CPER SEV=%u SIGID=%u \t# %s\n", cper_sev, sigid,
> +		is_sw_cper(sigid) ? "software" : "");
>   	pr_info("CPER DEVICE=%s\n", dev_name(&pdev->dev));
>   	if (location)
>   		pr_info("CPER LOCATION=%#x \t# %s.%u\n",
> @@ -68,6 +85,8 @@ static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
>   
>   	n = vscnprintf(msg, sizeof(msg), vaf->fmt, *vaf->va);
>   	print_hex_dump(KERN_INFO, "CPER MSG=", DUMP_PREFIX_OFFSET, 16, 1, msg, n, true);
> +	if (is_sw_cper(sigid))
> +		fake_emit_sw_cper(cper_sev, component, location, data);
>   	pr_info("CPER END\n");
>   }
>   

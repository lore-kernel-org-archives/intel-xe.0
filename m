Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF46C3ABB2
	for <intel-xe@archiver.kernel.org>; Mon, 16 Sep 2024 18:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B428D10E3C8;
	Mon, 16 Sep 2024 18:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X81K680z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171E810E1AD
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Sep 2024 18:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726512159; x=1758048159;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6kNxiUYp7PGLVVZI2/yeLNCOJU55kDpgbqk1OBFXyx4=;
 b=X81K680zmMbCMxDdyyn4dVB1COVUMxtP3PotAArm4OPSnDLTkh9sDCVD
 suP+p0M4wl9B8CykXes/J9BUGv8lI3kVr7/RQfhGZkSKz69jVIn7DboXf
 49RV1JvL0DiScf1eHYJlxPBQYjKU70+AAgSH2fwqNsceS8GjGbfhCyu9z
 anuFG1wZ4BSkb5hRmGk2sFvlcBT+ZCF1rQZGE1U04TABsFQV68YN8bfZZ
 NfymMNC7A2Gnb8dRHeyz7nI9tP5RfVENKdwy8LCwzCrZ1SggDZ+c1DnWq
 X6ozMVNu8xR8+6UwWpYjrwSPKwng87bpXD7ndF5TDHXI6zNFPk0T1Z8eX Q==;
X-CSE-ConnectionGUID: rw2fjiUrTWeWnOF1EGlJXw==
X-CSE-MsgGUID: cyIEw27OQH2YrxN1OuzMtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25229221"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="25229221"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 11:42:39 -0700
X-CSE-ConnectionGUID: jxWIq/gUQxOGjdHw2y9yZA==
X-CSE-MsgGUID: 5az+WSt/QY6lOE9OC2cMsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="106412068"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 11:42:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 11:42:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 11:42:38 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 11:42:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ha/rlixl6tG4KB2ueRyv3mixGZLE8UcxgSiVDAD6dgmUKId63JNY7uQ2kTqI1IUiMv9u+aeCnYyepmvL1yY4aoQD26EF6ghcQq7k6wISpwlOVhpsw18yjFrfLe0Z6VyC1u20OiMxiorQB8GAaZOsUTLZxMIh4HfWENxrT41XFshqdAKzKCKnYmcV56DHbcFqZ4hNvMV+dhSl/2oBJKr8n6MQrBtFuO4ijMlE9u9IEaxmldoQEJXQYSBsGtAAzSqdcHLGKdOurTr3PYpY0KlZV8dxOH5FDZU5CzteIdlKf5Hi/VYKqFUH8km2qKsZ7OeP3MX1lGAZ4NPNNgfaqf8NoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fasg/JLLqWHWFXj9Qfizg4s3Xyox8NEopJfowgDz8wA=;
 b=N28D+s1HUVgbbZJ8KDl0jVX+QeW14w5S1BUM5mKWcjn8rGJYdILkEs4/VraHUG3uRzHNjO/ofy8w9l89s9xSnz8gwSXZdam4yBa9TMGEAn/JmvgbOkcf8ZWayz9bOL4wIWx1zH1WC3wy9ZRxZcynJHZc7SsIwNUU51yDzSRUya6gmVrcCyGkJx+loEQVriSSyxLDzL/wUI/o9BWKoTwViPsmeqamfRp5NTbFvbkDfzekZuM3bxFkeVg1X2/HPBVm3sa4ZXGj8urFROLUiFFdrVPjYxAMYupuVXpzbZFQuYA3pzuWySBTZMdjXLe/7zgVWjAUcPyJn77HMVtZwvCQSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SN7PR11MB6849.namprd11.prod.outlook.com (2603:10b6:806:2a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 18:42:30 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 18:42:30 +0000
Message-ID: <fdf3d4ea-dacb-48e2-8b20-a4fd6fd73e00@intel.com>
Date: Tue, 17 Sep 2024 00:12:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/23] drm/xe: Change return type to void for
 xe_force_wake_put
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-24-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240912191603.194964-24-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SN7PR11MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ce2061a-92bb-42e9-ba34-08dcd67f5201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDl5aWZWZEx4LzlQaDRoVXlET0ZwSTlMZERVWnlLbFFZSXF2Y1A3U1pOY0V2?=
 =?utf-8?B?THFicTQyV2lUZlVkZjkxbVc4TnkyeHUrN3ZodkZsWmRYbHN6TExTaEJYSlNn?=
 =?utf-8?B?M1VwT3c5R1laQXFDZFE4eVoyUU5Ubm1qVG1tRCs5NUJqcEpzTmJrVkNReDhn?=
 =?utf-8?B?UmErOGwrbmdDK3lFcHlqSUtsMWFYblloMGVyOURQR0ZHWXJRU3cwK2xmejVy?=
 =?utf-8?B?ZWVXdnlLcHFZWTZaWDV3VC84ZkEwcHk5YzVuR3lxc3VrSEphK1l6ZXVma08v?=
 =?utf-8?B?MVdGTnhCWldtK2M1RGh6TjVmN1VhU0xoZE96aU9ZRDREUWVVMEpwN0J0RDcr?=
 =?utf-8?B?VnVWWUxScExPYnNlbngxWERsMkZxeWhmSEd0YVJmTDhKMkNwOVZ5N0JqT1ZI?=
 =?utf-8?B?cGNwNlQybjNEY25WTHp2WFN3cFMxWVFmcCtoakNFcXJoR3JMTEV1QlM3V2pP?=
 =?utf-8?B?ZnE1VXFaVXN0dWFjK2FtWUo5b2JZODlWcEFiUXdwcXY1MTNYOXJKZHVvQms1?=
 =?utf-8?B?RVkzdzh4NmNCcHJjOGJOZWc2QVcvS0Jvay9BRks5a2ZTNDFlZmV4Wnp2bWRD?=
 =?utf-8?B?c2FpSEd0TVlQOHpoSUpMWVlJZDUzbmYxZjA4V2NCMU15ZURTT3JEc2xLejNZ?=
 =?utf-8?B?L056L0RtVTNiL2VVcUpONmZKOFFtejBQZVUwcUdrTDd2SG5nV2xXUVZXMjhH?=
 =?utf-8?B?QmlrbW9LcHlEOHAxTXZqT2YvSXZOdk9wWW5kRk93QTFvY2E1aExzQVZacTRJ?=
 =?utf-8?B?OFZ0WUIzZURHaGdlN3lSOUlnZWVKL21qb3UvYlpHTGdKWHF4eEl0M0RTTHFF?=
 =?utf-8?B?T2duajhJMENZa1h6NU04b015dEQydjdCakpDYy9iR1NZTlE4YWErTmFwbzVq?=
 =?utf-8?B?THNwVEE4b01WZHl1RkFiZ2pIc0pWK09qY3BaQ3VEaEJKTGZnaUtaMWsxazJO?=
 =?utf-8?B?RGZUQmd1c3NqUzEwMzJ0SSs4MnJBVi8veU1UdG1ESU5OdHRFbCtRcWk0TjNF?=
 =?utf-8?B?SUdwVlFUQU8wVDJCeldzZW1HMUFzOGRqenV1REQ4aUZKaVdFU1JQaEQxN0VJ?=
 =?utf-8?B?cmQ5dkVNbTlRQW5XNVpIUW84WUYrbTVDV0Q4R1ZnOFlvTHR4UkR1OW8xdkgz?=
 =?utf-8?B?VzhCTmNvL0RQdGlNYldyaE95b0pkRzcrSXduM2tsV2ZFcWVnTFNic2F4aWh4?=
 =?utf-8?B?MUl3ZVdHeHFxSFBrMGRvdXZsdS90NlVWaTR2ai9lczJIY3ZnbTM0NDE0VDNu?=
 =?utf-8?B?a3N0UjJPMlNKSElSalJqN29nSWJBM2d2dFhzemJrN1NXVDRJK3pod3pHTVZm?=
 =?utf-8?B?RjQ2bTFsYlpaakoxK2x4cUZmMHJtSUd1cEJRallvK1dKaW5ieXJjSGRtQnFC?=
 =?utf-8?B?czB5bkk1cmt1TDd0bnRERVptMzlIbmFKT1A1TmszS0c2OVkrNEVCQVlnS3kr?=
 =?utf-8?B?QmFEeEVYMUJZMnpSWllNdldLNStLOTk0bnFNNDNGNVhoMTVvM3lZNEFDc0Nz?=
 =?utf-8?B?amZmQ3M5RFgxN3VxVjNTeGZwOXBWeUFIZDF5aERPV3R0UGZEMzFhTkhmUXRG?=
 =?utf-8?B?Q3lWUVhkSm5xQVlUeXFueHRZajJ5SFpjSmcwZWpLMjVJOUV2b21SWVJFd1Bw?=
 =?utf-8?B?eHEzenZvQVdTTEY3SzkwczRUalY4a0ZJL0M2N3d1Ym1BSldTQ2VDVGtBWUxG?=
 =?utf-8?B?MWVDNm5KOFhOOE1KbkxFeDBFWHF3eEswaWtwakNzR3dXcGUrZjZMRkpPcHNY?=
 =?utf-8?B?ZUxDV3hrUGtHdzBpWTU3YlpJbDhIcm56MnN1TVdDcm04Tjk4NHlqTFZ5WW54?=
 =?utf-8?B?c2pGMFk1Q3VhL1BjV0Zydz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZllNd21oY0lXQ0ZNUEVoZC9WY0dmdzNOQnhBRWR6dE9STGRpakU1elJSTEN6?=
 =?utf-8?B?M2h6NURiOW5tcVhxeXZ5RENPWno5OHFTdlJ3clBhL2tjMWhJZHp5WUlsTnJp?=
 =?utf-8?B?SDVCSHV2Vmg3UFFBZWVXNWR0ajhndjlEcFYzMWduMzU0WGNWMkhISzZPcjlF?=
 =?utf-8?B?NkFTc1VvQmF4ZE1oczNlTzhjendJOXZiOXdZV2loTUoxN1pIVTZPV3BBMlNq?=
 =?utf-8?B?S3RTalY1bnczK05pK3g5STNRVEFrYWRvTjI5QVgrUDZlaTB1OG5DeFF4TE1E?=
 =?utf-8?B?blZEWnVFOHNEYXFSaW4xVHNQRmVDS3hxSHE5UUJXMFMrb1kzYStZQW9iVFgy?=
 =?utf-8?B?a2JSb0lnWWhkOHZuQXdSVUdIUXhSY0RXK3JjRWR4VTl5eEJ6azFDd3NZWm83?=
 =?utf-8?B?ZC9LaTN5T3h3SGlsejRsbWVSSmliTzhmdUI2TGprY3h6bFkwbTBXUGRuYWdD?=
 =?utf-8?B?SEYvUGZud2ZJWTZSWEg1N09rK0VpNDdzdEkrbzh3NHBRZDhqM3ExWHBuRVFP?=
 =?utf-8?B?QU05NDc5dy9aUC9lSHpvbjlNTUxweGdLU2dQZWg0N3o0bkpQbmRnMHAvR1ZE?=
 =?utf-8?B?WDY0T2dTbklDMi95dUpzM3pmbVVPRkN1NC85QVhoZm9pRE1YZndQVnRQUXFR?=
 =?utf-8?B?Q3ZtR1VweGxBN3htQ0c0dmgyNXlIbEhMWUM5dXNUMlpwWmNFMGNacUZCVk8w?=
 =?utf-8?B?SVVKa1JLVVBuWlN1TFBoSEwwZ0lha1I5dFdWQ2pFZldoY2J0cm83bEMzZjl2?=
 =?utf-8?B?a3ErOWxUbEFWeFBQdUFrRnh0d2pSTCsvYVM5QUxaQ3piaHY1TGpPVUsyRUdN?=
 =?utf-8?B?UVgyVmNKai9kK2xFNGZUQjVwbXlQUi9VeEh3bjRyekRQQ3ZyRk9oam1ZeWZo?=
 =?utf-8?B?eENpeVJ2OEZXOWc2Uks3OWZ1WU1HVHBoaCtWcjVNNVlNYXNlWEMzVHhQVW43?=
 =?utf-8?B?WG1wcDVyNktZRzBwWUNBdWtDZnEzV0NheVNDYU5hcXZkODgweDAyZTd1eVov?=
 =?utf-8?B?dmIwSHFYTzNwOUI2UEJBS1IrbWlEL1ZNaDhYNmUybExlOFFNNGpzb0tKY2FM?=
 =?utf-8?B?R0JzV3p3Kzg1ZW5va1NYd1A3V1JtdkZNTXM1b2tEdC9FUXk4WDhGR2twZWJz?=
 =?utf-8?B?UDNIaFV1c0ZmYndncWxjU0hsaVQrU0cyWTdLUCs1ZzlOdXVlNE9VRVp1ZlU0?=
 =?utf-8?B?bWJqdmdOWUNoYlBMaWt4KzNjSXcwWDh4Q0RmUFUvNFB5YzNwRmdVWEsxQlZp?=
 =?utf-8?B?RXVwZnU0Q3RCZUhmOGx1ay9iNWNIcVRHL0kyb3dGdmphaDhCQXFFbUhlQ1o1?=
 =?utf-8?B?VTNVWGNkeHJXbXR5alJlWDJ2REk1elV1MCtyUU9xMmJRUmxNZXVva2EzcXA3?=
 =?utf-8?B?V3l2d25XcGNWNEsrZ2k2bElPU1hGWDVCSUcvRnRFV1YvajFVZm5qVXptZEV6?=
 =?utf-8?B?TGcyYzcyaXlvMFYrUXlvcG41c1ZkMCt4QVgyUS9TVkYvRkFpWEtTcGVFQmR4?=
 =?utf-8?B?SU15RFpLai9wcTVtK2IyVGxtRWhDcDZERzE2TzA3c1NpT1JZQW1EQ2RZT1Ax?=
 =?utf-8?B?SEJIM0VKVmJBYkVBUEdSd1dQVnhuek1FMFNXMHdRZjJVK3liNVZ4TzRKOGlp?=
 =?utf-8?B?MytZb2FXbnpxYXoxSEoxbnUyUURLa080ZVF0MU91SUxYbzdTbFoyNVl3dXpx?=
 =?utf-8?B?cmRaRDB5aUdUL3prTGV2ejNua3BTOWVZZ2Y4cDRXaXNqMVByQXZJWkJLMXJG?=
 =?utf-8?B?c3hBOFJWcXQvekkySjdhSDI5elZJcDNWR2NENHVpanNTNGhSNnhYNXQzcTZF?=
 =?utf-8?B?OXBIZWVmdmMvaFZYVlhDUHgycWNBbjhwMkpqSTRXUmdPL29YaGpHK1lPbUh3?=
 =?utf-8?B?UlFuNkU0ZHl3dlZaMlFNVnRyMDZsTS9iNXl0VHhIM1pKOFRNRjFPcllNcngr?=
 =?utf-8?B?WWVvb2wrSmJKWWdnamI4TStZT2NsdzJySGxmcWc1aXhMamtGR2ladkdNYWZD?=
 =?utf-8?B?aFE4cVAyMVZZYU9OanVKYUxjQmhoNzIwSjZXREhRSm5tOUJFa2hBUUhLb3NO?=
 =?utf-8?B?bmNHeVptOTFFSUltaDliTWtseEtkbUxyaWZpeGh1NXRKcmdBTmFTNkFpR0V0?=
 =?utf-8?B?NjkzUXo4eEUrMi91RGkwdHlmWVhMYkUrdlNkSFJxc0MyOU93MHV5bmdBRUZV?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce2061a-92bb-42e9-ba34-08dcd67f5201
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 18:42:30.7693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3AoRMQin/2+poPE7/zxgliLfNUXfdbE4ulq54fasyAYIL4yzavBNJuh/8Dn4vLDP4LZIXY3Y64hWD4DnZJW/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6849
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



On 13-09-2024 00:46, Himal Prasad Ghimiray wrote:
> In case of xe_force_wake_put failure caller just calls XE_WARN_ON
> and continues. Move XE_WARN_ON inside the xe_force_wake_put() and return
> void.
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c     |  3 ++-
>   drivers/gpu/drm/xe/xe_drm_client.c |  4 ++--
>   drivers/gpu/drm/xe/xe_force_wake.c | 14 ++++++++------
>   drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
>   drivers/gpu/drm/xe/xe_gt.c         | 22 +++++++++-------------
>   drivers/gpu/drm/xe/xe_gt_debugfs.c |  6 ++----
>   drivers/gpu/drm/xe/xe_gt_idle.c    |  6 +++---
>   drivers/gpu/drm/xe/xe_guc_pc.c     | 14 +++++++-------
>   drivers/gpu/drm/xe/xe_oa.c         |  4 ++--
>   drivers/gpu/drm/xe/xe_pat.c        | 30 +++++++++++++++---------------
>   drivers/gpu/drm/xe/xe_query.c      |  2 +-
>   drivers/gpu/drm/xe/xe_reg_sr.c     | 12 ++++--------
>   drivers/gpu/drm/xe/xe_vram.c       |  3 ++-
>   13 files changed, 59 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5edb1cf51ea5..cce754801e8d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -620,7 +620,8 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>   		drm_dbg(&xe->drm,
>   			"Flat CCS has been disabled in bios, May lead to performance impact");
>   
> -	return xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return 0;
>   }
>   
>   int xe_device_probe(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 01f643f6aaba..e5defce08281 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -301,12 +301,12 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>   		fw_ref = xe_force_wake_get(gt_to_fw(gt), fw);
>   		if (fw_ref != fw) {
>   			hwe = NULL;
> -			XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +			xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   			break;
>   		}
>   
>   		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   		break;
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 73d37e79da9c..01b8bfdd748f 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -11,6 +11,7 @@
>   #include "regs/xe_reg_defs.h"
>   #include "xe_gt.h"
>   #include "xe_gt_printk.h"
> +#include "xe_macros.h"
>   #include "xe_mmio.h"
>   #include "xe_sriov.h"
>   
> @@ -208,11 +209,10 @@ int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>    * and waits for acknowledgment for domain to sleep within specified timeout.
>    * Ensure this function is always called with return of xe_force_wake_get() as
>    * @domains_mask.
> - *
> - * Returns 0 in case of success or non-zero in case of timeout of ack
> + * Warns in case of timeout of ack from domain.
>    */
> -int xe_force_wake_put(struct xe_force_wake *fw,
> -		      int domains_mask)
> +void xe_force_wake_put(struct xe_force_wake *fw,
> +		       int domains_mask)
>   {
>   	struct xe_gt *gt = fw->gt;
>   	struct xe_force_wake_domain *domain;
> @@ -225,7 +225,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>   	 * in error path of individual domains.
>   	 */
>   	if (!domains_mask)
> -		return 0;
> +		return;
>   
>   	spin_lock_irqsave(&fw->lock, flags);
>   	for_each_fw_domain_masked(domain, domains_mask, fw, tmp) {
> @@ -240,5 +240,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>   	fw->awake_domains &= ~sleep;
>   	spin_unlock_irqrestore(&fw->lock, flags);
>   
> -	return ret;
> +	if (ret)
> +		XE_WARN_ON("Timedout for domain sleep acknowledgment");

This looks good to me. There is no need to propagate error if domain 
failed to sleep, warn on is enough. Additionally we should see if fw 
domain ack bit is not cleared due to PCIe read completion timeout. i.e. 
if mmio read for fw ack reg returned value 0xFFFFFFFF. This means device 
is in bad state. In this case should consider putting device in wedged 
state.

Regards,
Badal
> +
>   }
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index e17fe316dc3c..c2c729371b2a 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -17,8 +17,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>   				struct xe_force_wake *fw);
>   int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>   				   enum xe_force_wake_domains domains);
> -int xe_force_wake_put(struct xe_force_wake *fw,
> -		      int domains_mask);
> +void xe_force_wake_put(struct xe_force_wake *fw,
> +		       int domains_mask);
>   
>   static inline int
>   xe_force_wake_ref(struct xe_force_wake *fw,
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index b0126daee359..5f5760b60eac 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -446,8 +446,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   	 */
>   	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	XE_WARN_ON(err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   
>   	return 0;
>   
> @@ -533,9 +532,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
>   	if (IS_SRIOV_PF(gt_to_xe(gt)))
>   		xe_gt_sriov_pf_init_hw(gt);
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	XE_WARN_ON(err);
> -
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	return 0;
>   
>   err_force_wake:
> @@ -787,8 +784,7 @@ static int gt_reset(struct xe_gt *gt)
>   	if (err)
>   		goto err_out;
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	XE_WARN_ON(err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_pm_runtime_put(gt_to_xe(gt));
>   
>   	xe_gt_info(gt, "reset done\n");
> @@ -796,7 +792,7 @@ static int gt_reset(struct xe_gt *gt)
>   	return 0;
>   
>   err_out:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	XE_WARN_ON(xe_uc_start(&gt->uc));
>   err_fail:
>   	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> @@ -835,7 +831,7 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>   
>   	xe_uc_stop_prepare(&gt->uc);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   int xe_gt_suspend(struct xe_gt *gt)
> @@ -857,7 +853,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>   
>   	xe_gt_disable_host_l2_vram(gt);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_gt_dbg(gt, "suspended\n");
>   
>   	return 0;
> @@ -865,7 +861,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>   err_msg:
>   	err = -ETIMEDOUT;
>   err_force_wake:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
>   
>   	return err;
> @@ -914,7 +910,7 @@ int xe_gt_resume(struct xe_gt *gt)
>   
>   	xe_gt_idle_enable_pg(gt);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_gt_dbg(gt, "resumed\n");
>   
>   	return 0;
> @@ -922,7 +918,7 @@ int xe_gt_resume(struct xe_gt *gt)
>   err_msg:
>   	err = -ETIMEDOUT;
>   err_force_wake:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
>   
>   	return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 86146de1d31c..2ecf3c87c6b0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -90,7 +90,7 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>   	struct xe_device *xe = gt_to_xe(gt);
>   	struct xe_hw_engine *hwe;
>   	enum xe_hw_engine_id id;
> -	int fw_ref, err;
> +	int fw_ref;
>   
>   	xe_pm_runtime_get(xe);
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> @@ -103,10 +103,8 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>   	for_each_hw_engine(hwe, gt, id)
>   		xe_hw_engine_print(hwe, p);
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_pm_runtime_put(xe);
> -	if (err)
> -		return err;
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 9af81b07ab7a..1a7ee5681da6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -144,7 +144,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>   	}
>   
>   	xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   void xe_gt_idle_disable_pg(struct xe_gt *gt)
> @@ -161,7 +161,7 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	XE_WARN_ON(!fw_ref);
>   	xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   /**
> @@ -223,7 +223,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>   		pg_enabled = xe_mmio_read32(&gt->mmio, POWERGATE_ENABLE);
>   		pg_status = xe_mmio_read32(&gt->mmio, POWERGATE_DOMAIN_STATUS);
>   
> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	}
>   
>   	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index c7a00565216d..27ad412936f7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -423,7 +423,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
>   	 */
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	if (fw_ref != XE_FORCEWAKE_ALL) {
> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   		return -ETIMEDOUT;
>   	}
>   
> @@ -432,7 +432,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
>   	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
>   	*freq = decode_freq(*freq);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	return 0;
>   }
>   
> @@ -508,7 +508,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
>   	*freq = pc_get_min_freq(pc);
>   
>   fw:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   out:
>   	mutex_unlock(&pc->freq_lock);
>   	return ret;
> @@ -870,13 +870,13 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	if (fw_ref != XE_FORCEWAKE_ALL) {
> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   		return -ETIMEDOUT;
>   	}
>   
>   	xe_gt_idle_disable_c6(gt);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   
>   	return 0;
>   }
> @@ -968,7 +968,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	if (fw_ref != XE_FORCEWAKE_ALL) {
> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   		return -ETIMEDOUT;
>   	}
>   
> @@ -1013,7 +1013,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>   
>   out:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	return ret;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 80e5c4ef86ef..8d7d9e7ade51 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -840,7 +840,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>   
>   	xe_oa_free_oa_buffer(stream);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	xe_pm_runtime_put(stream->oa->xe);
>   
>   	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
> @@ -1463,7 +1463,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>   err_free_oa_buf:
>   	xe_oa_free_oa_buffer(stream);
>   err_fw_put:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_pm_runtime_put(stream->oa->xe);
>   	if (stream->override_gucrc)
>   		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 96d5ec1fbbd9..4372dd727e9f 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -182,7 +182,7 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
>   static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err, fw_ref;
> +	int i, fw_ref;
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	if (!fw_ref)
> @@ -198,9 +198,9 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>   			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>   	}
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   err_fw:
> -	xe_assert(xe, (fw_ref && !err));
> +	xe_assert(xe, !fw_ref);
>   }
>   
>   static const struct xe_pat_ops xelp_pat_ops = {
> @@ -211,7 +211,7 @@ static const struct xe_pat_ops xelp_pat_ops = {
>   static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err, fw_ref;
> +	int i, fw_ref;
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	if (!fw_ref)
> @@ -229,9 +229,9 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>   			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>   	}
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   err_fw:
> -	xe_assert(xe, (fw_ref && !err));
> +	xe_assert(xe, !fw_ref);
>   }
>   
>   static const struct xe_pat_ops xehp_pat_ops = {
> @@ -242,7 +242,7 @@ static const struct xe_pat_ops xehp_pat_ops = {
>   static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err, fw_ref;
> +	int i, fw_ref;
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	if (!fw_ref)
> @@ -258,9 +258,9 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>   			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
>   	}
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   err_fw:
> -	xe_assert(xe, (fw_ref && !err));
> +	xe_assert(xe, !fw_ref);
>   }
>   
>   static const struct xe_pat_ops xehpc_pat_ops = {
> @@ -271,7 +271,7 @@ static const struct xe_pat_ops xehpc_pat_ops = {
>   static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err, fw_ref;
> +	int i, fw_ref;
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	if (!fw_ref)
> @@ -292,9 +292,9 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>   			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
>   	}
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   err_fw:
> -	xe_assert(xe, (fw_ref && !err));
> +	xe_assert(xe, !fw_ref);
>   }
>   
>   /*
> @@ -330,7 +330,7 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const struct xe_pat_table_entry
>   static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	int i, err, fw_ref;
> +	int i, fw_ref;
>   	u32 pat;
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> @@ -374,9 +374,9 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>   		   REG_FIELD_GET(XE2_COH_MODE, pat),
>   		   pat);
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   err_fw:
> -	xe_assert(xe, (fw_ref && !err));
> +	xe_assert(xe, !fw_ref);
>   }
>   
>   static const struct xe_pat_ops xe2_pat_ops = {
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 7c866b736f00..df7bdf3822cc 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -153,7 +153,7 @@ query_engine_cycles(struct xe_device *xe,
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	if (fw_ref != XE_FORCEWAKE_ALL)  {
> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   		return -EIO;
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 6ab6a48b1d29..874523f22f56 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -202,14 +202,12 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>   	xa_for_each(&sr->xa, reg, entry)
>   		apply_one_mmio(gt, entry);
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	XE_WARN_ON(err);
> -
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	return;
>   
>   err_force_wake:
>   	err = -ETIMEDOUT;
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
>   }
>   
> @@ -256,14 +254,12 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>   		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
>   	}
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	XE_WARN_ON(err);
> -
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	return;
>   
>   err_force_wake:
>   	err = -ETIMEDOUT;
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 3b5256d76d9a..1384c97a75c2 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -263,7 +263,8 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>   	/* remove the tile offset so we have just the available size */
>   	*vram_size = offset - *tile_offset;
>   
> -	return xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return 0;
>   }
>   
>   static void vram_fini(void *arg)


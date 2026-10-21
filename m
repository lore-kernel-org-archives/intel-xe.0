Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5735606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 05:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TV/px+kb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D4410E08B;
	Wed, 21 Oct 2026 05:12:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244EE10E08B
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 05:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792559540; x=1824095540;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=joLpduwjaFt0sLr2P1PPyPaDnlzea6uvDMz/59S7YAM=;
 b=TV/px+kbo1KNtWGTOk+uCXm1ZQEEDiNOUnvLukmhoWRiM6R6S4Hn4pam
 N1g1Yrr4HwR+YqPAPmnDu8fv1Iwcp0ELxQacbpZ+mP+hO2G2Mp4s/RK88
 b7dizUuqgouRoIsmm/Z0j/VP0l7s8/a/qxEZckQ1E3tYdsN6Z5Jj9paUV
 m4GQzhuzI+abhqjMMT9pwWOApFwDANVqs6ueNyJrQ1ylSnoYSZd29YVCt
 IFRTiAgi9RHbGYfVrO3dfz0Q3hbWf3Mm86qrU492LyY86Z4yJIpl6mtqE
 yY6JNQO9rZkzcAxSepLxlcUuStbQroeDundH4VuS46up3HVqdIJLXR0jX w==;
X-CSE-ConnectionGUID: 3q1IOPbzQVizOqTKak5jjA==
X-CSE-MsgGUID: VzKe9CIZT6K3eWzbe1yigQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1154361"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; d="scan'208,217";a="1154361"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:12:19 -0700
X-CSE-ConnectionGUID: RzeX0KNuT8WGJM/PN4UJ/w==
X-CSE-MsgGUID: foYIGVunQHCQuw9abh4/nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; d="scan'208,217";a="2997321"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:12:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 22:12:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 22:12:03 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 22:12:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ow42brW8FMKvT42lmjxX4FZ2UNfVfejNcSVgekndkJy+jwd0hdQPHnIM7fIux+qPVz2YzhpFt3KH150KjP2Vk+0kv/weDXUEwh3sYuo4kvt0dNdv/QOM/Jo6a1FFIUyFUYQzZq+U+dvsx1kyOrkkCMiAfl89qu4VO7LC0mFfperj62oFsyR4rF05rpR4O7y28dWhaAiUFkXI9BiIxmP91hta0+yWBEbTiTHZpWZVbr22w8yg2G2tRVrqMjdFKUa1yuUnkP+dVEfPVqJQ2/XUd7kX5XYN6RaDfM/FMqGFkvlFGfnPS2qCn+6o3Ld98bV+oLZ+p/O3b5Igkex4AKvEjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnGmEC5RbylUpwZcCHM9pQBJ6tZUTG1jcMZ0B46sTmQ=;
 b=bA83Q3JFhv2iRhCmQpIUJmfVxc4bLa+JOvIT0CBs9lLi41H3Rvn0mVcPt5IpH5xAYmmJbB1rAYUib6BUqGzkhtv8RDAl/3n6BTTW40t4W+WrFAb1MyYpykzOnQoZIdqjsbnG6/qN265cBPynZH5+rGDvholm+MGR1yLBScGmep8wAwddXCFaX9DpS8WBwzKxRDZPDN5KUwzJMLFomnNypkJjNgafsu08G44AYQObFBhcDKbLuKnpEkYNsqbu4/FLfgrqBr6ZarsJKXQcEZiaZ8X5KnMblmpXr55MN+dmndj6bgIK0Q/mejdDi6i8MMKlm3U7vuP8UZ/4ZbEkojKSFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 05:11:55 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%4]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 05:11:55 +0000
Content-Type: multipart/alternative;
 boundary="------------gYa0dbEx2mykXuU10stZjqVk"
Message-ID: <83c07a17-29b7-45dd-bd51-4ae72a1fd22a@intel.com>
Date: Wed, 21 Oct 2026 10:41:48 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe3?=
 =?UTF-8?Q?=3A_Fix_OAM_stream_broken_on_Xe3+_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20261012112158.180251-1-shekhar.chauhan@intel.com>
 <179182308911.13983.4620248949818831428@221881a7231d>
Content-Language: en-US
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <179182308911.13983.4620248949818831428@221881a7231d>
X-ClientProxiedBy: MA5P287CA0101.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::15) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|CH3PR11MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 73513ed5-17b5-4c82-2f03-08df2f31d31b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|22082099003|18002099003|13003099007|8096899003|11063799006|4143699003|261009221727099003|261009223027099003|261009221227099003|261009223327099003|261009220027099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: OiQ4LJhUFhUAmUm8m70PyGiArErNuSFF49x5Z0VdDT4dbNKmVWWUuK+UZK5KCJ3VN1lQph9q2WfNnBzHy98nxHvLpJbolbAZ38l4SMdHdbbrAuIQt32u3BQzTd1VS0vA0AKj4OCCXLtKSiEP3Rb9ujTtknlVOrUfqwWtWOUuYeJoQQ6tZ0Xg6luJJncgaR6hbRg2+RVLwvRZTp83gAzbtyY1Dg+ZE7Fisodwj9BGMU8XPx38wRzL0kIERO25LnwG3yx+eqUTjA21G0cU5EpJsXlA5+jNxexYMCiAidUamQv5toqVHxpfGIHfO8PHOdYq9p5fQrGTmE+xsP2xWsFSavlkjmPrhOcxX4RCw3zQOucOmaNUO45X0Tee2t10MhRoxfE4w4gO+2FHfNV0DP9+/2sHpg04BzScxyGNJ8FaVRKI6uhTyHp11BqGOBjhR6BIVr+PHiULCcc2WvJ0Rj69oYboFvszlrdV99a6pEHnLnAbLezoqJ0Mm1U6XHnNb7lBq/p9cXhjATCh4rzaBoWEasD4MinQVx9sV3Cjd7ArctT4u+wdOohusC1NeGjIuPLOMDfN2ORRowYuKu/FIqQqHeFCgWsGxQh7kTm6QN4z6FkrHcmT96Kbaqh0OxsZSnoG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(22082099003)(18002099003)(13003099007)(8096899003)(11063799006)(4143699003)(261009221727099003)(261009223027099003)(261009221227099003)(261009223327099003)(261009220027099003)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHk3U1JoQ09uOGQzSURoTjVxSldIajBVczdacnVrbFFKOVNxQ21jSXN1MWxO?=
 =?utf-8?B?WWJBb250RnRGWEVHdGJLQUE3Vk9yL3Fld1Z2T09nWFJLLzh0dTFENnFUbnI3?=
 =?utf-8?B?bHIzbDg4VWFicGhTczQvNVVpNnU4V003ajVYTlRocE1sMXprYlJ2ejMxL3Vr?=
 =?utf-8?B?MkxpZDQ0dWtlQzhyYi9FRVBtMEJob3V2YU9DblNQbENWclNlSllydGN2bWdG?=
 =?utf-8?B?QXdnUFczbG1YR09ia09LTFFmaEc2Q3NrMHkwWklyeHRleGtUUmlubGZiZFk5?=
 =?utf-8?B?VGhWbXJ6TzNaV1hjWk02UldjYlZDTkgwT1NZYzcrUUNZTmUvZ052aWw1bGNt?=
 =?utf-8?B?cG1UK1cxd3U0RGpaRXRFaG1PRVlham1oRGxMaGJZK1lMeTNwODJuNEJoZXZK?=
 =?utf-8?B?T3FXVkdoR09XU1pqMzZwZnpxc0x0NkpBL25Ubmd4VERDaWwxcGVLZGREbnhr?=
 =?utf-8?B?NWYwT3FvSXhGNm5YVWlVSStIdExtK2tHakhMeDkxYzExaUM2SUdZZmZrUHBu?=
 =?utf-8?B?Qnc1elFrYTdwVFpkYm1PQmt2a2xtQlhxTnJWU1BybkhmYitMdVhjTWRlR0RS?=
 =?utf-8?B?TktSMzIydFZ0OTFQVmNIb2pLVElVTTdEaVhXNHZpRlRZaWwzc2RFdFNudXls?=
 =?utf-8?B?cko0aHEva2ZkMlNzbVZHNVNkdWQveDMvUFpWWHNtdis1L0RMdTlHbUJINTZo?=
 =?utf-8?B?MWNKbDJsYWtLYzZBcitScGFtYlNzUERtVU9mT25qYU5OOFVhUjVRR25lS0xZ?=
 =?utf-8?B?dCsyTSsvejhMMzJtcjVEWmFxdXhSSytubDRVdUhkWU1wclJzR0VEUSt1QzNU?=
 =?utf-8?B?M0M1Z3FoZXlZSjFIY1VSSEoxMVlqUm5KMUF0QlorNnMrZ3V1VG83cHZOVEdi?=
 =?utf-8?B?a1hXY2ZZcDN0Q1VDUXMvNFZvY25CL3poZUJSc09mUjVpRi94cVVmeGNyWmdR?=
 =?utf-8?B?QWlsdzR3S3prR0pwVHNZYnhDNkc4UStBRmozcVNZUGJKbytDaGRSaktBa3lk?=
 =?utf-8?B?Zm11REdzRkNUWExKeUJpVnd1QmxvS0ZyVmM2MWpiSUxTMnZsYUtIMGZweDdS?=
 =?utf-8?B?bTZVenNTUGRFTXZCcU9ZbktZWjFsZm9JUFZ3Q2ZQY2ljanpIbXcxK1pEYkV1?=
 =?utf-8?B?OGl6YVNyRCsvaFlEaGgrcHdJWENiQ2U4VVZjY2dvMkYyRmc1dkVwNkx5dmg1?=
 =?utf-8?B?YlYwTnh1NEhCWTF1M0pXWDZkMnVkU3QzOW9ianpBN0pBWW50QXl3b2xyck0w?=
 =?utf-8?B?MmZLYUFwajEzQnFUVmtYRk94VDR0Mm1lclBpM3F4RU1VMlp2eWtsaC84d3Vz?=
 =?utf-8?B?cXhSYm9vbGw2bkhTYTJJQ3p3MzVISm93VHNlNUFMcTNTWlVlM3FlYkMxdzg1?=
 =?utf-8?B?Z2FFeVE1Sm1Eay9sYmRkOXUxb1A0ZmZDaHVkVmR3Umdzd0w4Mk9HK0VLUC9u?=
 =?utf-8?B?RkhxQlRzaUhiSGV1NmI4NGpRT3BnMTlPZVdMQU1sK1pWTnhFemxIWUJNaUxz?=
 =?utf-8?B?Ty9PYm4xOUZQM1dYTW96bWFZMzluZk5HRnN4bnRDTTh0dkozR2hDYzZZSFBa?=
 =?utf-8?B?dTI2ZnEza2JvTlpPeG9WbEVMNUJPWEp4eENaeElsemJ5bVNyRGU4K0pFVzdq?=
 =?utf-8?B?UUQ3SWE0a1BSNk9ibVhJb2RLUUxRSTA2RW1TNThxQjlvZ0Z1RFBodDVBVUU0?=
 =?utf-8?B?UDM0SDdqTG10d1UzWWN5Q0Fwak9kMWlJdHlDNUpRbkZoMHZERzBibzZKblc0?=
 =?utf-8?B?TnFCSmdVNkZld2puVklYdlFJZ1pTSGg5MFhld2h1Nkg1NEp3akl5dDRJSVpN?=
 =?utf-8?B?aDc4STFkbHhIMmlwbGJVcmM5VnAwZlpJVlBJRzlXa0RQenBtd215VS9abDV4?=
 =?utf-8?B?OXZmV0dEcWJRb0NMK3VxZSswem82Ym5IemVuRy9jL1loUHVtQVozdi9MMGR4?=
 =?utf-8?B?MktSVWpyaXRTdVJETXlvTXl5U1l4VzRudVFlOFpDUTVBSzhwMnVCdG5tTEVq?=
 =?utf-8?B?cElKRHZIMEVDd0l0OEpTMk9ZN1J0eFc4UVpqbzE0aVJsL1FFTkNMeE1lUDZq?=
 =?utf-8?B?NmV2S29JNXJ1cW45d1ZYSG1ObG5pUlB0a2Q4bFdyOUI2YVNZbmRHbkg0ZWtQ?=
 =?utf-8?B?RU5yNklFSVNROHBKTCszOTVmdFhUWXZuZE0ydE5lNzBOcGtwTkxYQXNHamlz?=
 =?utf-8?B?dUVlTzBJT1lPK3ZnbFRucGZRTU1vSWJnR2ZISzZBbGdxb3BnQUxJOEEyK1k2?=
 =?utf-8?B?VzB3YW9XYkwyOHpMdEVZZFQ5c2RlNDlRNDRlWjFRL1ZHZi9MRlF4N1BNMVgv?=
 =?utf-8?B?akRIaHhmWXo3Z3B5Z2NSWFh5d0RJcWZMOFdXdzczL05QNi9NbFljQkprNHhu?=
 =?utf-8?Q?DfmaTjKGKKTETaX4=3D?=
X-Exchange-RoutingPolicyChecked: bPzZ+yRHyvmeOYEHze24X2LfE7LyDts/ieyRvO4Jcze1k3ekLWrbgOWD8MkSJF8vPEfgxe/htRsiVBjCWfEo3WwjMBc1cm3VttbnaNnZnOpR+K2Z0P5ENhotg+lNzPSph4pS8IJC5t1hCXmvQ16rqSfokt3xICXqPo1YLttje+yk9PGzpGxrewMN+ghlwGA6CCjRHFLpK5f9C/SFdVxUQVERp/Rsty7uWoUatqlnv39LCz9w/s5+ojuAt0T7hoVdWXKjdgw1Is8gaL4Ewi/VmWKdU5wC9rIKym0XlEyl/dlsIaj4X9IgpjnND/Ocs7IOYLET8V4N4d2LnEt1PAykuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 73513ed5-17b5-4c82-2f03-08df2f31d31b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 05:11:55.3088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOyfQc6SgvJ7dXYnfSfXhAxuWLK43adWQIWOVzLY2XC+xpiPgPn4mXH/8V1rAdwYD+GXz0KiEq3zTY3ghdO1Yghg5Z08iwJhPx1r9y/+sLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8562
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
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------gYa0dbEx2mykXuU10stZjqVk
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/12/2026 22:08, Patchwork wrote:
> == Series Details ==
>
> Series: drm/xe/xe3: Fix OAM stream broken on Xe3+ (rev2)
> URL   :https://patchwork.freedesktop.org/series/175946/
> State : warning

In regards to the below checkpatch warning, the local checkpatch doesn't 
report it:

$ ./scripts/checkpatch.pl v1-0001-drm-xe-xe3-Fix-OAM-stream-broken-on-Xe3.patch
total: 0 errors, 0 warnings, 33 lines checked
v1-0001-drm-xe-xe3-Fix-OAM-stream-broken-on-Xe3.patch has no obvious style problems and is ready for submission.

I'll still send a new revision, addressing the failure below.

-shekhar

>
> == Summary ==
>
> + KERNEL=/kernel
> + git clonehttps://gitlab.freedesktop.org/drm/maintainer-tools mt
> Cloning into 'mt'...
> warning: redirecting tohttps://gitlab.freedesktop.org/drm/maintainer-tools.git/
> + git -C mt rev-list -n1 origin/master
> 6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
> + cd /kernel
> + git config --global --add safe.directory /kernel
> + git log -n1
> commit 30e935573a92a8456ce8fea58d475beb87a6d14b
> Author: Shekhar Chauhan<shekhar.chauhan@intel.com>
> Date:   Mon Oct 12 16:51:58 2026 +0530
>
>      drm/xe/xe3: Fix OAM stream broken on Xe3+
>      
>      OAM stream: Prevent partial reports at the end of the buffer
>      when overrun mode is enabled by making the buffer size
>      a multiple of the report size.
>      
>      Signed-off-by: Shekhar Chauhan<shekhar.chauhan@intel.com>
> + /mt/dim checkpatch c7126da5b5d507ecf3f195efa75d99a7fb9cfd95 drm-intel
> 30e935573a92 drm/xe/xe3: Fix OAM stream broken on Xe3+
> -:20: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'stream' - possible side-effects?
> #20: FILE: drivers/gpu/drm/xe/xe_oa.c:1746:
> +#define oag_has_tail_address_wrap(stream) \
> +	(GRAPHICS_VER((stream)->oa->xe) >= 20 && \
> +	 (stream)->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)
>
> -:24: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'stream' - possible side-effects?
> #24: FILE: drivers/gpu/drm/xe/xe_oa.c:1750:
> +#define oam_has_tail_address_wrap(stream) \
> +	(MEDIA_VER((stream)->oa->xe) >= 30 && \
> +	 ((stream)->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM || \
> +	  (stream)->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM_SAG))
>
> total: 0 errors, 0 warnings, 2 checks, 33 lines checked

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

--------------gYa0dbEx2mykXuU10stZjqVk
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/12/2026 22:08, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:179182308911.13983.4620248949818831428@221881a7231d">
      <pre wrap="" class="moz-quote-pre">== Series Details ==

Series: drm/xe/xe3: Fix OAM stream broken on Xe3+ (rev2)
URL   : <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/175946/">https://patchwork.freedesktop.org/series/175946/</a>
State : warning</pre>
    </blockquote>
    <p>In regards to the below checkpatch warning, the local checkpatch
      doesn't report it:<br>
    </p>
    <pre>$ ./scripts/checkpatch.pl v1-0001-drm-xe-xe3-Fix-OAM-stream-broken-on-Xe3.patch
total: 0 errors, 0 warnings, 33 lines checked
v1-0001-drm-xe-xe3-Fix-OAM-stream-broken-on-Xe3.patch has no obvious style problems and is ready for submission.</pre>
    <p>I'll still send a new revision, addressing the failure below.&nbsp;</p>
    <p>-shekhar</p>
    <blockquote type="cite" cite="mid:179182308911.13983.4620248949818831428@221881a7231d">
      <pre wrap="" class="moz-quote-pre">

== Summary ==

+ KERNEL=/kernel
+ git clone <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/maintainer-tools">https://gitlab.freedesktop.org/drm/maintainer-tools</a> mt
Cloning into 'mt'...
warning: redirecting to <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/maintainer-tools.git/">https://gitlab.freedesktop.org/drm/maintainer-tools.git/</a>
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 30e935573a92a8456ce8fea58d475beb87a6d14b
Author: Shekhar Chauhan <a class="moz-txt-link-rfc2396E" href="mailto:shekhar.chauhan@intel.com">&lt;shekhar.chauhan@intel.com&gt;</a>
Date:   Mon Oct 12 16:51:58 2026 +0530

    drm/xe/xe3: Fix OAM stream broken on Xe3+
    
    OAM stream: Prevent partial reports at the end of the buffer
    when overrun mode is enabled by making the buffer size
    a multiple of the report size.
    
    Signed-off-by: Shekhar Chauhan <a class="moz-txt-link-rfc2396E" href="mailto:shekhar.chauhan@intel.com">&lt;shekhar.chauhan@intel.com&gt;</a>
+ /mt/dim checkpatch c7126da5b5d507ecf3f195efa75d99a7fb9cfd95 drm-intel
30e935573a92 drm/xe/xe3: Fix OAM stream broken on Xe3+
-:20: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'stream' - possible side-effects?
#20: FILE: drivers/gpu/drm/xe/xe_oa.c:1746:
+#define oag_has_tail_address_wrap(stream) \
+	(GRAPHICS_VER((stream)-&gt;oa-&gt;xe) &gt;= 20 &amp;&amp; \
+	 (stream)-&gt;oa_unit-&gt;type == DRM_XE_OA_UNIT_TYPE_OAG)

-:24: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'stream' - possible side-effects?
#24: FILE: drivers/gpu/drm/xe/xe_oa.c:1750:
+#define oam_has_tail_address_wrap(stream) \
+	(MEDIA_VER((stream)-&gt;oa-&gt;xe) &gt;= 30 &amp;&amp; \
+	 ((stream)-&gt;oa_unit-&gt;type == DRM_XE_OA_UNIT_TYPE_OAM || \
+	  (stream)-&gt;oa_unit-&gt;type == DRM_XE_OA_UNIT_TYPE_OAM_SAG))

total: 0 errors, 0 warnings, 2 checks, 33 lines checked
</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation</pre>
  </body>
</html>

--------------gYa0dbEx2mykXuU10stZjqVk--

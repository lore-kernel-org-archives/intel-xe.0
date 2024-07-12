Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733E0C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 04:09:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C30610E6E1;
	Fri, 12 Jul 2024 04:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R33dGOzs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2A710E6E1
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 04:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720757372; x=1752293372;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5CHTWnZKt68e7YVyClp1BV3kFsfiGuyxk2k3O+W1RIc=;
 b=R33dGOzsSVAulEXFyc75jaMw/E6QctGl4O+3WGhegunH0zTLEKtIngf6
 QYteJ6f5EZ0UtPjRpdWI1NKDnSo6Cf0Y06pY0/eg9faO65cMpQMOaHJjw
 /s5n2EQYGuDJ61/hsadQIBDCzSaAuWH7arqWMdB6HJ2TKMldB1NGvbps5
 hBSkufLag2Zo0wcEFo+2q3kTdn6r9n36qic/rM7XO43zdgRLbS6Ib1HJA
 BOQNBFzgzBXWWiSTnF0spM9wh2pxW5rjyyX4NA8m3Okn49CAugWr8BVML
 URJ/d+bTzgtZ38XRqLwOZu5VRn8RJp+8DjlbuwTfqKRte0Vo+svJo6cUr w==;
X-CSE-ConnectionGUID: zOujNrHpRfybhxOoX8QDUg==
X-CSE-MsgGUID: vQaQ4yQuRpSyzBA+h/Thxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="12512893"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="12512893"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 21:09:31 -0700
X-CSE-ConnectionGUID: Gud8ny4+QWGBWPCpTdqNSQ==
X-CSE-MsgGUID: +rwiSoX9QTWd0nUao/y0/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="86286560"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 21:09:31 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 21:09:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 21:09:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 21:09:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYk8uBYzshqnwHTVyD5EY3ssakBV6MnQJsevibOgZzhVzzPz0z/LVy/D4OzD370OkEMWveXVFWrnqDlu5WjuYBsEmZIDyTii4lIwAvQexJwgICgSnmE1g1C/rrE0/oVrxiSNLJpBhtihog0mOGoJ1xsIxrdo/yXIgM5Nb0n7tDRI8Trxi8e+JTqTfvJMSLK1feUUbBU3/lsGFc2vkF4Xud07i1yIPQOI3bx9veLFqeSR6bN+d99MmAW0KJLvV3+UYfLTWWSStNegLQ7eDnM7gittvr3S44CebJzMno+kWI/aYkjHq7KSz6/g9WfL8QGuJnMvEBXKfoCbwv7OnwUHhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/wNqLf0vRvXMHkB6au/JHlJ0LDV2MXJlCL5Mb9owiQ=;
 b=BI9tZMAnuMBT3fRby4rJfq1id3wra3KQ3aW3K2sflxbdyVG0W5ZJ5kgsEbxA8JcJ6v2h6ZWYrBXKi3UOOct1hZpwtokeDfKg6J73IY0FIhALAkOnmGP7CCJOogIhGs7K74LJgD89V7YlcorcS0PRiTuhw4Nurila4d0tUOUhW9dyEtH3G3uxuINCjRMEha5Gn4a6iVN86pjX8Lu0mK/NIvWgPi5P+T8t5ICgqbQL/Q9JYe7i7grgAArfgMR0pr8ebp9Mv9L4mx4AKiupGqybLlhiZDeIUHE92Rd549P5QLITE/fKCSi+S8SxpCkUArY/gZImPN6SaKPnf9AT+kUhCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by PH0PR11MB4982.namprd11.prod.outlook.com (2603:10b6:510:37::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Fri, 12 Jul
 2024 04:09:27 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7%5]) with mapi id 15.20.7741.033; Fri, 12 Jul 2024
 04:09:21 +0000
Message-ID: <c4d7ee5d-1a33-4aef-a1ec-533dea41a2ee@intel.com>
Date: Thu, 11 Jul 2024 21:09:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <lucas.demarchi@intel.com>
References: <cover.1720689220.git.akshata.jahagirdar@intel.com>
 <2b3532ca86b91da122154e56bd4ae95c2dafc04a.1720689220.git.akshata.jahagirdar@intel.com>
 <26effdad-d3f2-4db6-a75d-899f03639666@intel.com>
Content-Language: en-US
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <26effdad-d3f2-4db6-a75d-899f03639666@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:303:8c::6) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|PH0PR11MB4982:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c50b6d6-5691-4f14-426d-08dca22867df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWROTnFDbVFQRjFFeXJVdmhrYWpaVXNVci9qamsxUW4rd0gwc0hnUXBjS0ZL?=
 =?utf-8?B?YktJNVo2eTZuR1d5Zjg1TkZ1L296eWtZaGRsZFI4OFJxeEdIb2xFb0V4UU1q?=
 =?utf-8?B?V1FSRXp4RGZpdEhZVzllNnNSaGkzUEtIL3hzSC9Xb0pxb0xjS1JPNmliek9G?=
 =?utf-8?B?U2E3R3U4UUFtTSswdk9QdnB6V0FMSnpza1JGQVpLQlBRYUlJajJ1ckRhbXpQ?=
 =?utf-8?B?QWladDlZc2lrWm0wSFc4aDFkM2dxVUJtdmRRSkdxTlNjTXRRQVpiaFdYWHpI?=
 =?utf-8?B?T2lvY0s2YkJidlh6ZHJaMWZzZzdLWHNwL0dEakRjT2FERTRXVGJiRkllUmdq?=
 =?utf-8?B?OGRBKzNVSzdrY0lPTjRTZ1Z1MTcxRXZXa0hiWlNRZnRuK0QyelFIa3craWpr?=
 =?utf-8?B?UVRETGhmUFFDUG5GdDB2UXM2MHkwc0U2Y1ZveEgrQkFDOHRtdGlBVS9ZWXZB?=
 =?utf-8?B?N28wVlozMzZzd0RUZHpFaVQzcjZJRi8wMmRtWjIzcVBrb3NRTXFaVlhpZmw2?=
 =?utf-8?B?dEVmZVRTN1RSY09NdC9JZGhXRG9pMVJwdXVHcXFKMUZtU1NYT2kwMGFRbk84?=
 =?utf-8?B?dThjY1NPWEV3a1BuWGYwYldnbk5xU0hJVHhwK2tFaGhJV0RwZ2NLR1p4NVlj?=
 =?utf-8?B?dUY3RWRXNzllcFB5Tnh4V2E1cmgwa1Z3cUVxb0NnR2cvc1pkYmhaNDhqRnB1?=
 =?utf-8?B?VThmRFM1VVpKK0dRdUtOUjI2Q1ZGZnJjS0pXeXpFQUgwSmxQbGNPWU1TQVBv?=
 =?utf-8?B?bzdzbFV3WGNuSmdxczhVWGMxN3M0Y0JFTzJLd3BlT05iNkVUL2Y5STVNR0ll?=
 =?utf-8?B?aTJQRFl0S3J0QzZWT3lra1k5WGFJYmIyTDdFQ2FRYjRkUGhNbWtTcXVCd3dH?=
 =?utf-8?B?MEVCQnhKNzFrZWdJTmJMTmVIWFBuTGltWVFMdXhDRGQyTWhKanY2SlFXbWlY?=
 =?utf-8?B?RTB2VDl1dmp5SGpyQlI1UGpSd3VjS1psN1dvZFdIQW9oNWdSTmdiSWZtRlRJ?=
 =?utf-8?B?bDRzRmIyODY2a0Y5dlNrSDRnTURyblF3QWpTRTVCQk94OVNoZzVYQ3kxbFNB?=
 =?utf-8?B?ZEZ1N25xSzU0bVdmdUdFM296b2FSK0w1bWYvY2w2ZWg5eTNrSExOS1FwMUM0?=
 =?utf-8?B?RFBHdXQ5V3A5aVU0ZEtnT0xWQ0FORjVvbEpCOFdOTjFzK1VWZ1VkdTBwQUlF?=
 =?utf-8?B?WElLNFNhWlcrMTgzUWhRQnZsWWlMMGpXanhjcjB2RGFOd015dDdvbFpueWxl?=
 =?utf-8?B?V2hWOVhUcG83eDVkanhiWHFacE1iT1hpUSsxK0sycmhaSzFiVmRiT2NwSU5T?=
 =?utf-8?B?Z2RVdkZQMC82NEtGaXpSOUZSMm9UMDFPcnRLNkxidEtnSC9BQ3AxR1lvL2dL?=
 =?utf-8?B?dGJSSjVFbmdUOHdYcVhQVUxFQitSOVpxL2JidUpteklITzhibXV0OHBQNVg4?=
 =?utf-8?B?SEpYWHVMdGRZYURFRGhqdGIveE05azR4Qjg0YjlCVDNvZTFJTXhwdGplZ3dX?=
 =?utf-8?B?Vi9WZnFYclZLMEVkWS8vWnltVGlBbmpwZXdQTjRyVXBzTEFLVG1vczJTYkVO?=
 =?utf-8?B?YzFYNHdqWlJKenBiaG5jWmFRTTBWVHBJVXQyUFR3UDc3cEdzKzhTT1pkWTNk?=
 =?utf-8?B?QUJSbHpsdjR3Q1h2YjdRa0gyYnJMNVgvb1d6MTJ0VjVtblM5WUVYdFpWdjEw?=
 =?utf-8?B?WnI3L3diNTZYMDNSaDFvcVF5UzZyQ3ExUXBLcFNnK29HaVdUbmFKVnRKdDVM?=
 =?utf-8?B?NWUydUhjSG5tS2xuaklzQlAvcXc4VkVCMTY2L21wOXBYU1J6MUZydGJmSnBH?=
 =?utf-8?B?THl6YllpQnl6WGh2eFJsdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QktQWkIvcjJYcGN2U2IxcndkN01HOWw3elpsUGRuZWRoRDZkOUVDZ2FsdWhT?=
 =?utf-8?B?L05tejFVZVJWLytoMU5kcUxpSkRESVE1OWNhcTRXNmNIMkdmRFZiRU4zT1JV?=
 =?utf-8?B?a3FUdzhCVXFiYmVFSUZPVzFTYnZKdjdDOFpmSTc4YmtFNnVpUDRpTFBuS2Jm?=
 =?utf-8?B?WWJKSVVJaUZ2Vi9kUFk3WUFmUDVVOFQ1QytVbFFpSE5tcitUMExGSkNjRzBj?=
 =?utf-8?B?TTNmOTZqOWNHWElJV0FJWjJUbTZRSXdhVmdxOWxkdjNoZ0I4cFB6M3JmOVVX?=
 =?utf-8?B?OHJyRGNEQ3VnWXZCM0JZK3gzSThZcThjaE1uRWhUak1JYU56alRidTA0RlZ0?=
 =?utf-8?B?TC9vaXBhK01UNTd1SmJkRGJvZFZEem00SHdtRUNUd21hTEJVL093NG9iWnFs?=
 =?utf-8?B?NjFySlpqYlNnb2JNUWVuVW0zbHdUMG81dDUwZjFodDN5YWE0a0xYaUdSNWlD?=
 =?utf-8?B?OWFNd0xnK0dyM0R0Sm56UXUvYXhLNUpwUEFSQjI2anVGOGV4cWxrVm9Fb0hn?=
 =?utf-8?B?S05UTjcya0lTZWFGT0RWckNZU0ZYdU1pTElWRWhCL3lRcStKSjZOOTNIM0l0?=
 =?utf-8?B?WlkvcmlhVDdxTkR3SjAxbVdRaExzTkxQRWdITXlIcjdHZzNRS3V6WWQvbisx?=
 =?utf-8?B?b0RnKzJIbHp6MXMyTTJibDVpcDEwS3R1Q1FzVGNZdmRhc0lFNEJxejRuTnJD?=
 =?utf-8?B?WHJxUi9rR1MzcDR0Ynd4Vmc2NWJ3UEtBN3c5RVFOKzFMUzVHUXMreDBpWFJ0?=
 =?utf-8?B?LzV5ald3ZzBaOW45TUVlZWZRc1JnQ1FuL2lidDdndHlySXJaRWY5UnZyOGVD?=
 =?utf-8?B?OEpVZXB0WjNCYnN0YkwvQU5uc3RvRERJWlY2cTlJVFVDSjA1cGR3NkdCaE1U?=
 =?utf-8?B?N0NUMU1jeG9mV2VZYW5reVpwb3RGNllaRWR6MlFicy94bFc4dWRMVDVCRW5i?=
 =?utf-8?B?VndzWnl3N3dmU013UlJRcW5aYnZZM0lOakJUelFpQ3U5amc2cGlkUUNpZFNp?=
 =?utf-8?B?REIwdGlzN2pNT1RjSitQWGRBZ1ZRLzVsN1QxYUVQUnpMNUI0ZlRDYTJkb2Y1?=
 =?utf-8?B?bllmdjUwTHgxSU0vTWkyOXlVR3MrTWdqUjBUZE4wQkZkQmt1b3dXSWxpd0Za?=
 =?utf-8?B?aDd4WVQxN1YxQkwzM2ticmlZSUJBaW9TYWVCSXV2QnNvYnY2OW9iV2pPUG5s?=
 =?utf-8?B?YlBFelI5ZUlpcE1DU080b2Nrc3BoWUUxakEydGZtMGpndUtIRnZYMWJEVmlC?=
 =?utf-8?B?ejVaOWhuWTVMS1pPVjBMZWttNlc3MWVaSnc5dlhSN2VweFFPQnV2VmpSVWpR?=
 =?utf-8?B?OFlTVENpYkFyMzdjUk1qN2VSbEZYNnRnRGpEMDVWZGJIZHNRM0dwRE44UFdi?=
 =?utf-8?B?YzFqVzB0WXR2MmkxNStGNXAydTlaSkV0UWtnYXh3QUMyV3g0LzUwRVJRN0wy?=
 =?utf-8?B?NVoxa2ozWDFGNnFXSmJ6YWFrOHlNMVN4QURocWllQnloZGtLNWlISHpkdDNF?=
 =?utf-8?B?K2JvaFRNSjJ5bjA5RUhENktCYnIycnhLU2gxSmVoWjU1TlNrazZLRjh2dVhH?=
 =?utf-8?B?MUhuRHZxc0FkcW1KektWRUVxSndKVytDR0hFVDBiQ3RVZURWa2M3dzAveFVv?=
 =?utf-8?B?OEdKdS96eWpFVE8zOXZ3N2V2MlNMVERzenNOdmxGVFR2MGZ2eFhCT28vSGNj?=
 =?utf-8?B?YU1lVUpKYWZZb2U2RUV1cTFiWEVqZVdrK0E4bmNhdzZYNCszMmZsVldZMC82?=
 =?utf-8?B?VHdSMzVhbUVlRHRFRmo1Q25ZeWhPc3Vqekx1RWY0WTl1TDdIc2V0VFg2Vnlm?=
 =?utf-8?B?dVFJTnFDbUE4QStHTzh1OWk1c25ESnIxTGs2RzVtL21ndXFyVjFmMWoxOCt3?=
 =?utf-8?B?M05jZGxEWmZZcXl2QllFNkFYM3kvcWZ4cGpPUEZIYWMyMTdZTnRBeHgyMm1H?=
 =?utf-8?B?ajZkVHBJNU0vYk5uMDJpQnk0bkJvVWh1MHdzZk93bzNYbHM2elNueU43Mk5E?=
 =?utf-8?B?UHNqc3NmTUdFbVhSZEdWZVRTa1lUNUpOUnp3SG5zbkUrdURqNGZGMlNJdVBa?=
 =?utf-8?B?Y3NidElQWWdnNVFTRExMWWM1bDI4Mlo5NHYwcGZlWXRvTEh2L3J2V2NBalh1?=
 =?utf-8?B?NVRWa09nQXRQNVBJTEpDUkRhUDcwUG43OCtTMWJjRzZFZHVMNm9aV1ZCbFc0?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c50b6d6-5691-4f14-426d-08dca22867df
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 04:09:20.7726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vc5cgl3yOKKaAV2eyAmicLAvx0z2VRZf6bnFw1qRQork5J8GjwHQkTtbTxzNM7TlRySlhXx1IE0TQvfNXz+CoAYuh+hBErQ1/6pXt4PWaf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4982
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


On 7/11/2024 5:09 AM, Matthew Auld wrote:
> On 11/07/2024 10:18, Akshata Jahagirdar wrote:
>> For Xe2 dGPU, we clear the bo by modifying the VRAM using an
>> uncompressed pat index which then indirectly updates the
>> compression status as uncompressed i.e zeroed CCS.
>> So xe_migrate_clear() should be updated for BMG to not
>> emit CCS surf copy commands.
>>
>> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.h  | 5 +++++
>>   drivers/gpu/drm/xe/xe_migrate.c | 6 +++---
>>   2 files changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.h 
>> b/drivers/gpu/drm/xe/xe_device.h
>> index 0a2a3e7fd402..c3093506c28c 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -144,6 +144,11 @@ static inline bool xe_device_has_flat_ccs(struct 
>> xe_device *xe)
>>       return xe->info.has_flat_ccs;
>>   }
>>   +static inline bool xe_device_needs_ccs_emit(struct xe_device *xe)
>> +{
>> +    return xe_device_has_flat_ccs(xe) && !(GRAPHICS_VER(xe) >= 20 && 
>> IS_DGFX(xe));
>> +}
>> +
>
> This should in theory be hyper specific to the migration code 
> implementation. I think best keep in xe_migrate.c, instead of 
> exporting (if possible).
>
> With that,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
Thank you for your review.
Should I move this change in internal as well?

-Akshata
>
>>   static inline bool xe_device_has_sriov(struct xe_device *xe)
>>   {
>>       return xe->info.has_sriov;
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c 
>> b/drivers/gpu/drm/xe/xe_migrate.c
>> index fa23a7e7ec43..2fc2cf375b1e 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -420,7 +420,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile 
>> *tile)
>>           return ERR_PTR(err);
>>         if (IS_DGFX(xe)) {
>> -        if (xe_device_has_flat_ccs(xe))
>> +        if (xe_device_needs_ccs_emit(xe))
>>               /* min chunk size corresponds to 4K of CCS Metadata */
>>               m->min_chunk_size = SZ_4K * SZ_64K /
>>                   xe_device_ccs_bytes(xe, SZ_64K);
>> @@ -1034,7 +1034,7 @@ struct dma_fence *xe_migrate_clear(struct 
>> xe_migrate *m,
>>                       clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
>>                       avail_pts);
>>   -        if (xe_device_has_flat_ccs(xe))
>> +        if (xe_device_needs_ccs_emit(xe))
>>               batch_size += EMIT_COPY_CCS_DW;
>>             /* Clear commands */
>> @@ -1062,7 +1062,7 @@ struct dma_fence *xe_migrate_clear(struct 
>> xe_migrate *m,
>>           if (!clear_system_ccs)
>>               emit_clear(gt, bb, clear_L0_ofs, clear_L0, 
>> XE_PAGE_SIZE, clear_vram);
>>   -        if (xe_device_has_flat_ccs(xe)) {
>> +        if (xe_device_needs_ccs_emit(xe)) {
>>               emit_copy_ccs(gt, bb, clear_L0_ofs, true,
>>                         m->cleared_mem_ofs, false, clear_L0);
>>               flush_flags = MI_FLUSH_DW_CCS;

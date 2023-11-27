Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C210BC07D5A
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 10:00:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8995A10E216;
	Mon, 27 Nov 2023 10:00:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28B310E216
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 10:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701079221; x=1732615221;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UIa+YTCVe77tZ+TS8IiF+jVbVwaSiLR59OjhSuDjlgI=;
 b=atAUE0dyAZ1vGzq8WgjH+h0uu3zkLPrJFUYHPUsg5d00wiBrr3SRmZKI
 CwTEf0U0pNh2Tm3CtiZ3Gi0vlrStvkNWwgrwC7KfJGacYAdNwm3AdbcuQ
 C5+k41clWKQ2MTdngvKdDfBmEqDqpRgTo3cfVOOKC2Yh5DJhAoFNFKJwa
 i+7igXTMgnXMzxpgr9capPKu33uKvjxNFendA1xmTyzNQQC7FfcJJqTIH
 EtWhGnrZJlFTJe8wd6HxG9cjNh0GjrAnmG+9mp8GNkATcQfFABxwghtRO
 762emQNU7punznYp6lZowCvZu6BJQcPnmeJ88+HLGSmvGAtrcOWXVJtSx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="392422441"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; d="scan'208";a="392422441"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 02:00:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="717982235"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; d="scan'208";a="717982235"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 02:00:20 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 02:00:20 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 02:00:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 02:00:19 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 02:00:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZ9RkofbzjSi+9/95Wkh5OCv9+iHo3dDVp68hIQxNlFj8x5GOWuT78mVqqulHu9ciDliY+RwAvI0pIBC3b4KpbbSbES/Gbf+IGebiOtVB5SUhaeGqTjg5MFqHHpJyhsmcpLmfyfB6OvJEMWhg7r8AkPIP6Mc0f7J9YU4sYnjXDyNCixRbU2XPNeG/n8JXOeVNBvofm0al8AgTugb8TCd5ikON5T65PNQZ6wjN3uhBzMDE1e8ekmMlQu4uOSsu6tVPW+FM3nDs/9qnHKl45uPOH9zNQMV26ULKWaxxjqZBqsZnXW9/bTsAcm22yLYNkhDW0HWGBSIGvRXR31RK+O8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLBOxsjcgfW03EkDqKcaPpIExhwogIi4k/HLA+YrWmM=;
 b=PHxPrvSYHdsiVwoXId8mYJ002gJ5bEWN2MSBCBeYYXkOdQk6dDQfw5W0GQHcd/T4gjHFYtumgvp6V4k0LE2iPKTIadxmxZBM0scmfwyI/QcRn92xDtKBOzerreXuNkQIuupNNNCNToLfcSijXFoabqlRB+T0/nhJo1e1iasjg8E+SnxKcy2+scynu6HTRHkB5lHTJdmE9BqDf9oB67eBPxeLNjUuJKl9RWn0lM2O1GNyJqvLdyH4r1vojaPMIakvXZ9+fVZt3g01f/JtAV43OGkyIlgKMyOLnRFqeeRDzjoNB78dNGC8Yor5PTu5/Wr1exhv9bG0c3lhjZYP7BeCuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CYXPR11MB8753.namprd11.prod.outlook.com (2603:10b6:930:d5::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.28; Mon, 27 Nov 2023 10:00:17 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::67f:6c6a:220a:db2f]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::67f:6c6a:220a:db2f%5]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 10:00:17 +0000
Message-ID: <ea1d4d72-b609-4181-bb26-9e0c89ce8dcd@intel.com>
Date: Mon, 27 Nov 2023 15:30:10 +0530
User-Agent: Mozilla Thunderbird
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231124122755.91279-1-sujaritha.sundaresan@intel.com>
 <20231124122755.91279-3-sujaritha.sundaresan@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20231124122755.91279-3-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CYXPR11MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: 72ed78c5-ae0f-4429-73b4-08dbef2fa854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7SWLrhbtq9C99Qb0o+V16P4B+YEbrrOKjFwZfqgjt7Uc0fEXBqoOQ2gIL1JqaMIP/YxeVeCjQwwuzkiLNQcbvreSPv7W7ZvQg04vlbNNQuSyGdtQrrpM8IMEkhTp+ZV3Si5BjrCg4fYDw/Xn3abjZijv1R8xApUNcF48wJIO41l3lIJfPNw8WxP5mMOKvHjYcPAT5Rw4pmtk+6EeUWZWgbeDF+Fpr+YZPmCip2bfMuNl4PPTCAdt8w26M8hTPR/HcM7W3bbdlf2d8tE2gK9QPuGX60IdW55FrCD+TYE/ZE89uptPnXVMbE86sfJyi1FeQIt8Pd4LFJ+Br8z2ok/Qad+fQhsioIvUiSaLeKnxsMS4aHpVYBMmY2b+2WBFaJl3NtK5TQ44eUIrue22+NmeIXBAUpi18zzhM/G0/lcx5To9InwYd/gVE5olYMJFj8VkRFhwa29Mr50Z878FiOxHnHqvr4Gol5reu9s4mwMx75YYHF3yQLXu1IBxSko8oUYIwkVAbIK+oDNk0PXQaxmHiy+KMYL5sAeO15TXJQ8FWNAMvY1eil8KGUWElzWmErw4yGImRHP2lJp+iwcCeqazt2SqK3s58OgzRF9IUkv9JZaNu+fHkjovm3/MbIBmouqELrsZfzCICHTD3x2IytIEc+nRhIk9NFrUk3MPWhH8mrRhGg6fV3OQpjInaspWkKet
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(346002)(136003)(366004)(230173577357003)(230922051799003)(230273577357003)(451199024)(64100799003)(1800799012)(186009)(38100700002)(36756003)(82960400001)(86362001)(31696002)(41300700001)(4326008)(8936002)(8676002)(66476007)(316002)(66946007)(6512007)(6666004)(66556008)(53546011)(6506007)(478600001)(6486002)(5660300002)(2906002)(44832011)(31686004)(107886003)(26005)(83380400001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WExZSnArZ1EzWVBZRUk1VFcydElydDM5U2lhZ2drcFZZQkN0ODViVHcyL1Rk?=
 =?utf-8?B?T0h3RU1GakduUEQ3QmZ4eXVucVRIT0JzUk91WURKenYwTXU2YzhXMTZ2SjFS?=
 =?utf-8?B?bnVrU21icDR3NDZLd05EckFjM202ZStKK1d2K1U2ZkFHeGpWazRwcW41M2Jo?=
 =?utf-8?B?dnB0K0NQeGozd0N4RlVFdm5CcmE4VnhUcXNENnRNWnFKODI5YXQrR2VveFBQ?=
 =?utf-8?B?L3plY0l1UWZYaGRwdGZRUkFFODlEeXplMHV6MzY5NTVhc2d4VUN3aUE3NW03?=
 =?utf-8?B?Sit3TWJKWkh6VG1MYlRrYnpwVjlXdi9YMy8wTVJEUTZNSEdHbjg4Qlh2QUtP?=
 =?utf-8?B?SzVoVnFQNC9GOVpseEtVWjRaNnVzWTJ0TEFsQmNGQzV2Zk4wUUh2eWdSTGll?=
 =?utf-8?B?aFg1WThidTBsNWM4eFMyQzV4QVdrRmJvYWkzejMwUUlKWTZZS3l6R1U0MGRp?=
 =?utf-8?B?S3VSVzlzQ2FpUWlJRVN5c3djelRwTk0wWUdJbUIxc0NmMVR4NTVvNFJ3dkwz?=
 =?utf-8?B?MmNaZmFtWHdyS0RmVlhlYnNSUkROejFscW5PRzRsdGdxSDBUQzN0V0FZUElL?=
 =?utf-8?B?VTVEeE9KWkN1aFBQdmsxMThSeW5mOGYrdThyNFFXTGpJODJSOHB5MU0zZlZY?=
 =?utf-8?B?WS83ZEhhcGdSRi9lM3ZBTlFOSHZnRTFoU1k4R2I3NlA2cUkvVVViMktaNDJk?=
 =?utf-8?B?RUdqaUZPNW9xbFZRdG5ITERwWmpodmM0WjRMbjN2anA0VEVhbGIweFZFSmxY?=
 =?utf-8?B?Yy9qeXRsdU9QM1oyL0JVMEpOdytoU05xMS8zVjNDbkc3dUMrUUs5eGFiK3Rl?=
 =?utf-8?B?QVJBNmgwWlBBK25WaDRTbmxUcEkya1BpRlMveDZuRndTL2N5cERkSk1xV3NQ?=
 =?utf-8?B?UHp1UWlPaUh6VXBPcHlqZzlPYlc2NTl4WStOM3dkVXJTd3FFeUpIZm85OHN2?=
 =?utf-8?B?TUxlSzdkMGhlSVpQWlpaV0RiNWZwTGxodnlKSDBqZFhvK1lZSDZhT1YyTjZD?=
 =?utf-8?B?ZFk5VjBMUEg2NmNscWpWcDNSSnVGUk85ZnZscGJDQUc0SERPNjdYUWhpODR0?=
 =?utf-8?B?UE56aXd5eU82U0tGY3hFcjJGUW02S2ZtYWJHdWNIK3gwcW42WTRVTS9zakor?=
 =?utf-8?B?NFp6akhSc0xDU0RpeUF1aGg3NVNkenMvUXNEQkx5WS9KdG8xSERyT1Vpb1lu?=
 =?utf-8?B?eG1vWXpCWHdjNlFlMC9JbHNXV2NZRWtMOWorM29oemV1Yyt3YzBNZFdiSnl5?=
 =?utf-8?B?R2d5a1JZTU1kWGZXMndMNkFjaVRNRzRKejV1a0Y3WnFmOFdaWWt4elpjUGlt?=
 =?utf-8?B?SW93VGJ2NlpaSEFpMzF3MmMrUU1qUlpKbW5ISkIzRHR6VW5kd1pFK1grUWtp?=
 =?utf-8?B?UmdjTkQyb0kvQ1RHTHZMdjVRZDdISHBoSnJRZE5MYWRtTzdGbENIMTZpajdm?=
 =?utf-8?B?V3RqYU5lQXdvN3dlYUtuSERxS0h5S1VYczJidzRub3dXVUpXbnlpNEo0Y2Uy?=
 =?utf-8?B?K1Npak5CTi81T0M5WDhBYzJSaXRXbWZHZUhhV0lBSldyYzdGY3ppM0Zadndj?=
 =?utf-8?B?ZWhVK2xYdVFtT2RBdGVORWlJcW9Tbktmd3UwVXErdkFzajJyekg1SGJkWGVu?=
 =?utf-8?B?b00zbE9SZ0s5YWl1S0FyWU1kUlRYZkJ4Rm5oeUNwQWF6QWJlcytHUFgvMzNl?=
 =?utf-8?B?RkhsNzBxbkZxTG9scTQ3bmxSYjRnVkkxTTF3UmhPMkJDQjdQT3JyMmo2RUtV?=
 =?utf-8?B?dHlsZ3huaGk0UlYrSXgyZTJmRG01U0xaaDFWODJOM3VxblJzZFlYQUZMWmhI?=
 =?utf-8?B?MytzKzJOeHZmNkhvMnEyZDI2a0FIVXZLajJzQnNWZXpGR3FaVDZEZmN0SDJ2?=
 =?utf-8?B?emhBMWtlbWVqb0xlQUdBNnY4Wmd6VUVKcHg3WkUydkFZTW1Tb2RkL2poS1U3?=
 =?utf-8?B?bDF4OUlnRkNHZHJpNVp4T0JoSmJTdDBxOWhMUTNRMm9yZmttdnBQYVRTcDV0?=
 =?utf-8?B?VTRzaXZzOE8yNzQ2eGx6SWlJYVpVSmNwaWorMUxoMjNRbGFDUFAyVG9XRGc3?=
 =?utf-8?B?ZG43V291TEc5ako0MktoTFY4aUZaUkhOait4WkJEYUc0a3ZkV1R3cWw2QnJF?=
 =?utf-8?Q?EWN5vMKSqAvdyS6XNm3yswzHC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ed78c5-ae0f-4429-73b4-08dbef2fa854
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 10:00:17.0854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4PsENOjO3TAdPQ4NKXcT392Egflg8UDxTzwXcG4FU4B2QE3JYG/jID1aBULDaxmmDP6SLPc7YviAvgbSSNLq1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8753
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Add vram frequency sysfs
 attributes
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Suja

There is an error on module unload.

[ 1042.525614] ------------[ cut here ]------------
[ 1042.525622] kernfs: can not remove 'physical_vram_size_bytes', no 
directory
[ 1042.525641] WARNING: CPU: 3 PID: 2234 at fs/kernfs/dir.c:1662 
kernfs_remove_by_name_ns+0xb3/0xc0
[ 1042.525965] Call Trace:
[ 1042.525970]  <TASK>
[ 1042.525976]  ? __warn+0xa5/0x200
[ 1042.525986]  ? kernfs_remove_by_name_ns+0xb3/0xc0
[ 1042.525996]  ? report_bug+0x216/0x220
[ 1042.526011]  ? handle_bug+0x3c/0x70
[ 1042.526018]  ? exc_invalid_op+0x18/0x50
[ 1042.526025]  ? asm_exc_invalid_op+0x1a/0x20
[ 1042.526033]  ? __pfx_tile_sysfs_fini+0x10/0x10 [xe]
[ 1042.526275]  ? irq_work_claim+0x1e/0x40
[ 1042.526288]  ? kernfs_remove_by_name_ns+0xb3/0xc0
[ 1042.526298]  ? kernfs_remove_by_name_ns+0xb3/0xc0
[ 1042.526310]  tile_sysfs_fini+0x1e/0x40 [xe]
[ 1042.526515]  drm_managed_release+0x117/0x250 [drm]
[ 1042.526626]  drm_dev_release+0x49/0x60 [drm]
[ 1042.526723]  release_nodes+0x59/0x190
[ 1042.526731]  ? lockdep_hardirqs_on_prepare+0x136/0x210
[ 1042.526739]  ? _raw_spin_unlock_irqrestore+0x51/0x70
[ 1042.526752]  devres_release_all+0xf8/0x140
[ 1042.526761]  ? __pfx_devres_release_all+0x10/0x10
[ 1042.526779]  device_unbind_cleanup+0x16/0xc0
[ 1042.526788]  device_release_driver_internal+0x10d/0x160
[ 1042.526799]  unbind_store+0x98/0xa0
[ 1042.526809]  ? __pfx_sysfs_kf_write+0x10/0x10
[ 1042.526815]  kernfs_fop_write_iter+0x1bc/0x260
[ 1042.526828]  vfs_write+0x553/0x770
[ 1042.526839]  ? __pfx_vfs_write+0x10/0x10
[ 1042.526850]  ? do_sys_openat2+0x266/0x350
[ 1042.526867]  ? __fget_light+0x9e/0x100
[ 1042.526882]  ksys_write+0xc7/0x170
[ 1042.526889]  ? __pfx_ksys_write+0x10/0x10
[ 1042.526895]  ? mark_held_locks+0x24/0x90
[ 1042.526906]  ? lockdep_hardirqs_on_prepare+0x136/0x210
[ 1042.526920]  do_syscall_64+0x3c/0x90
[ 1042.526929]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8


On 11/24/2023 5:57 PM, Sujaritha Sundaresan wrote:
> Add vram frequency sysfs attributes under the below hierarchy;
> 
> /device/tile<n>/memory/freq
> 			|-vram_rp0_freq
> 			|-vram_rpn_freq
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pcode_api.h  |  8 +++
>   drivers/gpu/drm/xe/xe_tile_sysfs.c | 78 +++++++++++++++++++++++++++++-
>   2 files changed, 84 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 5935cfe30204..edde5335bdb1 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -42,6 +42,14 @@
>   #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
>   #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
>   
> +#define   XEHP_PCODE_FREQUENCY_CONFIG                  0x6e    /* xehp, pvc */
> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0             0x0
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN             0x1
> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
> +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
> +#define     PCODE_MBOX_DOMAIN_HBM                      0x2
> +
>   struct pcode_err_decode {
>   	int errno;
>   	const char *str;
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index f354c8b2bfc6..ddf5072c40eb 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -7,9 +7,14 @@
>   #include <linux/sysfs.h>
>   #include <drm/drm_managed.h>
>   
> +#include "xe_gt_types.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
>   #include "xe_tile.h"
>   #include "xe_tile_sysfs.h"
>   
> +#define GT_FREQUENCY_MULTIPLIER        50
> +
>   static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
>   {
>   	kfree(kobj);
> @@ -35,11 +40,72 @@ static DEVICE_ATTR_RO(physical_vram_size_bytes);
>   static const struct attribute *physical_memsize_attr =
>   	&dev_attr_physical_vram_size_bytes.attr;
>   
> +static ssize_t vram_rp0_freq_show(struct device *kdev, struct device_attribute *attr,
> +				  char *buf)
> +{
> +	struct kobject *kobj = &kdev->kobj;
> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
> +	struct xe_gt *gt = tile->primary_gt;
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, XEHP_PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
> +
> +	err = xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(vram_rp0_freq);
> +
> +static ssize_t vram_rpn_freq_show(struct device *kdev, struct device_attribute *attr,
> +				  char *buf)
> +{
> +	struct kobject *kobj = &kdev->kobj;
> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
> +	struct xe_gt *gt = tile->primary_gt;
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, XEHP_PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
> +
> +	err = xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(vram_rpn_freq);
> +
> +static struct attribute *vram_freq_attrs[] = {
> +	&dev_attr_vram_rp0_freq.attr,
> +	&dev_attr_vram_rpn_freq.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group freq_group_attrs = {
> +	.name = "freq",
> +	.attrs = vram_freq_attrs,
> +};
> +
>   static void tile_sysfs_fini(struct drm_device *drm, void *arg)
>   {
> -	struct xe_tile *tile = arg;
> +	struct kobject *kobj = arg;
>   
> -	kobject_put(tile->sysfs);
> +	sysfs_remove_file(kobj, physical_memsize_attr);
> +	sysfs_remove_group(kobj, &freq_group_attrs);
> +	kobject_put(kobj);
>   }
>   
>   void xe_tile_sysfs_init(struct xe_tile *tile)
> @@ -77,6 +143,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>   		drm_warn(&xe->drm,
>   			 "Sysfs creation to read addr_range per tile failed\n");
>   
> +	if (xe->info.platform == XE_PVC) {
> +	err = sysfs_create_group(kobj, &freq_group_attrs);
indentation
Also we are using two different methods of creating subdir in a single 
file. Should be uniform

Thanks
Riana
> +		if (err) {
> +			drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
> +			return;
> +		}
> +	}
> +
>   	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>   	if (err) {
>   		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",

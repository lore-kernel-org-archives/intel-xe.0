Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CD7C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 12:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D0A10E46F;
	Wed, 20 Mar 2024 12:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hdHtlEQy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4C710E46F
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 12:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710939018; x=1742475018;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=X/aIem/SIE+NtJecB+2X2KAq0PxZTwSEnU9Fbg6hw3o=;
 b=hdHtlEQyFmnxkDDXObzCH0SsVus8GeAdkSZw8x+9IJzVUpXFlk6L/Nr0
 pCS+j3M3mEgx2uucHsXpkOUWHUl+4AkIuhx8yedesjm1pQWCwR7OXez+x
 9Q+W4ehMR1e1MSgSP4tX2ONxRQaSUzDFtX30UKhUM9VRbCnNN79RjymEd
 SlfbEuJLv66yBggS33bwx6OFQ5goSeVqREAcqL7Sv+3oGJDjNtv0/C1gQ
 bDEsdmcZYV+WTF5mR82S0gK66Ur7GfadDjBGhO8astOIF4Uy02sOF9cHY
 ZlKze33ZqaYhc+5DuaS6ZFPPK7CJSGLQspZGt86NxXAZF3a0BosR1flK3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5739577"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208,217";a="5739577"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 05:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208,217";a="14044160"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 05:50:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 05:50:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 05:50:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 05:50:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGUFvjHubnaOxa2A5RUHa3HatDNmanTHx6jp20UERBeFzQQAZ8R5LXMUKW/WJ+La/rJPpTUPGgAIJGgnt/3d2Yqvs/pu2bTF8ZAcbX0vNyK/195Cw67wzL6xlepLb3Hwb4l/CDWjs05d4GK5cDjEOTFBFRWwCRISCbmdmqM7cWzfbEblQqYkc17CAd+hMMveR0Noq1+TEkIbHPpWgMceiQw+A7O1fAW5SlQk8SvdcrMAbQZDpxSD+x2o+UFzBLiekPHT2vx+Pflbi6if8O5PeXCrUkyFQIliIzQnatRnqMRtLffZS/3fbVZuEX5RM51nrIMeejaok5z0yDCJVGeLdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hRlxVaDhXfmtOgwqfQsLyAkr3qY0xQjV+n+oo3SPqc=;
 b=d56IN33C98Q+YE8kogJvEWaM88I18/ZSRbJbAq3dLnB8gzrFjUHmT7ZGDt05C1dUUgQVgKEdAvVLHkIKoyeyG3kp3Un18woUqkKs1gUFU63EBqVrjYmZa/vDgE8pFMVRIgsdk/E3EQ+W3KlryyBHvBbqu4wnRpiu6oI/Ic+Vo5F0c2VpPGnFXeyizdjdqjlYNOYxhGJIk2Q1Mqm2wjvnMGTeBv5LbX62LUWPJ4R3C6RHbfMbkQrOfVbqzooLRCVnlRsajggx2WQ59FRHXHhFE+8sjeUH+zZnrtxwPRwxtjrjhdydz56M2ctPDtgGFjU7a9nWc4J5MPXDra3dAVTj5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.11; Wed, 20 Mar 2024 12:50:07 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 12:50:07 +0000
Content-Type: multipart/alternative;
 boundary="------------3AuTBUuw8LFi2mFvhEtVAsWR"
Message-ID: <1ad16f6a-3bb9-4161-afc2-47db741b2897@intel.com>
Date: Wed, 20 Mar 2024 13:50:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/bb: assert width in
 xe_bb_create_migration_job()
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240320112730.219854-3-matthew.auld@intel.com>
 <20240320112730.219854-4-matthew.auld@intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240320112730.219854-4-matthew.auld@intel.com>
X-ClientProxiedBy: PA7P264CA0392.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:399::8) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|DM4PR11MB8132:EE_
X-MS-Office365-Filtering-Correlation-Id: 67ea868a-ef8f-454c-5eec-08dc48dc458a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j+opurQkjBz58LYaB6K1MESRb0wT+atlFv2FygJs02xicmTiL47s8mj7OORtJQeVBz4nm3yiZRUJQBDvcxLi0Jp6frerDCKZ4DMzQyJF9xtmgqjH6N4zY7rJxMXdq2YlAMdBmqk3yjZ8XxPFkUJWK4wsSEoH2O5iC0bixp57WE2XM6fivolY7+YtPjln+E5uPVVFGMWmIsmPdMgmrFt9/G97fgNHsIvDc5WO4/q3Lwx+ElpBO8KvPJTStqsehVEjgG48AjFCdQ8zt3blhg/Y1i3ORsl4Ye18GyeCEpvc3ciM+9hqXmmPXeUXiQ9VU+rOy7gZjHAQH7fqGPi/x7MfycewNXiq0MHda61W8a3S1szh9/PG23UrxEkI4UNb90ifOzQMigVHEOl9e2DH18UIv29Tatr4PJD09nlMV4qnvxfmlD0zwlxz2bjY8jngmtl380cZZTbz0Lau4NzsyhAcZR7yJWnxTElASffxT6+p9lCslG2uBhYsjp7oIKSg/Ew2ui6gOuwSoCk6zD59AE3x9xRBsuydd1Zj80psal7y9bYJwWWSJiLqEFBkdrASj4JsPWMMdYarPM3xWQ8D0qPikgwuHSwrp+4LY98iB6vAzJdTbt46lLR9+1MfbV2r/aazt1V2dpH/53yzCwxOMGu0p3NuxuA5OOV/8StI8Tr5K4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djN5Nnd3OURGV0pmcGVGNysxbWtURktNZm1vZitpTVBJS3JvV1ZCYkxDNnBD?=
 =?utf-8?B?dU9CYjl3TkNpMEpRVWlFclJ3b3BsVWpGeDhhNm1TWmlzSkF1RTVkRVFaT0xM?=
 =?utf-8?B?VkJWVCsvOVN0M2I5dWNoai9HSmxjYjdzVzZTYmIxOEwyT1dwaXRRMlc3aytv?=
 =?utf-8?B?N0Q4YTZzTUF4b3c0MTMzWm0yS3lIRWpxQUdTTkg5RzhmMVVJaCt4UGsxNWVu?=
 =?utf-8?B?S3Y3dmJvWktxK3JLNVJuQ1JHd1poVnB1SjBvekRXZTZHZEVweEgrUVltY21O?=
 =?utf-8?B?b1ZHenZPbUF6MEQ3NU9MV09PVldQNXZ1VG9KK29JMTJXR2JyR0RtVzZoQlhG?=
 =?utf-8?B?V0JiZC9OOHYzNjEzTnR2YXNRRGtPa3VGYWRUY1E1NDlYZFc0UkJXNXpqSnY5?=
 =?utf-8?B?WHp3SlVrWVVDNzRTV0swbzhtQ1l3SUtBOUJVQjNVL0tWZEw2WE9CYm1qVjNo?=
 =?utf-8?B?dnA5ZytuRFhPdHJxcU1rVUNJa2lReXlIVjJsa052RnJrS05tbUFIWU1mY1pa?=
 =?utf-8?B?b0NrdmJtcW1jSC93ZnJMak54Rm1DNGh4bFFhWWQ0eVFCMEd1K0t5UHpwSThY?=
 =?utf-8?B?aEhhZkFxYndwS2sxUGhqTVN6cnRNbVVWUDUrYTZSVHlkeXdvUDUyN3dlRjRv?=
 =?utf-8?B?WjljQ0FVVlFTZXNOWVhVYXdablRTbnRiTnJ0VTR3c0dKN0VLQnh1dndObXhD?=
 =?utf-8?B?c2lBallnSzRBNmQ3RS8vZGJxajRLWlFWK2MveDQxMkx0RlRQdUYxUGxacnpL?=
 =?utf-8?B?VExNNHgxOUROZnUrZ1JFSWtVUUcyRFhmNUdzWEpFZ3Y1eDA5WVdHbVZPMUNw?=
 =?utf-8?B?VUNqR2k0Rkx2WXpNZGtpTTRaUlNlclV0aFJkS1kwUmxTWGtjZ3hpNGlKRlRE?=
 =?utf-8?B?UTlzdVZTVGVkOGZEcGE0Y2pXSjY1ejRFbjBDdDBtV2NXemR6MUVTS0tiR1pQ?=
 =?utf-8?B?UUJjRitvU0MxRW9LSGlnVFlTY1BnemhEeWxYUkd4b2pNWDR4bVc3ZzU3MUxI?=
 =?utf-8?B?R1M2bHhRZDgxWmJtdndYU2Nxc3kzbk5oU09CTEFNYXVDenBTdGZTdEhsWFQ5?=
 =?utf-8?B?UWk3Z1VwNmFhaDZaOGlaWkRUaFlIY1RRdmJOdFJFVE9ic09vNWxMZkNFRGRs?=
 =?utf-8?B?VXQzbU9hcy9ZN1A4THNIK2FmeUMyNEY5OFBrS3JUTFNTVTBza0hHcGVNcm8r?=
 =?utf-8?B?eVd5Vi9qa29hUW5jNllKb3FTYVJxaXM2U1BkOUxNZjV0VnVua0tURjV6R2w0?=
 =?utf-8?B?eHBoTkU3YnQvL2RUdlpqUjVVbUZaQ2xibUJBODhRd0JPOGJmVm9KVUt1aVor?=
 =?utf-8?B?ZEZpUW9XODNXcm42Ny9mdWFrMjMxQUhwaDdDR3diQ3pCeGVvSEtJU0Nyc1NR?=
 =?utf-8?B?UThsR2ZNYzVEOElSYTFNR2pTc1JiL29vaDZSR1FZUlVJRGl3Y1pJRERJYjJ5?=
 =?utf-8?B?dm0vNDZNYnBCdWVtVmRCNXBwOGd5Umw0ZXdITU9LY3M1MG40amtVb0Mrdi83?=
 =?utf-8?B?eGlSUTkvYm5LeisrTWI3Tjh5QnhmY1Rsayt6bUZRRndqd1pKMVhXZWR6dmZE?=
 =?utf-8?B?MnIxM1gvUm0xeS9tQlIrTVNzV1JDUzMwbFYvT1hWdXdjYzR5R21pYXByR3NH?=
 =?utf-8?B?NUQ0SXE0VG1LdHN2ZnpDRWtuQ0JHUnNXWW1Rek9QZFFZTU01MU9YajJJcTBD?=
 =?utf-8?B?S0lteXpKU2FsWCtJQnBLcTlVeHlwRE12NW45MkQ0YWd0UW5vSks5d2lyUFZ4?=
 =?utf-8?B?MWw4WWg0TEQrT3lrSk5jRGU0UEZCWThsOERwUUk3R1JtNFJhblgwdmVSUEhH?=
 =?utf-8?B?SWZtVFh4KzZwL3dYT2E5dGN6bUdpSkRad2djWGY3VGgyaW1neU90eStmSTNp?=
 =?utf-8?B?RTFDZG5GVnBMWXBRQmQvRlFvajV2UlFqNDRqVnlXUVpVYU9BSEtrWlYxbkZC?=
 =?utf-8?B?enBmZFFNRTAxVk01M3N2R05oWjBjK1dKZkpZTklCRFdvcXFVcE5WNlJrQmpY?=
 =?utf-8?B?RTF0cU41eXR5VlVxY3ZyOXp1cFg2WmV6QVlPUVFCY1EzV1Y4OENZWWQ1NGZh?=
 =?utf-8?B?YkZOYWgxRlMxaGFwMEs2VEZqaXdtcWFFazB6ZVNtQXp0Y2FkL3hWUUlXWmY2?=
 =?utf-8?Q?kpkeTH7R9ey/mtKVPBeLZWk77?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ea868a-ef8f-454c-5eec-08dc48dc458a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 12:50:07.7405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +A+3XwN1O2bRfjBWn8JUi5tHcChPH4yq+nMYscKxcr9fkpnbDYAExybLNv/yvoQB9oXXF1NL7sVRIUkvDlFatQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8132
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

--------------3AuTBUuw8LFi2mFvhEtVAsWR
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 3/20/2024 12:27 PM, Matthew Auld wrote:
> The q->width should always be exactly one here for migration queue/vm.
> The width will anyway be overridden later since we need to emit two
> jumps for special migration jobs. Enforce that here to ensure caller is
> not doing something strange. While here also convert to the helper to
> determine if the queue is migration based.
>
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Nirmoy Das<nirmoy.das@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bb.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index a35e0781b7b9..541361caff3b 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -86,7 +86,8 @@ struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
>   	};
>   
>   	xe_gt_assert(q->gt, second_idx <= bb->len);
> -	xe_gt_assert(q->gt, q->vm->flags & XE_VM_FLAG_MIGRATION);
> +	xe_gt_assert(q->gt, xe_sched_job_is_migration(q));
> +	xe_gt_assert(q->gt, q->width == 1);
>   
>   	return __xe_bb_create_job(q, bb, addr);
>   }
--------------3AuTBUuw8LFi2mFvhEtVAsWR
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/20/2024 12:27 PM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240320112730.219854-4-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">The q-&gt;width should always be exactly one here for migration queue/vm.
The width will anyway be overridden later since we need to emit two
jumps for special migration jobs. Enforce that here to ensure caller is
not doing something strange. While here also convert to the helper to
determine if the queue is migration based.

Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></pre>
    </blockquote>
    Reviewed-by: <span style="white-space: pre-wrap"> Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></span>
    <blockquote type="cite" cite="mid:20240320112730.219854-4-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/xe/xe_bb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index a35e0781b7b9..541361caff3b 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -86,7 +86,8 @@ struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
 	};
 
 	xe_gt_assert(q-&gt;gt, second_idx &lt;= bb-&gt;len);
-	xe_gt_assert(q-&gt;gt, q-&gt;vm-&gt;flags &amp; XE_VM_FLAG_MIGRATION);
+	xe_gt_assert(q-&gt;gt, xe_sched_job_is_migration(q));
+	xe_gt_assert(q-&gt;gt, q-&gt;width == 1);
 
 	return __xe_bb_create_job(q, bb, addr);
 }
</pre>
    </blockquote>
  </body>
</html>

--------------3AuTBUuw8LFi2mFvhEtVAsWR--

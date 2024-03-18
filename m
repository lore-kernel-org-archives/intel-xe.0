Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C06C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 14:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BFA10ECED;
	Mon, 18 Mar 2024 14:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OTDCGwmQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2C110E7BA
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 14:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710771810; x=1742307810;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HysTpx+w9e2cjqyzhlh6V8d/7Zn/TJQK/2g/D67wp3Y=;
 b=OTDCGwmQgo7Ddy28tIF989KL0qYtGU9Uf0Rh1Gv0HRf8OjaQfzPcaDzd
 BBJXSIPgFG+LlSVbdxfl1A5Gh3eWgy5x9n3BGUnwafKCu9hmCZPgJLxoA
 2pSaOzcPyRzPR4JvRgJiAsJ5oF9ccWQNOziWfPl4SgKtsqXbmyMl1GYat
 qvUvL3CMocR8UNFlqIYqQ37qpRyQ1tsKGQ2i7TvckgqJ21IjGWUXAncDm
 Rpk9iw+3uCSYbyfAA1U6pQvLcrSKbtJyTFjJken8gStVwTBwsG0NaS7aE
 CeviTx7eAWtNmpl438FGUM5CWV8dmEKiawfqwMtj/u7QvA+m/GkZe2hpD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="9412419"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="9412419"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 07:23:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18058160"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 07:23:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 07:23:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 07:23:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 07:23:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSj/hmDtRyycuBOgDtP6ZjkMqXHBMMpqzezalpasXANW/wDfj9oEC5kuZ8S+5/vj1aZbJo+cexnyaPTiI1epYm1I4r1FGysTeWp5bqS9SIT8xynqODi6BtejxhauypppBlZzsXf6mMNCRV3jFZMZiX3y4y6ua163kOmIn+h0/MmSEw4gm99ahkOmJdg+vUxarN5KNp2WLm5O4ytPzN8r3D17vMPn91folhTooZpsTcyIdtdDYiJthQ9zbeo1e4+W/jFe89kxt1wUzEr6o04lKsTgPZD7z3HYH20rWxR/27qwKEQSVjRH0hXuzSu8CyJ+XdOkwb90hFFr4bbVqHfw5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zj5IXp9J9EzcD9XuAhL8cx5RpUvTYl8WsqpXc2hh9Uw=;
 b=aBIpokTRfUsKHstWidnODBzSIsAH+MFiBE6ztneilWr25alyqzG6gPBVdrTkBH59Xeq2/3gzBHx2/oRUsBvSBRl1hUtaivhxqwCYY8xqNX2Qw+klFn+eihA2qZa+CA+sVFMkgbSz93PtFMq1duWwunQbQZ0WJYYIxYk+/kJOIkyXCPvKglFUB8amOFa7CUfzIpQOtn/l452/6uLH8peVV1fbAmx2KiWfANIF53G8i84J5D8mwksNzWBVMCdKoI1aDlPO1YLPaWQolont6ImYKcuVif3sIpa7UpIl4BkBJLard3VISAPhTboAZAmy7q7PVJSxnMz6hDlYCyc0saZybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7440.namprd11.prod.outlook.com (2603:10b6:806:340::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 14:23:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 14:23:25 +0000
Date: Mon, 18 Mar 2024 14:21:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Add a WARN_ON for NULL job in
 xe_sync_entry_signal
Message-ID: <ZfhN8C+KN+Idi4nz@DUT025-TGLU.fm.intel.com>
References: <20240318135000.13032-1-nirmoy.das@intel.com>
 <20240318135000.13032-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240318135000.13032-2-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: dc5d1a6e-bb72-4901-976f-08dc4756f908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2xu/bil5ulYV0Fm5FoS0htclED7fwMj43oxbB4Jqrf89O99SvLDY8m8sTfMMnYqcI1Nl6801WXjekbF33WxfzMlHDoiv83m/Qv1gE3uDgDOGWwbOAJCutAmLOjNd5sGbiMekPTuYR5haTR96zxY7Te+T0JhtfZKCRdLwR1wszw8DuANylCsTNBOEx/vy4rtm9wekWlXHREdITwG+u7/gcobKU4n8gZqE+Igg5uKb71IIWhDim6EI0idNS0UriuTuyanJncv8DBATtx33UUQMBf9+OmljhlLBQl5QvCywySxlJkIjh/5M+8Jsdfr25UQ3x7aiKCLn4CnyHRiL2WODklQFXLLlinDzw9hmBh+OX5F607SQF/C1fL0S/7sDtkR1YI0gbc90/+FFPE45LlatBJiR+8TChItiWoPDfczWuPINM9R84eXe9u1UK4tuWz5ArcquGJZ1UWmgCPDhQ++sXrkIQBoRIklMZzkqGgiokINiZJ7LItueOMHBhvkig60aOc5+6b+mRnUMAKQIITl3iw5NTcEC/jWZAZCZ3I6j0/zagDxJONwPMeEMjyGJQwXTHyRoLfU4+3Hy13vxDtIFgRIlO1akK6bvy8fPicrjCKaCoG4+eJot1EX3V6U7VEqmuo7XqdB0n0l/yHQhjpyX3lqy7U6BS3xtzwI/mhUp1D8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wwKas6tSDwSZD9BlHI//kVj/XPemSPjqWgFLZn4EPWMZeXIT16xl5YAbzwwp?=
 =?us-ascii?Q?b2Cewkqkb3T9biubqXGvVXbMg/m/NEh1SO24rL8DM//xh1JpAjcEPmMiBXKQ?=
 =?us-ascii?Q?VXvkhK2JKqR3I+YCPfsbH4fEexoyX3jBm4RV/l2juwilkQ0G0K0mLGDB+bJo?=
 =?us-ascii?Q?8LdZhaU595choelUIUjrCsAk7ccxJAePnHCZXCoeGj6Q0ewN+oKb0Uk17KDK?=
 =?us-ascii?Q?j6uIQvdUEGffgF5eQ/N/FUoT/xc2QmC6pSBjAeShM4S9CwxtGDUXjRWj5d27?=
 =?us-ascii?Q?Mg7Zq3VlH1uCHltwo4B5impf/f5kk3Fzm8P7/f7luYIs8lYE0MZ62k3H/Y9W?=
 =?us-ascii?Q?3WIwvuWApFLx7hzCnn5QZ+sM3BRgObGDjZdxgxvcl0nLtvepq+pbneP30llB?=
 =?us-ascii?Q?eSz4TT2VuJDZ7icGR21j/7d8Mg0G+e4J6mlO62OotFrcNyvgGd/M9CCyXCVI?=
 =?us-ascii?Q?2SMtsvKhDGIZvyFjhm9gYLnEyASh+I1uXfLZUkeH291XDQBaId6xdc88Nxyw?=
 =?us-ascii?Q?6BypQ/3sG7fs/I4CFSMuZebwNg1WeMImyaHt6qjnSgQrsZNUtg7Z1ccA/q1c?=
 =?us-ascii?Q?0ah3vbC1S4kFHeVtGSKLTk6uKMTCtz0FjMZ6ktScLzOhtXcXhMB+MEiBDLe3?=
 =?us-ascii?Q?uM73PNs14II0cxi8aP0cjRvi5ND4fg43ldZKGN8lLgQmdeNfWQrbjnBUEIrF?=
 =?us-ascii?Q?LXGQDWPc+8IV50+g9B/kq5F1Ac4ENFqlAbuE+GPojsFEA9qjt/aD/PA7HJm+?=
 =?us-ascii?Q?eiQiyrzvH9LNdapH1gMJtF9X4w56gT4sPnNJrCkdeOgbgQhNF69/urW9WBW+?=
 =?us-ascii?Q?bzoiJm22P8SuSRk5MAGNTrdX0zg/7JjoTWN3NjDpzf7seZOBnMidMWpV9VFx?=
 =?us-ascii?Q?j+w3KYKUZtNVzcTTaNWJorYMg5lvqRukF4YWqsBseT9qP3w6m9UVED+HwfKc?=
 =?us-ascii?Q?W323ShzrMsCQmo7l6SZGv3tT1DK21wKn1FvfhUtMLN/gaQTUrknYHNg/UPoL?=
 =?us-ascii?Q?r3BSMg7kLWo0Df91gewvswO6ff3naEhhWSUbY5JGD4VpnWBs0SAfSA62slFp?=
 =?us-ascii?Q?YieY0pHkNjiObSgzkZMfmUc2i8rwdPuikq9QYwJEe7LlYlnWgWtCuSuOVeLx?=
 =?us-ascii?Q?LpECLQV3RMWFBEPSbSOnF8M8xQnV2MgAAFV/7FYYO594q0VEcL+4ltvmKMI7?=
 =?us-ascii?Q?3z0U1jTgSint/f4ulnwc2uF/j13EfkYsvAkcpVs45LhGI3ULxx7ohX+SLT8C?=
 =?us-ascii?Q?9/UnbVLcLuLObzFpxMeQf1Yr6e6MizvoTTK/vs2SG6DbPBTabTO+kso/ZnUR?=
 =?us-ascii?Q?ZM1F4b9Vm3TFNslQk1kYqjMMjJgJrhDlQRT/OxltmO8ZFKD7Oe6WFEbQE7R/?=
 =?us-ascii?Q?EdQx9HAlT16FPVoKa2XenKXFUW4eCJUK8ZgzVFy/nTiQrSQJFPnetJORJZau?=
 =?us-ascii?Q?wTlOQswR5WgjKt4GLZ0nY+JEkVntuIHDkWU0G+04JvJ1TJc5Dl1Q2uZ85q5j?=
 =?us-ascii?Q?vRVIDJM78SnNZRfgan9OU8jHEQHMOTCCzqYBE/ReF665pE1BfRCUUzYUPc6+?=
 =?us-ascii?Q?6dA2ijhGi//57z8HRLlJxGCTX2XfTLBYY5cRxD5HIz/mIApQrK0gJIHG+gIX?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5d1a6e-bb72-4901-976f-08dc4756f908
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 14:23:25.2557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbMyzl2uCPSTtSxyYmLb2MfDW4Nkw0PFbK2scrEHr/fAdocyy4GAR76XRKarrnGNQgBWJBHXlJrwhAMUsWubtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7440
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

On Mon, Mar 18, 2024 at 02:50:00PM +0100, Nirmoy Das wrote:
> Add a warn for NULL job when sync->type is
> DRM_XE_SYNC_TYPE_USER_FENCE. This should be a programming
> error and should never happen so warn and let the kernel crash
> if that ever happens.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 02c9577fe418..2b45950aa0af 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -255,6 +255,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
>  			dma_fence_put(fence);
>  		}
>  	} else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
> +		XE_WARN_ON(job);

For a warn on you this inverted - a WARN_ON(true) will pop.

But I think we should actually use an xe_assert here which has this
opposite behavior - pops on xe_assert(xe, false).

So the I think it should be:

xe_assert(xe, job);

Matt

>  		job->user_fence.used = true;
>  		job->user_fence.addr = sync->addr;
>  		job->user_fence.value = sync->timeline_value;
> -- 
> 2.42.0
> 

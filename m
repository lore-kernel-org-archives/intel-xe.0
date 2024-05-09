Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612CAC10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 19:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DFE10F186;
	Thu,  9 May 2024 19:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cr8XE53W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F9710F186
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 19:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715282955; x=1746818955;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xHX5w6DThYWG0XgP3cu3y7mHOjf1RPU6diYu1w1jmGU=;
 b=Cr8XE53Wq7Ss9frTZ0WguR4OQVelpa6qzyGseOIOzxE5/hi+4VodHQM5
 Rbn814BR9go0wUVrs9B/CsDUU6aXpnPq1BUiHOKjMXOy6o1xYLbF8OPwY
 e4lgzHRNkE8t/DEkO05XFR2fLH0/xX4KUwfW/pmAOEWYXUoiszZaUaXO4
 dRFCKV8Gk42/SdWsU39ej8pl8OV0vQzMD7raVRZDtp9ZJIzqL190Dqqeh
 lMAWId0Wnz1gGt1dYccUGT/tjrFQp8ll9q83XesZ8aKMUlrlL1la/a4UH
 iq6vBhTtcmicuUXubJOpFugmlVyxE5u9gAyHt4eJAJ4nqJa9Ouk5mO9pK g==;
X-CSE-ConnectionGUID: GpDGJpc4RrCda3YWoRK4jQ==
X-CSE-MsgGUID: Vh6cFb5TTRSguVZjHYVFWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22628472"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="22628472"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:29:15 -0700
X-CSE-ConnectionGUID: 8/y0nXmIT8S40NIfzCb0mQ==
X-CSE-MsgGUID: fQTC7MTGQzmAqja4abnJ4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="66795410"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 12:29:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:29:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 12:29:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 12:29:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zi9pC7qQKqgL7d+YN4y9HN30YJp8ZeT7TyKXXBP4hCmMlHAhUZU6o4CsP8CJb1+HbENn0Gx44RKDIzej7q4O4wUW7j8Xkss1NsA8LrykEF1ddUW82CHeb+Qg40TUYKNlLfrl2Oz/v/4o7E1MO+CS0/XUEpZCbVhfZ7R2DkbzEa89x7HPct67WDZHNy2gpFpj2Z+rAeObQzeSBM2RL43f0Uqob3aBC52vwdk9aN8OxvIoCfyvZOGT6gsbJPUKpvigoPognJkqAzklm6rpKK2+mkJ971r+Sb/ycBEpFZYuW3z1oISql9OdMJ4A0nmDV6PJvRPcL9ZC8POOmcsgL5EwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLnROcqNbtcc+WbNR9VKEXoNwbUYiy9GOD/BVIJTAmE=;
 b=Ii00r+pou/OzDC/YutVfDnRg+KzVBpw9tu3uMh3ijSuhRvUklAiM/6EvJW6dp/7rDjX8hQQrv1tasM2O3R4gfiM2MHYdj0NBCg0X5PkmcogvrVz9zpuO8rW7vmotFn95vsBFtj+LuMwgbY4/KTvA+dAfLIMKjUrU00dJ6KpAW+aJ3iEnfR9eQniC6xRawm5/jkv/GLutlja3ASDy5lsRL0ObljCfQp3hXpGrZ1G17EB7s7knByAoBk93kzKvxUz3eopekjuqOcTyBKHfxfBgUByxU/6zZfGxctibwOD9ry84/8gf1FvfYsWW9gmZbIanWum7OY4XPwhmx2DN8jIgYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Thu, 9 May
 2024 19:29:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 19:29:11 +0000
Date: Thu, 9 May 2024 19:28:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH 4/7] drm/xe: Relax runtime pm protection around VM
Message-ID: <Zj0j8I6FrUv69Jtr@DUT025-TGLU.fm.intel.com>
References: <20240509191657.504300-1-rodrigo.vivi@intel.com>
 <20240509191657.504300-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509191657.504300-4-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR02CA0064.namprd02.prod.outlook.com
 (2603:10b6:a03:54::41) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: df837a6c-d3cb-4275-ce67-08dc705e4d8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FnAJXL9n/fzv4GdAIyXUzr0LOMdc9qRcQKhtjyFJTtntbeulcVaI9/m03L?=
 =?iso-8859-1?Q?cH1WtX9JVz9Dk+A1zhdcNxgR41H9L5HjirQ7chm3beP6LI/VvQOEuakiKQ?=
 =?iso-8859-1?Q?o86Poqr8RPErqTwOxnDKTDVPvMwbAxx0+wAcPH9znv+MmSjV3LXVdqn0rr?=
 =?iso-8859-1?Q?5bNmYOJpcEld077ytbuMH4vGgs03G+qybQQNh6kgjZBCYv06JWNSUCHGTa?=
 =?iso-8859-1?Q?N0s1hREZiYE0WFam5XCI+Mi3AlAaJnOHwJG0/TnrSERu+NaQWKborZz4xG?=
 =?iso-8859-1?Q?//NLt4j1s5w2KVdiH1A0+lHgwINB+6vnDVjGyIicj5d9bcizwiDo+32geF?=
 =?iso-8859-1?Q?kmDoWA2tdHTI48pqi7Xix+5ltWPg5/H3vzZHYryS7a95xypPHQm43GuWds?=
 =?iso-8859-1?Q?PcnTtFw44/X7nh4bfX0BZB2KA5hhLQtnxuAKnadVpxLo1vDDnxl0/Ie9tt?=
 =?iso-8859-1?Q?qNNY276zPT+MTT73ZSfoNAfvL/mtwUmMNtuX8YbmKBC2C6F3SaAl0WdVe6?=
 =?iso-8859-1?Q?GyFtBPMUcq2GqnSiVh4aKiM6hv/RlnQEfhImkj7soDxwEo08nw/x7fotWQ?=
 =?iso-8859-1?Q?PSK3IaaFPrnUCC8YsyuEsliVRPbuIZn6hbG2G0conGeYEkI82w6YRQgCtQ?=
 =?iso-8859-1?Q?T/bkEcg8K/IASEf93WTO0+//Lo3LtcWmndml7rNwlChY3Q4sv2KCWfqNPN?=
 =?iso-8859-1?Q?PSpOiV+1EZa3eZAAg7wmZNSvJHrjc7Ea9tEQlul8QPOWsSyyQQDsywxfJq?=
 =?iso-8859-1?Q?mialQwichOq3FhY12hXS4gH89w1fdKPFvESOhqzK/uLq5iRlIEJ9mwVNDH?=
 =?iso-8859-1?Q?OMVj3mVBNRjW1xA+MAjUkbW8s012WfX1Ddk+mbD8JHAh3Hky+oUOLXVkCX?=
 =?iso-8859-1?Q?XnymX9LMQXZnuc9etidSYQr7dsf8ZflDwAbVm8qgVjR0GNfUKcH5KTcdtq?=
 =?iso-8859-1?Q?GQmGxUwKivDY1n50XhpmyV/jxtBtlwtXLgmGHAtv5les/Egi6t6I5mv/4a?=
 =?iso-8859-1?Q?pTPZ4qJnmLhQCIQqLFCzQ5TKd5GMquQpPMw2ozZ9cd1CDfGHWjh4fhvAGw?=
 =?iso-8859-1?Q?2pDuXLD/hX8lH5/nIXx0rAIYopyEMuuuMXD2rMBaAPw4Rw6qxlnB6fXQnE?=
 =?iso-8859-1?Q?2eiH2Yu/xOOBOtLVONF6ZwKoZfM1Juy9/Pg09qiDAYAUuFDzvoDUv3Lq95?=
 =?iso-8859-1?Q?3/kFFONTR1Qxad0vYRyAQCeEJiJQFrC5J+AR/GUvwG5fDJdGrjoefyPDNG?=
 =?iso-8859-1?Q?kb0l37YM2J3EP3CDQUdNx1sOMabyzzKZg3mGF2sFrJYrrK+zVHS9v/MhBM?=
 =?iso-8859-1?Q?DhQsA2ncfeC22dd/mSYNwJ+2Pg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ICsDu7iDXq38X0CZZU9M/TNGSXRP8kUgp8Ghz94pPpou5qIySJYYVkoKGJ?=
 =?iso-8859-1?Q?QKUBOVoPGZXV0l+qJ4tops4z7Mr2ikBOVTQVCkCiLy3DimO6O8tvYQpvOS?=
 =?iso-8859-1?Q?1exEpoFOVqS4nz2bvZm628OUXTIlC4ZjszcG1NtSlZrdekm/V6RLkZHHwd?=
 =?iso-8859-1?Q?6ReslDPANsxZwsivTvuVMsiiVJM8V4QFFfk6d9x3BIcd/3vEySZayayoIP?=
 =?iso-8859-1?Q?mM6D/ERwv5aSQjE1bGOAWRoSgdiKqte5dZxtPRGx6ZVaeGWD0jfRtDH5E5?=
 =?iso-8859-1?Q?CvDW3U6IDtuTUa1VHXkaKwVglWW+0b4F/boBzm4Vz6our+FIzCXQmJz+oY?=
 =?iso-8859-1?Q?dL466Omv2Eg6v7cuN7NAMCbmSt78tNqCOMCCLcxCCNrG90S6l9ar9GMM1V?=
 =?iso-8859-1?Q?Sxt8DmgPHA0vvBVt+XXW3aLHakAiG7qGKj3qB/RPteyK/iqWFONBR86Xxf?=
 =?iso-8859-1?Q?9ufMxNagil6fHaJ6zgZCZ9pph04HKyZVOTZRg+rndeaE6pINZwhwwn5zBB?=
 =?iso-8859-1?Q?4yp+xngPyvaVxUQDPHFAvG7w3EVdpv19e8PTJiWiFPd5w1Ab3DjyFq8q7y?=
 =?iso-8859-1?Q?YPor9IVjgfYpqd/lJ7PLxqUTGtFlvoThkX9B3i+F/S81BWpWYjH/KOcXyC?=
 =?iso-8859-1?Q?2XkpNJBm92Md09GRQnNecdhEBiapzMy5IEVAo9yXb9FvOfGo60+0vFf0RW?=
 =?iso-8859-1?Q?AjwSic1tI/kytDJwHEXD5QhlSkQOcWlI4oll634MUuoJ+b7TO35fg5u31N?=
 =?iso-8859-1?Q?i0IZmhDs0BC8hdkORa6Dvad9pMLQwixqtOJeSPr7OqsOVZKbfLixdzD+qO?=
 =?iso-8859-1?Q?NLB2H7Zlz5hBA7JduI4p8wbtt8n726zrC/c4nZXegqPFFOqWzh94OhUzSn?=
 =?iso-8859-1?Q?CYai/e5rSwtQPNjy2Fz6NhMaJ+P2mF6TfxbN9H/G2SH8TqCFsNlZZfotMq?=
 =?iso-8859-1?Q?22NXkVfgVwYAF5jIhX402kmFRBZQ5gNUNjOJ2FljxNTzkhw2qm29O+XPBE?=
 =?iso-8859-1?Q?KR4HwkAuq63WgdW/5Z7RZ9OUz/3s3CJw89qSO8OIXlqiV78a412PTesEku?=
 =?iso-8859-1?Q?P0kyVoehOxzOo4BizQ3ebWemkdkoWNFHmgqTLOzMw7Ir1gzGoXxgXd+Oin?=
 =?iso-8859-1?Q?hD0syCZ1glOQNsrEaO1KW4g+W1mAt5vqpKGn5t1NjMee+ZcHEYWLJKQHOF?=
 =?iso-8859-1?Q?s2Pj8p+5fELXmoKD3xuwTpxP8cp2OCb9ROWaEYQqp/ZLaNCzaHsDyssnxe?=
 =?iso-8859-1?Q?kmZiRSwic3UMhxE7RSULzGDrum7cI+13qTy8OPnKwhJSgnB5HXLXTXqzl8?=
 =?iso-8859-1?Q?gbQlEzPq+JMNk4UH/EEDUPt1t0jNFhaFbExS7fPpB3CehSEDDYLSxsByRO?=
 =?iso-8859-1?Q?U4n9QtPu5WYrEtBis9/jKZIpox+92y9WyrOUcpD6ZFNLQweQmeAqxPf5w6?=
 =?iso-8859-1?Q?4I289vvDJUs2cgzoM9cpqZ07bQodfyVJG0IX7S7qZfX1WldutKdwoiWddE?=
 =?iso-8859-1?Q?Ot1FT6kNy9CGcomXbvGSumn//8c48ohAHkxg2F0NVlqfUhK442wFvY9CVV?=
 =?iso-8859-1?Q?oIMtlM4ob+TLjMhec6o9hPBnmTyYW1Eq5/x7DF2WgRdP481E5/8+m8tT9a?=
 =?iso-8859-1?Q?OMKoITXxBEgdq8BKF+SIF/LDiyHz0vx2RfWhUoAFx9Ply1YIA2oKBplA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df837a6c-d3cb-4275-ce67-08dc705e4d8d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 19:29:11.1240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPGKbgS+VDkPxIYodC0J17JbxLsWibtzMhuRs46d7Cd9Cc49PL/tdPJfWkvjhZs/cs44BrveYfnzIAppTN9hKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8200
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

On Thu, May 09, 2024 at 03:16:54PM -0400, Rodrigo Vivi wrote:
> In the regular use case scenario, user space will create a
> VM, and keep it alive for the entire duration of its workload.
> 
> For the regular desktop cases, it means that the VM
> is alive even on idle scenarios where display goes off. This
> is unacceptable since this would entirely block runtime PM
> indefinitely, blocking deeper Package-C state. This would be
> a waste drainage of power.
> 
> Limit the VM protection solely for long-running workloads that
> are not protected by the scheduler references.
> By design, run_job for long-running workloads returns NULL and
> the scheduler drops all the references of it, hence protecting
> the VM for this case is necessary.
> 
> v2: Update commit message to a more imperative language and to
>     reflect why the VM protection is really needed.
>     Also add a comment in the code to let the reason visbible.
> 
> v3: Remove vma_access case and the mentions to mmap. Mmap cases
>     are already protected by the gem page fault.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Tested-by: Francois Dugast <francois.dugast@intel.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com>


Upgrade to:
Reveiwed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c5b1694b292f..2a49dea231e7 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1347,7 +1347,13 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  
>  	vm->pt_ops = &xelp_pt_ops;
>  
> -	if (!(flags & XE_VM_FLAG_MIGRATION))
> +	/*
> +	 * Long-running workloads are not protected by the scheduler references.
> +	 * By design, run_job for long-running workloads returns NULL and the
> +	 * scheduler drops all the references of it, hence protecting the VM
> +	 * for this case is necessary.
> +	 */
> +	if (flags & XE_VM_FLAG_LR_MODE)
>  		xe_pm_runtime_get_noresume(xe);
>  
>  	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
> @@ -1457,7 +1463,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  	for_each_tile(tile, xe, id)
>  		xe_range_fence_tree_fini(&vm->rftree[id]);
>  	kfree(vm);
> -	if (!(flags & XE_VM_FLAG_MIGRATION))
> +	if (flags & XE_VM_FLAG_LR_MODE)
>  		xe_pm_runtime_put(xe);
>  	return ERR_PTR(err);
>  }
> @@ -1592,7 +1598,7 @@ static void vm_destroy_work_func(struct work_struct *w)
>  
>  	mutex_destroy(&vm->snap_mutex);
>  
> -	if (!(vm->flags & XE_VM_FLAG_MIGRATION))
> +	if (vm->flags & XE_VM_FLAG_LR_MODE)
>  		xe_pm_runtime_put(xe);
>  
>  	for_each_tile(tile, xe, id)
> -- 
> 2.44.0
> 

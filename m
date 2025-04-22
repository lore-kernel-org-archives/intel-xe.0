Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B6DC369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 15:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199B610E5CA;
	Tue, 22 Apr 2025 15:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hwTn/IX8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F0B10E5CA
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 15:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745335598; x=1776871598;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v7vqiWRb/rIf2CXGzc/yMNOhym+r1jSb7o/0hR6EO6o=;
 b=hwTn/IX8ee0mfVPYRaqcm1pl4VrG6iY+eemPnoHD9noErx0RaQO/qK7o
 sEauGmLlCtN5AF+qRWfmcOLzBVXGae49rgpHvuQFwRLkD9rXs+CHo4Oen
 ERzzfwbCQjNsgA4e448VnPtXyNsrmIw3NaXVI/7Fg8JMwQMoNM0iUDNYs
 Dhzrw32DmGxkGGdy+SJq+A5Sv/czEVTRKx065BaKWVAfyjAitVP2+T6is
 8U6WHvin2E0THhPRat7wFvGgJxZcSESUoRqiMUUMUKFHk1QqEtHShUJk4
 I4hkiUlKMLIGo3OvDt+gwzapHWJJdL383OZ0MQA4Y08Dc8uyMSXNy8xso g==;
X-CSE-ConnectionGUID: DWeZWj+1RLC1w+qiN7ielA==
X-CSE-MsgGUID: 1Hg3VqBlTUGXcuuTmLmbzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="49563928"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="49563928"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:26:34 -0700
X-CSE-ConnectionGUID: h2Non8MkRdmnB9fzxxVpCA==
X-CSE-MsgGUID: wIqzQRXHTUqKhGhMYY82tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="137200231"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:26:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 08:26:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 08:26:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 08:26:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TF4IMm3Eyh5JNPzxgEvT+EjVGDxNAi0IvCIWwJ/gsisja7+7ZeShxlHuFHPgHenr/g55RE1VydtqnvqEWrIe0D1VwPvzx5iTRBo7wsFL2zciHYtkD1PmR/r23+7gsjb47en2BlUMcV6l/QzpmuXzRbfVIGGxGznxjiq+tt5nvZaJt+WLW6Os4bIpDn0XnoDL337+274cKO97ERA+CXfJ+d9GDacDD1Og5vlxFwyE0UVac76W09Vs2nXHYPFdlgLJ6VSR1tgXiQwqB5nXKkA//dMvq+80smRaJfWrIsBvf/Lm8u4p6C2FUXkvIy1t3fZAKrIAJIB2OaKY3GO7otzMGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrrVYo/5mKj14QfrRDLoAK9g7AREqBMNQcomrZyAZSM=;
 b=jRaWiwhzxDVovYmIYvnzz0jBCSgZGjMlt9YnCmMq2QQNLLK4ZIxear2aq41CxiadeAzRaaCvxDLoEswDprp1RA5oGzxpSBranPl57qwliwHh+l4jcE0GQa3rD0FADbEBiuZY0ow1vCrPAIZN9lcUI+bsMmjlgZgDyxLhX9AwZ1EVlG9T1u+4O7gznQ5b2r4+/j2WI7XbTou+EeKAoCH+H7BUJ7CuaeI6wC6BMLOMl8Z4uj9QCoAmZ+7c78yUZXYd8WLxN3NC5Bw952lW7cCpWIDHrWl5oc/ccLmVQdG3O6bs1UHMa/0Sq2k7hE738MkqJ0uTuNVWOU7m2kaVFGO0ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7367.namprd11.prod.outlook.com (2603:10b6:208:421::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 15:26:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 15:26:30 +0000
Date: Tue, 22 Apr 2025 08:27:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 13/32] drm/xe/svm: Incase of atomic access ensure
 get_pages happens from vram
Message-ID: <aAe1d9d5qnA7X+0/@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-14-himal.prasad.ghimiray@intel.com>
 <aACBRZD2Up9VNZJm@lstrano-desk.jf.intel.com>
 <6c86072d-5c53-49ac-a482-cb9a5aa9ad71@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6c86072d-5c53-49ac-a482-cb9a5aa9ad71@intel.com>
X-ClientProxiedBy: MW2PR2101CA0001.namprd21.prod.outlook.com
 (2603:10b6:302:1::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d52875-73ef-4d26-ce3e-08dd81b20e7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rfFZJXO0PpQxjpIUj5+ohMfe18hmIEQzBgQ9ABY7uq9rWqjyfcCW85172+zW?=
 =?us-ascii?Q?UiyV8b0SrhdICpOxkwW7MAjNNh8L1TU/+a950ekjtlZLIBX2rv8m7dGiKhE0?=
 =?us-ascii?Q?CeggyWmk9LlmFOQ91gKx8Ru0BW2RvBaHG+5gTMgwjvCaIOC4yes7GMyLZoiO?=
 =?us-ascii?Q?jAze640nQ2UA0+sMmlSdXJC7bEPR9OT4sYOfbZ+8OJrVQmd0S+U+gC6vu4lr?=
 =?us-ascii?Q?jsg+ggR/zjOUWDd+tzGt9IFfpCWXhWocOwgYMctuurD0F6gx+CM2oNSQ/Ga0?=
 =?us-ascii?Q?IInubcosYljpb6Z1sn3x/4higiA0TAidkHg7UbvAWyyuY5DS18JJCEsMOfiq?=
 =?us-ascii?Q?tc8tZd1Wka8vP6jRXgpdLxgqWsSGm72AuOusk+6bfUyos8KM0vwuvgAfzlvr?=
 =?us-ascii?Q?zlni6CQyYu/Yimm7NRVKA7dsubxkVdhI07LgOEkMZfMmEdjdHW2F7QjnORkY?=
 =?us-ascii?Q?FZcCC/+v+QA7q0WLM5GZsFUOT3COBxVXfq9ig+3CqXNiydCK04y/y7myuf3u?=
 =?us-ascii?Q?ZxkNBlPp/DRtqz0bZ4Lyp/Bm9isR4vTNjr1kx1urzfwfDcAe0+dqcf8PdhtA?=
 =?us-ascii?Q?fcOzNbD7o/Su62ZkQsLohHCjSqX4ZJ8yGr37fRRznZxizBDdfhm3Sld3eorw?=
 =?us-ascii?Q?4ZteN5v60hgN2JdEScVwZYxQVXC4ZNvavEXtg82vhFln0YQqfZEccmnFSuTb?=
 =?us-ascii?Q?LokKf50lewU5Ujy3LMgtd8BpTg/1MW8ILlA+h88MUdA4yosEgdQhVOQB6AQe?=
 =?us-ascii?Q?h5lJW8IUoVEOb2rB+9aYYdZ6ptAqWA674o7HJhNu0eUHLpFMTnceRCq+v2Uy?=
 =?us-ascii?Q?Olpdo+2uML9cnF7PFGYyn56DW4LHaI4kQ6Qi2XtrB12JOKl6Q+31TxRdDm09?=
 =?us-ascii?Q?00mrdPhCzzs7TH1G120F6ozBu4kNBpiKZ4kriXhZqqaYOBeZVuBouNpD2GMy?=
 =?us-ascii?Q?OXLtWCP8dWEQlNhjPxvcwVXXUNAYCJM+nzYRfDu7TIG4CZkPJRO3gev0y51N?=
 =?us-ascii?Q?EwOGCSbDyCnqeqgLOwS7lbaRwnZMZ11i8R971a9DXG8uB54uql9cq91ued7l?=
 =?us-ascii?Q?IiUOLEyeSIzj6ab1d943KjNHEg5b+vDEfzaeR4CbpwY5E1NrjQoETbTrJOOP?=
 =?us-ascii?Q?3lpmYIZJfJ56Qo6dQjXy6xuMS1BU6jOzObKOeV+jL6lMyQ5IA+DCnjEhhwBo?=
 =?us-ascii?Q?EHy6v50wUBC1D3xNMN+71FhtP7GF9Y2yaVbo9YohgHfwppTxfWgm5eNVSRVg?=
 =?us-ascii?Q?fCSniDjyvPfRbiR0y9YD0iIOF2HUHtFMyKFNtrz/NVvHypYP/Gnf9iO75LSy?=
 =?us-ascii?Q?mmyZivrS8+OrnGaLn110L5t6yIUJbQ3qcOXHGpL762YoaDsU/2QsGF/usJoN?=
 =?us-ascii?Q?A8g/26k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PJ/PZyPmWctf+n7UxZCFOzh9NcQcU5HiTFacCRBeceUjd90e8NYWbdrQ9yDT?=
 =?us-ascii?Q?35NYlL+F7Lcq0JmrmP7MUVXXG5BGkZDUUfybW7lB7bdkWyGc9apvzttiQVmJ?=
 =?us-ascii?Q?JAjKja/jhVHhI8bkPnciSM0iz52NKbMeh5VQSpetq40oaZ8CPUyzx0Sfg0eN?=
 =?us-ascii?Q?BLMcj9G8nHZYLi79hlav8tm7Xv2/n5Izhi8y6mXTFby/qlSOUov4WGvLkJd1?=
 =?us-ascii?Q?o220lviyLvHwA5p0Pzq0Zgc/Rc1ez9uX7U0h9UC8/ACvspd2w+gJsH74swRp?=
 =?us-ascii?Q?ExmFhNz4FqPAeM0Lkh+h4XZHYWYbQ0nH+UGwBWyz+c4txe8ONXQmqwP+jS7h?=
 =?us-ascii?Q?RqrayFEG0QwnOzaXAdnUzm3iby+8THl54J7T+EPuoMHdr2J9dB+2AC5jM4Mp?=
 =?us-ascii?Q?DSCltPIfIf2NDs2gQbfA3awaR2K0X4rSsxMGWelmKnVFBUFFcNlebDYWaNFl?=
 =?us-ascii?Q?zDT7aYp2Gz6QNGYMoOWXRu1drDufCDgbOBJq4dDYFTBq0ed+PdaHK5ORf1Lx?=
 =?us-ascii?Q?g3+qMlPKq1YjFRoHPrgWu77Uur2Ts8pBkxUQ1hY+JoUg4ti1lQd2GMg4bng/?=
 =?us-ascii?Q?pTUWMIb7i97ukxP1MmWsdBNx7heUg/l7bEemFR9MR8eutSQf669XdO6aReV4?=
 =?us-ascii?Q?lAGkzXM681LIKXhBv4U+yL/KhiS82YANd7nv1doC4G34mYNkfsR9iMBEAUTb?=
 =?us-ascii?Q?w3WnJfSexDYEAVvnnrmDgsK0ZyP1Bs0d6VVk9ui/5SGJt7CwLzVPQBqX2tme?=
 =?us-ascii?Q?1xyfThmfldVhbmdvvZt+jguwH6M6VCVu7cq0Ej6xmr13fF5OUMkM9+Vs+J+e?=
 =?us-ascii?Q?ZXppCe6tcA7s+q0ulmc15sCmeJ5IMTAt0rPkuMJdZ5q1dqanEKhQVA3LVSw1?=
 =?us-ascii?Q?SyLdyR0hW9kvhsqIlr4NKXCvp+KY0UaYvbcPZM9VNiMLHJuMM36mTLCyTpIH?=
 =?us-ascii?Q?dEh+baucceuoYJ+hcti3k82GzcoBogji/V9JyXZU1mXYaeGSQrCZQC21qjp0?=
 =?us-ascii?Q?enUc02kBGA621wUfyy/J289H29QJqUTtaFvMXadY+Nx5b8HWL4E1UCgOYpBw?=
 =?us-ascii?Q?jfgG4jLob9ZuP9pfBLfbO5va8CmnZZXmy6ANqvR1T8FbOg2+9s9D+Br8HCJH?=
 =?us-ascii?Q?y1OGKPxjx0mAA0hDXiSewUQpBW6Bhb4RkUoLg2506ViRZW0706Z64b7SRwoJ?=
 =?us-ascii?Q?X8il2OQ5ffnI8SCo2lMi85ZCtgLGqci4Z53Mo2cdAcvukYmYN5cRqbCfsWRQ?=
 =?us-ascii?Q?bOnllnw2kCFFJb0tcD1oBjHBaX1+9sj+wkviFwAZMtg+JzN+/qdcH4FbUKIE?=
 =?us-ascii?Q?W3RixNKKU8vabzDIVUXi73qtbj/54//yP/QUktyHXJdWpCFJHvm/AwRfIYw/?=
 =?us-ascii?Q?N0GoVNTXCAblw0yCOBr+5xrkNsUM7P2m3ZPgytv6qkbrrAntarD9DcAuXgi2?=
 =?us-ascii?Q?MKeH5ng0Ezb8xi2Uy9ssSR3ccz0SA1SkB8mTSQtK4zu8ftRLTXbSpR7/Zk/y?=
 =?us-ascii?Q?N6CSE6SUwBSmVZmc/TI8dIpGsTHEJduTNN/z7vgArcb1Qt/K8/gdGEVmEYwA?=
 =?us-ascii?Q?NIM/boopLcuv9Tb0hoEQuBFsM0bNTxUN9jDO59b+HVKMj/UQJakJ58gBpHtR?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d52875-73ef-4d26-ce3e-08dd81b20e7d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 15:26:30.5464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGx3BXEETIZXWYuJT9kb+WrAsc45t5Xt3vahHn/iUVoFiBW8Pw4gAFd6tZhfJy9KYLeEPNHV/8qIMayzD6coFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7367
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

On Mon, Apr 21, 2025 at 10:28:25AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 17-04-2025 09:49, Matthew Brost wrote:
> > On Mon, Apr 07, 2025 at 03:47:00PM +0530, Himal Prasad Ghimiray wrote:
> > > Ranges can be invalidated in between vram allocation and get_pages,
> > > ensure the dma mapping is happening from vram only incase of atomic
> > > access. Retry 3 times before calling out fault in case of concurrent
> > > cpu/gpu access.
> > > 
> > 
> > Again I pulled this patch into a series which will minimally enable
> > atomics per UMD request. See the version of the patch [1] I landed on -
> > that is basically my review feedback. I took ownership but left SoB by
> > you as it based on this patch. We will need another reviewer though as
> > we are both contributors but feel to comment there.
> 
> Thanks for update. Will use the version you modified for the prefetch series
> too. It looks good to me.

I'm going to repost today with your feedback addresses. I'd pull these
patches in as the first patches in your series to avoid conflicts if
those patches merge ahead of your series - I believe we are going to try
to those patches in 6.15 as fixes patches as the UMD doesn't really work
without them.

Matt

>  >
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/patch/649010/?series=147846&rev=2
> > 
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_svm.c | 43 ++++++++++++++++++++++++-------------
> > >   1 file changed, 28 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > index f4ae3feaf9d3..7ec7ecd7eb1f 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -778,11 +778,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > >   			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > >   		.check_pages_threshold = IS_DGFX(vm->xe) &&
> > >   			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> > > +		.vram_only = 0,
> > >   	};
> > >   	struct xe_svm_range *range;
> > >   	struct drm_exec exec;
> > >   	struct dma_fence *fence;
> > >   	struct xe_tile *tile = gt_to_tile(gt);
> > > +	int retry_count = 3;
> > >   	ktime_t end = 0;
> > >   	int err;
> > > @@ -792,6 +794,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > >   	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
> > >   retry:
> > > +	retry_count--;
> > >   	/* Always process UNMAPs first so view SVM ranges is current */
> > >   	err = xe_svm_garbage_collector(vm);
> > >   	if (err)
> > > @@ -807,30 +810,40 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > >   	range_debug(range, "PAGE FAULT");
> > > -	/* XXX: Add migration policy, for now migrate range once */
> > > -	if (!range->skip_migrate &&
> > > -	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
> > > -		range->skip_migrate = true;
> > > -
> > > +	if (xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
> > >   		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
> > >   		if (err) {
> > > -			drm_dbg(&vm->xe->drm,
> > > -				"VRAM allocation failed, falling back to "
> > > -				"retrying fault, asid=%u, errno=%pe\n",
> > > -				vm->usm.asid, ERR_PTR(err));
> > > -			goto retry;
> > > +			if (retry_count) {
> > > +				drm_dbg(&vm->xe->drm,
> > > +					"VRAM allocation failed, falling back to retrying fault, asid=%u, errno=%pe\n",
> > > +					vm->usm.asid, ERR_PTR(err));
> > > +				goto retry;
> > > +			} else {
> > > +				drm_err(&vm->xe->drm,
> > > +					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
> > > +					vm->usm.asid, ERR_PTR(err));
> > > +				return err;
> > > +			}
> > >   		}
> > > +
> > >   	}
> > > +	if (atomic)
> > > +		ctx.vram_only = 1;
> > > +
> > >   	range_debug(range, "GET PAGES");
> > >   	err = xe_svm_range_get_pages(vm, range, &ctx);
> > >   	/* Corner where CPU mappings have changed */
> > >   	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
> > > -		drm_dbg(&vm->xe->drm,
> > > -			"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
> > > -			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > > -		range_debug(range, "PAGE FAULT - RETRY PAGES");
> > > -		goto retry;
> > > +		if (retry_count) {
> > > +			drm_dbg(&vm->xe->drm, "Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
> > > +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > > +			range_debug(range, "PAGE FAULT - RETRY PAGES");
> > > +			goto retry;
> > > +		} else {
> > > +			drm_err(&vm->xe->drm, "Get pages failed,, retry count exceeded, asid=%u,, errno=%pe\n",
> > > +				vm->usm.asid, ERR_PTR(err));
> > > +		}
> > >   	}
> > >   	if (err) {
> > >   		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
> > > -- 
> > > 2.34.1
> > > 
> 

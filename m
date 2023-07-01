Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89401EB64DC
	for <intel-xe@archiver.kernel.org>; Sat,  1 Jul 2023 04:22:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D3810E52A;
	Sat,  1 Jul 2023 04:22:13 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDCE10E52A
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Jul 2023 04:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688185332; x=1719721332;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8gMHFpNo+j7LxFi5digi64uozWMYffHxqpGFD2+sm88=;
 b=FKhHuKV2qwhSHvkqpTmztpPDyGI3NZmKADTuf+c62ZB0v7KEM+9ymCuY
 RNdd12Y8Ub2iJzP6ByMCBN2IUVVNb/wgSMzbb7uBMMZWSfchF94c+KQSI
 P48Q5VUiJGzZQCt6DJfRobIecf7jZ+zgkN7GX1LakSgPCE/gIQm1D7c44
 nQsxQ3DlkP7xkEXu4DVTnzw2YzpQfJ2pBDKFLvjlyiTYF3n0O23lTsWQf
 jhPNVHT/XFlYvDRIJ8iw+ZvGOSAia2QuXCCsZKC3VE4LmFSPTMNSdpq2U
 y/JwWr8e8Abmjth6hzSl+QO/8dtquZbvwbCi0kOFmkxAE/RXXX/rGDLrD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="428592291"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; d="scan'208";a="428592291"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 21:22:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="753191354"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; d="scan'208";a="753191354"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 30 Jun 2023 21:22:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 21:22:10 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 21:22:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 30 Jun 2023 21:22:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 30 Jun 2023 21:22:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7qTWw1TuBJIA7sYHPNAgGbR7r9SEcdDO3K/NTxOxCYvYFEISJZgDtXzTes3Avk0etPseQk86CDPX54T6bjXWeOE7XLKG9YmpQA97DTy3QSjzjrtAxRQFktRA35XxGkuGzPaQFEROkLWeXLybPI/ICI9ml74sr/56fODhqgPoWJRLMbBeHCJXsMHRm40RdMQ7cNpQPU925g9ENFGV1mCrrQAKltv/+/PY4QKvronrKoG4rEd/AV9vU41Njve6faEiAFqw7ookPdJ5n7dlFE+TYkeXVoUSvvZKPiyCenzhi7UpTNqAB4cmFCrz0MfKYQJ7pN3eGUig/Hp5QCUczSKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2wnq7c1KPRMARShu5NUNX0lQiTdSgFeuOVAw/P6HmM=;
 b=F+xCHwoAA4nAwHb/nfvI35jTSkwg5BQL3ioViEQ/zr1jaqS13eN/nceuOLpMr2zygP/zMCbtn03V43ZhJ/MJb6ORwQzneeUpQg98odPZytTunNaeRFXsE3moVGYNUXNVAZJyHoRY876IEDBbMVx5hq+NV/Tf/ORFmkmGokOmyJ6gY746Yz1b+i1MVw1bwL6J5VXM/U3fH5/70G0zuvt/hZVOIK9PAUIu4fDNffRClwgVk66pOFsTH3uwUqbLoq8wolbJNoVUeaJTCB0XLGPXrY8ZAD4jeWyQDLpXY+s2dqKmoCO4vUVMSIJqpi3IshOxzBiKRTVrpXmK0rEyeY7+bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Sat, 1 Jul
 2023 04:22:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6544.019; Sat, 1 Jul 2023
 04:22:07 +0000
Date: Sat, 1 Jul 2023 04:21:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZJ+pyeDZ84w4kZMB@DUT025-TGLU.fm.intel.com>
References: <20230629205134.111849-1-thomas.hellstrom@linux.intel.com>
 <20230629205134.111849-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230629205134.111849-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4804:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c1e932-845b-4062-d176-08db79eabad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wEH9ezicOgL64anXW9PronkIQR/IPPF/hgHjXFGqjeRo/46fQRqeBRF9g7UmjlpXXbd+aXj6x+cB+gSQN5GPzk/10vA/CH4gIqd2tqrtLSvYx4ZSJfh5tUS5x1KDHjMpzmucYvQe4DLiYh3hb7uqedek+AJCDd7O643pTuy6dQ42cGSV9lbt8UQooaq83SNrq7MXKInOq/B3gg/JMV2v21gYr3PPZqpjKKpTRtFJHDKvp/NTTjaLllK1kb5Wi42aTeqi3iVwOVX1lYeTpBgMuT5JvE/59sK2/kuuIpexvKvFFmuIJzPd+DOWiFyRNkoaEqKrvy58rZdNYdTFOQmcnurZtbUYPWFsxM3fZoqZDbNxzYrBFnVvv400+v38mGvJErYmGMAMCE1MC9i473PZ0z6gU9bM9/JcjwyRsRmbek4BycFk326b51mXE/2Q2JsroWalxnUmH7741gztLIy+Ci5KvRnazO4k8GRbDpjGMgW7wm98TJUN1hn1756TrRBcu5GaFUW9W8dqbOplsWsxkhB6DmSOUdHtfy96ZfuHQCUG9XfDgOwh+3Fl/4EVIquf5LU0jJ61yL2Y6+gpODtOx6pUhS5skE/dWNP2fU6zr73oCLsl+l7DJWFimGDG26W6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199021)(86362001)(8936002)(8676002)(5660300002)(26005)(6506007)(44832011)(6486002)(478600001)(66556008)(66476007)(6916009)(4326008)(966005)(6512007)(41300700001)(66946007)(316002)(6666004)(66899021)(186003)(2906002)(83380400001)(66574015)(82960400001)(38100700002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?d74fp5mROmWzquOK4R5VFianVbSfs9NhJ+HD/UWHrY2thhDZ0Zx7DPALoG?=
 =?iso-8859-1?Q?PXd1GOU7Yk7ZIE1XBrIPC+j3+yqR7m5vMGTEAhX0ZthkqxeKnp5OVojyBf?=
 =?iso-8859-1?Q?bVfRMBFQjJpyIfxVAiej7XMcOi14cTKee4cH2sIQtsZTrA/ifDjePgNdMY?=
 =?iso-8859-1?Q?rYz0GKHIdf1qWC6NEQcazM5m29NWTdcx9cfTSIY0UjwmzbJeIon4ok186r?=
 =?iso-8859-1?Q?tO1nyaIrVYDZaNfmwXIV6H3xDThhoE11PLDTVSt7wa7hHza8fQWDFWNyZN?=
 =?iso-8859-1?Q?IAOyTXR/Qjvb6ikM9oGTGE/1fl1k27DTra6MY6rqOiiGhuCIoL2rdGi+0H?=
 =?iso-8859-1?Q?er5eDNh/vSddsriEFWR+RFHF4fWaVNqXCFp5HCR8jKWtz5Jtj+lMQpl335?=
 =?iso-8859-1?Q?zhmd/hR2TNugt9JZPX/BC+5YrkWbkaJu3Zo+DWx39fbDKgwR4W4En7ANff?=
 =?iso-8859-1?Q?MqhurI/WNw5/FwimVm3ErSSvzBt64dxJfylxtj5YZRoTwJa4gB6xc3w6Dv?=
 =?iso-8859-1?Q?Plgg3lPART8jwhtNR0u//G1nRGU9eqdadCOi7uzYrTkNUbT7rc3rJaSNdq?=
 =?iso-8859-1?Q?W5tInQoSCyvH7OZURMNTnB9MlDnkehNUJhtxAOSmwadYn/7Ipz41IeZ20Z?=
 =?iso-8859-1?Q?Jr/whyrqhz0Db9qHFvAI2ByMT4WBy12UsaekOKYrJ71CMuWDYp8NPVntAW?=
 =?iso-8859-1?Q?jGZNhslqBY0v/+fDXdzgtc1+/ffyy0Lydp37GdalrTySFrtD3GiDsyj0pa?=
 =?iso-8859-1?Q?M7R10QZ8EAD9aAefYKdqrOKAtABkr19xbG6CKeLEZaQfc4Fl19d7JvFVLv?=
 =?iso-8859-1?Q?LsxNDMKL/fYa4FOqC86+jHD2B1Tqcb8PiHdsZpbXIqh/ArvHIxytCUhxS+?=
 =?iso-8859-1?Q?g4G8qyoW/xvWvhEed5cWbrvGq6qGVOK57v0fA27PxGmQzYIzBMlvUzOTdZ?=
 =?iso-8859-1?Q?oPT3mQFX584N31KVT2zqdBDCKfOF8wtoMlT8HJmXNbIZSKxsxi7yLHau73?=
 =?iso-8859-1?Q?zBP5EaxtkVTeoaR5d3PKGDVowJR5X2vH0jHU8S54JhahsOTtBuYSWQzX1K?=
 =?iso-8859-1?Q?p+j9wXo2mzxH+LtjGQDqTITodM6zWsmopyG8wrSCDdYaT/l/r+mw1dhYCO?=
 =?iso-8859-1?Q?etnJfeOjqauEDn2P/YUaY4sAW9BM9PKtXe8+kzFrxDf9cZRL6Ha5maRPKD?=
 =?iso-8859-1?Q?BeN9llVukoPhaEOzN11jM1m/2a/a2DWbGxgbbaA3gGIcLyeH40z6dD4jt1?=
 =?iso-8859-1?Q?SiaaBcEdxW9kzPFPjUtfDQlHVqJqB3wnlPLJGMkgx0Z29UD2xXog6LsTpp?=
 =?iso-8859-1?Q?RI+FltAJn/e3dwrBKssg36Yn2oiHa+ADD/NqeHG3ByIv6/FxlpSIc7IpYO?=
 =?iso-8859-1?Q?l7JkxTVeuNkaOoD1hn37ekIadlEaEq0d0pbjQjRcGhH479T8h3TgfpZ0+X?=
 =?iso-8859-1?Q?nrAHsG1EFVo5CL2OXYmf5MxmQJ8Ed0b+l/9R5J9E2hAVU0FRz46laZVeQn?=
 =?iso-8859-1?Q?GlAPY6qYHP/rtLTXThmymMCi+GToAkJLNRyEZehj4VlP0/gvcnQmUZiBwB?=
 =?iso-8859-1?Q?eFxNYos2EYrN5XM8Zfs4PH1d5U+oq/nJCLey5MBGat1s2nE4X2HcbkW/bv?=
 =?iso-8859-1?Q?LQMfqWlgJW+whtWmo/Z66Q9BA10u+y5/vvKIfPgB25wBIgRVo4i/iU1Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c1e932-845b-4062-d176-08db79eabad3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2023 04:22:06.9136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gB3tZ3UC54AiTAckCXMHJvpuT6NPXBvXGVRA3gXVqqZfCOfzVuzho7iomUg+zQZCwBMKbXqYTNcUP3Fcry0aUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Fix the separate bind-engine
 race using coarse-granularity dependencies
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jun 29, 2023 at 10:51:34PM +0200, Thomas Hellström wrote:
> Separate bind-engines operating on the same VM range might race updating
> page-tables. To make sure that doesn't happen, each page-table update
> operation needs to collect internal dependencies to await before the
> job is executed.
> 
> Provide an infrastructure to do that. Initially we save a single dma-fence
> for the entire VM, which thus removes the benefit of separate bind-engines
> in favour of fixing the race, but a more fine-grained dependency
> tracking can be achieved by using, for example, the same method as the
> i915 vma_resources (an interval tree storing unsignaled fences). That
> of course comes with increasing code complexity.
> 
> This patch will break the xe_vm@bind-engines-independent igt test, but that
> would need an update anyway to avoid the independent binds using the
> same address range. In any case, such a test would not work with the
> initial xe implementation unless the binds were using different vms.
> 

We need to do better than this as this makes bind engines useless as
everything is serialized.

Hmm, how about a mtree where we store fences for un/bind jobs with the
key being the highest level in which the tree is pruned or unpruned?

Let's do an example on an empty tree with 48 bits of VA /w 4k pages

- Bind 0x0000 to 0x1000 <- Inserts mtree entry with key of 0x0 -> (0x1 << 39), fence A

- Bind 0x1000 to 0x2000 <- Waits on fence as lookup find fence A, no new
  fence inserted as the only entry inserted was a level 0 leaf

- Bind (0x1 << 39) to (0x1 << 39) + 0x1000 <- no need to wait on fence A
  as lookup fails, insert new fence B with key (0x1 << 39) -> (0x2 << 39)

- Unbind 0x1000 to 0x2000 <- no need to wait on fence A as lookup fails,
  no new fence inserted as the only entry removed was a level 0 leaf

- Unbind 0x0000 to 0x1000 <- Waits on fence as lookup find fence A,
  insert fence C with key of 0x0 -> (0x1 << 39)

I think this would be fairly simple to implement. The GPUVA series has
examples of how to implement mtrees with range keys [1].

One thing more thing is how to cleanup the mtree fences, I think a
garage collector which traverses mtree every so often which removes
signaled fences should work just fine.

What do you think? Crazy idea or does it seem reasonable? If it is the
later, lets talk on who should code this up.

Lastly, I have IGTs to expose these races, [2], [3], I think the IGTs
should work after these changes.

Matt

[1] https://patchwork.freedesktop.org/patch/544863/?series=120000&rev=3
[2] https://gitlab.freedesktop.org/drm/xe/igt-gpu-tools/-/merge_requests/13/diffs?commit_id=2de056f6e9213a804f8b0489bbd91b989834d158
[3] https://gitlab.freedesktop.org/drm/xe/igt-gpu-tools/-/merge_requests/13/diffs?commit_id=23ea98fce7523b2aa252f4fe19411f5591a5623b

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c  |  2 ++
>  drivers/gpu/drm/xe/xe_migrate.h  |  2 ++
>  drivers/gpu/drm/xe/xe_pt.c       | 48 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.c       |  1 +
>  drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++++
>  5 files changed, 61 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 41c90f6710ee..ff0a422f59a5 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1073,6 +1073,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
>  		return ERR_PTR(-ETIME);
>  
>  	if (ops->pre_commit) {
> +		pt_update->job = NULL;
>  		err = ops->pre_commit(pt_update);
>  		if (err)
>  			return ERR_PTR(err);
> @@ -1294,6 +1295,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  		goto err_job;
>  
>  	if (ops->pre_commit) {
> +		pt_update->job = job;
>  		err = ops->pre_commit(pt_update);
>  		if (err)
>  			goto err_job;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 204337ea3b4e..b4135876e3f7 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -69,6 +69,8 @@ struct xe_migrate_pt_update {
>  	const struct xe_migrate_pt_update_ops *ops;
>  	/** @vma: The vma we're updating the pagetable for. */
>  	struct xe_vma *vma;
> +	/** @job: The job if a GPU page-table update. NULL otherwise */
> +	struct xe_sched_job *job;
>  };
>  
>  struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index fe1c77b139e4..f38e7b5a3b32 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1119,6 +1119,42 @@ struct xe_pt_migrate_pt_update {
>  	bool locked;
>  };
>  
> +/*
> + * This function adds the needed dependencies to a page-table update job
> + * to make sure racing jobs for separate bind engines don't race writing
> + * to the same page-table range, wreaking havoc. Initially use a single
> + * fence for the entire VM. An optimization would use smaller granularity.
> + */
> +static int xe_pt_vm_dependencies(struct xe_sched_job *job, struct xe_vm *vm)
> +{
> +	int err;
> +
> +	if (!vm->last_update_fence)
> +		return 0;
> +
> +	if (dma_fence_is_signaled(vm->last_update_fence)) {
> +		dma_fence_put(vm->last_update_fence);
> +		vm->last_update_fence = NULL;
> +		return 0;
> +	}
> +
> +	/* Is this a CPU update? GPU is busy updating, so return an error */
> +	if (!job)
> +		return -ETIME;
> +
> +	dma_fence_get(vm->last_update_fence);
> +	err = drm_sched_job_add_dependency(&job->drm, vm->last_update_fence);
> +	if (err)
> +		dma_fence_put(vm->last_update_fence);
> +
> +	return err;
> +}
> +
> +static int xe_pt_pre_commit(struct xe_migrate_pt_update *pt_update)
> +{
> +	return xe_pt_vm_dependencies(pt_update->job, pt_update->vma->vm);
> +}
> +
>  static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>  {
>  	struct xe_pt_migrate_pt_update *userptr_update =
> @@ -1126,6 +1162,10 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	struct xe_vma *vma = pt_update->vma;
>  	unsigned long notifier_seq = vma->userptr.notifier_seq;
>  	struct xe_vm *vm = vma->vm;
> +	int err = xe_pt_vm_dependencies(pt_update->job, vm);
> +
> +	if (err)
> +		return err;
>  
>  	userptr_update->locked = false;
>  
> @@ -1164,6 +1204,7 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>  
>  static const struct xe_migrate_pt_update_ops bind_ops = {
>  	.populate = xe_vm_populate_pgtable,
> +	.pre_commit = xe_pt_pre_commit,
>  };
>  
>  static const struct xe_migrate_pt_update_ops userptr_bind_ops = {
> @@ -1345,6 +1386,9 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
>  	if (!IS_ERR(fence)) {
>  		LLIST_HEAD(deferred);
>  
> +		dma_fence_put(vm->last_update_fence);
> +		vm->last_update_fence = dma_fence_get(fence);
> +
>  		/* TLB invalidation must be done before signaling rebind */
>  		if (ifence) {
>  			int err = invalidation_fence_init(tile->primary_gt, ifence, fence,
> @@ -1591,6 +1635,7 @@ xe_pt_commit_unbind(struct xe_vma *vma,
>  
>  static const struct xe_migrate_pt_update_ops unbind_ops = {
>  	.populate = xe_migrate_clear_pgtable_callback,
> +	.pre_commit = xe_pt_pre_commit,
>  };
>  
>  static const struct xe_migrate_pt_update_ops userptr_unbind_ops = {
> @@ -1666,6 +1711,9 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
>  	if (!IS_ERR(fence)) {
>  		int err;
>  
> +		dma_fence_put(vm->last_update_fence);
> +		vm->last_update_fence = dma_fence_get(fence);
> +
>  		/* TLB invalidation must be done before signaling unbind */
>  		err = invalidation_fence_init(tile->primary_gt, ifence, fence, vma);
>  		if (err) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8b8c9c5aeb01..f90f3a7c6ede 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1517,6 +1517,7 @@ static void vm_destroy_work_func(struct work_struct *w)
>  
>  	trace_xe_vm_free(vm);
>  	dma_fence_put(vm->rebind_fence);
> +	dma_fence_put(vm->last_update_fence);
>  	dma_resv_fini(&vm->resv);
>  	kfree(vm);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index c148dd49a6ca..5d9eebe5c6bb 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -343,6 +343,14 @@ struct xe_vm {
>  		bool capture_once;
>  	} error_capture;
>  
> +	/**
> +	 * @last_update_fence: fence representing the last page-table
> +	 * update on this VM. Used to avoid races between separate
> +	 * bind engines. Ideally this should be an interval tree of
> +	 * unsignaled fences. Protected by the vm resv.
> +	 */
> +	struct dma_fence *last_update_fence;
> +
>  	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
>  	bool batch_invalidate_tlb;
>  };
> -- 
> 2.40.1
> 

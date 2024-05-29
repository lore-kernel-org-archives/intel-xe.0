Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2147C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 16:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7097D10FA94;
	Wed, 29 May 2024 16:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4OGpcS3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0B110FA94
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 16:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717001111; x=1748537111;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q4adp9v0XCqrfyVpz1s/zRXrIO8/yFwD9M1Yz+VMZxc=;
 b=f4OGpcS3bh91XvmXqKjyM40w7MIjTQpzo2ANmLx3+2d3Cepn55qDmhRl
 jAz1x9gzJxYYQWZmvYUMaj2qn1u7lLgI0wC5j339yIpwg6Ajaj/ChuyeW
 aydY5Z43NvbDbs2uid191zzwpCD3wKrSE7hQ0tgdIT9OX6VRIyyihqyNX
 8NvvAVzNlCwDBjWWecalR8XM9XXxNf9g/MR0C6uHRwUOsBomFy/YXRMPu
 B0oHqBQUoaVXVtVkwcbR6gVYe8R6YmQp+kkFr5o2iUArl9aSlsc9LAE9I
 FfsVMucectLr+PpZxmfAOqNtkjbhbAUsBPySa5jQhjcknYemtFhtp5m5t Q==;
X-CSE-ConnectionGUID: +VqweqI1SlSsNf+kJqkwZQ==
X-CSE-MsgGUID: MpIxC3tTQcyeKfgeJjpQtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24552351"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="24552351"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 09:45:11 -0700
X-CSE-ConnectionGUID: /bj9ZU4SS1O/zCoiX44bZg==
X-CSE-MsgGUID: 6iNx2TK8QMWVhlS8HVl23g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="35962622"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 09:45:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 09:45:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 09:45:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 09:45:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMYrlK+oyxdMNeeR9yMBrcfzYppffuBnFMFcpEKvN0WWFfJ3p/7Uqex6MY4oBBVSIP9J+e+QPrfiPP4eoPlMKFN58fqOXYYPstYEHFWKWYGmVUFqNM73YM0UPRl1+rYGgFMUZZRZ272ruY6zzvS2AxnNnjU/WoK2aA8VRNBHFEc8yQBN7dMVchKoVd7/2jwxvcvBGZDntvFoRkSq0r1nz1063IAsGHVIY6FlZqQVUBtBgilKqE6Re4YH/iBvLiVQbhKsDYN9yCa5afKR2NTPgIYl/A3zyEmWmH+iWNRuEtMsbOmlJJi9UZAvb5yn5IqTe1b+o4BpCOuhx+UsD1JaMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwUTKrU6pRHWvissiMSch3fed8tXqDsd3DyT98Qzh3M=;
 b=hVOy3IZN1je6dOsPJeX7c2Glpr25Yq4eoQRz5UfnQ2GTK1/tw2Zyqe8AU9H//qi1msjfVNBKJYR+h04vUyiwF9RubbpsAxEnTdOwVmHxYAJ5y1o6uwxgEbRP5tlb1ix9Ya7f29jWNFsA9CLIKCJujbRTnY3JDiv1ujQiIXZGihz2c/9idzHJo4uDJ5F7cGw7WnutKoyjkKJXM7i36QOPdZZkTIYZX3FzuI3AabQ+rdQC/gTZMjgXaIUubTg/8I7+cAdqtXnGL7fkywq7V1fngWcsrmkRbe7spmAe7U9LHAsNE5rt75BzqgXxxb4p0J7fwWvpiK5xfFONmUAGpbKsyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Wed, 29 May
 2024 16:45:07 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 16:45:06 +0000
Date: Wed, 29 May 2024 09:45:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Mishra, Pallavi" <pallavi.mishra@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe2: Enable Priority Mem Read
Message-ID: <20240529164504.GL4990@mdroper-desk1.amr.corp.intel.com>
References: <20240525004933.1124012-1-pallavi.mishra@intel.com>
 <20240528163455.GD4990@mdroper-desk1.amr.corp.intel.com>
 <PH0PR11MB5782B66225A9EE3FAC59939A82F22@PH0PR11MB5782.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <PH0PR11MB5782B66225A9EE3FAC59939A82F22@PH0PR11MB5782.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: 56252dd1-77d9-46db-9709-08dc7ffeb232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BhCqcF9O6g01V2JeJCXPt1tse/WU+InDsS2ugSl6MnHW8afw8idfQUkDseWo?=
 =?us-ascii?Q?pFV1Z1nGfzwT+zxpAzt9DUEmB2t3XVhw4flcxGbNdSXdoSApWP+XxGlt5c3Z?=
 =?us-ascii?Q?DsD5zKHHEErGHjIV6I6FkpO//d/MpAhSYhrDnS/+IbP1MrK2Tu1InkJII+Y6?=
 =?us-ascii?Q?I2WuWty46CjkiYVpxfcYyfsz1rUh5CM+cD8KCLXLknMJDeJJ8CoEK6GWVQgs?=
 =?us-ascii?Q?I76CUwv0spQujR5mvnSW7X+cLRw1dyrTcxaZAxvGyg1/j8p74AKnXLw7qE1q?=
 =?us-ascii?Q?N80iD0SsgRKYaZEv0Zv4wumU4FiguFiwI6Hi7FqDQAX2KRcSZg9GLBgA9Odg?=
 =?us-ascii?Q?AoR45E8k7rJEaD+C+DY4+LNAD3vzQJ6/gABBMqbeoICMSQymPNkUN4Z+3YRf?=
 =?us-ascii?Q?3mZ1Ilw0BkAz/J8B6cIT+ticMG0GFKrsJ9+9Gzq5XFuUt6bUqpcfjZ06gfes?=
 =?us-ascii?Q?CrzvLxswZWQM/9mSKMsK2RhrL/fqNctRQsYYdfwE41ibtTFoYfP7nSCs02kU?=
 =?us-ascii?Q?T7wyCRh7lNNfKbNRHSlABOBJLmnKbMsqemAPhMELYT8LrDC98kx1vBjumWJX?=
 =?us-ascii?Q?ji2UxVySDdqoG6evtS90Tp9voPPSDOcIf/t9+OyHc3ubHZK/rB0Mm9IjxEj7?=
 =?us-ascii?Q?j4fmpZkiFEVGKfua51rB2nUYScRCyJLYDnnbwgTJTxqwFB14k3Acvkn25QD5?=
 =?us-ascii?Q?g4ns5B1H/VWTankXSZ++KhzEj2d0T8duxQMAifyi4tPQNLFDTpTtHbS7CKSK?=
 =?us-ascii?Q?9MbGY/Fs443y692m8twyL6/lUvjdgaEH8Sk0a1htawCDxfOvA34ko4kIWuzS?=
 =?us-ascii?Q?A/BrUIYrWxsxwKs17E6pmJUQEyREX7vlpoxf9ar1OS10ID/ysdAjDhMRPUmZ?=
 =?us-ascii?Q?cwQ1r6UAaUUQoax1oejLpe9s9LgLHwcaMoULnD19kUErek1uoseUIIn8gvDw?=
 =?us-ascii?Q?SK6psER0UhleDKaCyc/va0n/eXcFBphQwiSz4sQjZNA7dlUWycMBzRmv8pOx?=
 =?us-ascii?Q?FU5aNIUGnXXjPZ7fI5EeeRXjM5QegrRn0L/Q3GY/vdenuIiD4lw+PbVSo53t?=
 =?us-ascii?Q?4Y/6Re4zcCVRI0PAzMWfT9YVYpmUhtUDZ9tr051q9yCzu+/bfd76Z9gj0ny6?=
 =?us-ascii?Q?OBTRWqKw6bptpGnLdog+roK1/QoutA4fkCU7lvC7tsd0zDn/7aniyBJ0aU3U?=
 =?us-ascii?Q?1NBgxJZrnrcY9XBm2i5O3Y5v3WbEgtT7vXKGwuf+2iQlr1sNdD3Q2yeAqRs?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9qvYmcVYcHLgeQZcl+3ztzZlKYyFGFBEYBpX/Pm0AcNvnuWq6A8B5sjaaklK?=
 =?us-ascii?Q?+B61ktkOgQvjUhh5O6AmJAe96CebvevxbMmKxX4qKPQEz3gkP0nx8Glh1aFa?=
 =?us-ascii?Q?LSiIeJD64jFl8fGBY2wdPwyNtWjLxnlJahAWf1LRsKCrFboNCyA7BBsKvc/8?=
 =?us-ascii?Q?duO7VQYHHowP1uWmJe9/09Njf8KHELt1yltY6hDBy2zE4+unK6eCEsGOBKaO?=
 =?us-ascii?Q?D5sky6ep9KrRgR51emsMefiEvocgdUDkRQUu9lF+DmIlmxe8fkL8cMpYJBGs?=
 =?us-ascii?Q?yyR5UDbPF7vd+LiLIl5CYLQ2PJy1te1VWZRM9RLM3dl5cDK3v0fWe7CvFmxH?=
 =?us-ascii?Q?2CbQ6ajDN+WSdHrq8GWobXKzy3d4Gv62PZ5XDsv7QPuOlI0jJF7bnEuDPxga?=
 =?us-ascii?Q?rPJd4p4GJJCCrkR/bgRhMWUXnP1Gh1r9i2a5Zukx3HML1zDL/qDSM0ylcHio?=
 =?us-ascii?Q?d9MimHNiTnri2yfWJ0dYtfhPZBBgs0Co7ksy1L5sYBuoaEmgfd2rz8n/CoY4?=
 =?us-ascii?Q?Ob3cRAEdz78G6SMywC45Ie9PBzdYvJUofKnGIIOArEvcli55/4td/CimdVKN?=
 =?us-ascii?Q?AYHOweNVfmP4ykoOQBKz66P2a3ziYA1smtcVe5WzAnNM2QNMsi6gnHJfgeR9?=
 =?us-ascii?Q?QQtOIXnCRX1bWNGpdpXHKto3pdIIKQvLPhXCpUS0rB6iXdH1gVle+5O4Gt3Z?=
 =?us-ascii?Q?j5sv/mdprc31RJFEAB3NADXcuSPpc6y8sCa009iw2JJTT61GHdOXA03zqKpV?=
 =?us-ascii?Q?OlLe2ppDy17lpQa99e0VAUBv1u7u3KfdutIjK7zUVvwBSoTT150e4PNAuUR1?=
 =?us-ascii?Q?DAABcIxuHmp1OW/c71l2tmzuppAjlkKowVEQElUsjHde/z/GAob9x6kvhXSc?=
 =?us-ascii?Q?OubYzq3j/6MAk16nSbbyZZBcw2t3dZRO2oiyAoW/ld4lHSQsFgju45cuTWdI?=
 =?us-ascii?Q?+v/tVBzUd193e+O2GEJb75/LBeNgiNeUWscEUtDRW0PN4IU1hnzsQadKY64c?=
 =?us-ascii?Q?0TrgiHFxxcGVMJ29Fmvx372pNNP/gkE8ynhjvvA8SxNXxKHWKECFU1hx6xig?=
 =?us-ascii?Q?xlhzgv1xHJJeyNS1FOGAdwBZczRKFlxe6EYqx4mhogLmaw0ADZn4QhAUZ3Tv?=
 =?us-ascii?Q?9m8RVqBiiHAKpKk3Ou/2pNTYl0lj8guUHRDsB1rS3hCNQppGjHhL62bo8i0n?=
 =?us-ascii?Q?OPs7+bfLWSos+ZM9A2TpIDzVlg9YZHK4/RJj3mA14gxjdSLorWAlNuI+LPe0?=
 =?us-ascii?Q?TrCLPXJVnzMSqCmqGYtG1VI7SCT3npLaXYCT6UR2Ae2ZIQTGOyfAdwNWH72x?=
 =?us-ascii?Q?dqTwvzC85qaTgZEY0S2Ghp9jJzrXtKsFl0wAECiWeca0qVvqFAFCz3z2WQnX?=
 =?us-ascii?Q?/TpztMdGaQUtO1w0AGj9ZEv383vnMWDjW67y4L3OJ86ilm6JodfCaBz+uHmF?=
 =?us-ascii?Q?Hj4VEStoyIPZlUyCcrPrAPmT/1USz+s+5ZgglUHbXyRFUxmB5bZUhKJLxGEw?=
 =?us-ascii?Q?4soMUG8CIuSZFXT416ZMOoVZjiLNxBF138Lt2IuYHx1OdS59brAZVIAcF/xD?=
 =?us-ascii?Q?4kO4jJ4W34hVWAHnVbb0cG1Q/iAT8QVsPNj9VQy0Sx4iu6KHQF201Rnpl/Me?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56252dd1-77d9-46db-9709-08dc7ffeb232
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 16:45:06.8986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QNTCLe8MXqm3bAbZPs5AKv0XCAJkHqt+DPudJLy8H/uVnkydSqyzj4Gv9suNZXok5z34OIGp37qGaKX87iM+QVlIRPkpNe9WJXoGk0jy0aE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
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

On Wed, May 29, 2024 at 09:00:42AM -0700, Mishra, Pallavi wrote:
> 
> 
> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > Sent: Tuesday, May 28, 2024 9:35 AM
> > To: Mishra, Pallavi <pallavi.mishra@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [PATCH] drm/xe/xe2: Enable Priority Mem Read
> > 
> > On Sat, May 25, 2024 at 06:19:33AM +0530, Pallavi Mishra wrote:
> > > Enable feature to allow memory reads to take a priority memory path.
> > > This will reduce latency on the read path, but may introduce RAW
> > > hazards.
> > 
> > You might want to elaborate on what "may introduce RAW hazards" means.
> > I.e., it's worth noting that both kernel *and* userspace-submitted batch
> > buffers may now be subject to read-after-write hazards if they don't use
> > MI_MEM_FENCE in cases where there are assumptions about operations
> > happening in-order, but where a read could potentially leapfrog a preceding
> > write now that we've enabled this.
> > 
> > Presumably since there aren't any other changes in this patch you've already
> > confirmed that there's nowhere in the KMD itself that needs extra fences
> > added to avoid read-after-write hazards...you might want to mention that in
> > the commit message too.
> > 
> > This could expose previously-harmless bugs in userspace drivers and/or IGT,
> > so it will be important to make sure we land this before lifting force_probe on
> > these platforms, otherwise the appearance of those bugs would be seen as a
> > KMD regression, even though the bugs themselves live in userspace.
> > 
> > > Bspec: 45845, 60237, 60187, 60188
> > 
> > 45845 is a page for pre-Xe2 platforms, so I don't think that's the one you want
> > here.  I think you want 60298 for the Xe2 equivalent page that documents the
> > register bit.
> > 
> > >
> > > Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 1 +
> > >  drivers/gpu/drm/xe/xe_hw_engine.c        | 7 +++++++
> > >  2 files changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > index 263ffc7bc2ef..4e8f9a61f0bf 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > @@ -104,6 +104,7 @@
> > >  #define CSFE_CHICKEN1(base)			XE_REG((base) +
> > 0xd4, XE_REG_OPTION_MASKED)
> > >  #define   GHWSP_CSB_REPORT_DIS			REG_BIT(15)
> > >  #define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
> > > +#define   CS_PRIORITY_MEM_READ			REG_BIT(7)
> > >
> > >  #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0,
> > XE_REG_OPTION_MASKED)
> > >  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > index de1aefaa2335..34aa8b5270b0 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > @@ -424,6 +424,13 @@ hw_engine_setup_default_state(struct
> > xe_hw_engine *hwe)
> > >  					   0xA,
> > >
> > XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> > >  		},
> > > +		/* Enable Priority Mem Read */
> > > +		{ XE_RTP_NAME("Priority_Mem_Read"),
> > > +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2000, 2004)),
> > 
> > The current platforms that currently support this are BMG (graphics version
> > 20.01) and LNL (20.04), so the starting point of this range should be 2001
> > rather than 2000.  Also, since this is a new feature rather than a workaround,
> > the expectation is that it will (probably) continue to exist on future platforms
> > as well, so it's best to just use XE_RTP_END_VERSION_UNDEFINED as the end
> > point so that we don't need to keep coming back here and updating this for
> > every new platform in the future.
> > 
> > Also, RTP rules using GRAPHICS_VERSION[_RANGE] only get applied on the
> > primary GT.  If this feature is also available on the media engines (I think it is
> > since I don't see anything in the bspec implying it wouldn't be supported),
> > then we'll also want a second table entry for those (i.e., pretty much a copy of
> > what you have here, but using a MEDIA_VERSION_RANGE(1301,
> > XE_RTP_END_VERSION_UNDEFINED) to capture the media IP.
> 
> Thanks for the review. 
> 
> Just to update you, I see below failure 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v1/bat-lnl-1/igt@xe_module_load@load.html

The key error there is:

    *ERROR* GT0: illegal register in save/restore workaround list

Looking at the other dmesg output, I think the problem is that we're
somehow adding the RCS engine's instance of CSFE_CHICKEN1 to each
engine's save-restore list rather than the engine-appropriate instance
of the register:

  <7> [305.651033] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying rcs0 save-restore MMIOs
  <7> [305.651079] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x20c4] = 0x3f7e0306
  <7> [305.651121] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x20d4] = 0xc080c080
  <7> [305.651164] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0xe48c] = 0x02000200
  <7> [305.651202] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0xe49c] = 0x40004000
  <7> [305.651239] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0xe4c4] = 0x08000800
  <7> [305.651276] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0xe4f0] = 0x00020002
  <7> [305.651315] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0xe7c8] = 0x00002000
  <7> [305.651351] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0xe7cc] = 0x00009000
  <7> [305.651692] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying bcs0 save-restore MMIOs
  <7> [305.651730] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x20d4] = 0x00800080
  <7> [305.651765] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x220c4] = 0x3f7e0306
  <7> [305.651796] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x220d4] = 0xc080c080
  <7> [305.652125] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying bcs8 save-restore MMIOs
  <7> [305.652164] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x20d4] = 0x00800080
  <7> [305.652202] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x220d4] = 0x00800080
  <7> [305.652241] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x3ee0c4] = 0x3f7e0306
  <7> [305.652274] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x3ee0d4] = 0xc080c080
  <7> [305.652596] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: Applying ccs0 save-restore MMIOs
  <7> [305.652629] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x20d4] = 0x00800080
  <7> [305.652662] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x1a0c4] = 0x3f7e0308
  <7> [305.652691] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x1a0d4] = 0xc080c080
  <7> [305.652723] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x220d4] = 0x00800080
  <7> [305.652757] xe 0000:00:02.0: [drm:xe_reg_sr_apply_mmio [xe]] GT0: REG[0x3ee0d4] = 0x00800080

I.e., we're seeing 0x20d4 in the bcs0, bcs8, and ccs0 lists for some
reason, which the GuC firmware (properly) flags as invalid.

I *think* that might be because you accidentally put the
"XE_RTP_ACTION_FLAG(ENGINE_BASE)" outside the SET() rather than inside
it.  The one downside of our magic macros to created nested RTP
structures is that the compiler doesn't notice when we accidentally
misplace the parentheses, and it can lead to really strange behavior.


Matt

> 
> Working on resolving this now. Will update once this is fixed and patch with comments incorporated
> is ready for review.
> 
> > 
> > 
> > Matt
> > 
> > > +		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
> > > +				     CS_PRIORITY_MEM_READ)),
> > > +		  XE_RTP_ACTION_FLAG(ENGINE_BASE),
> > > +		},
> > >  		{}
> > >  	};
> > >
> > > --
> > > 2.25.1
> > >
> > 
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9349C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 04:47:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6992110E9CA;
	Fri,  8 Dec 2023 04:47:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4852810E9CA
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 04:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702010842; x=1733546842;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LBlVzZPJ+0Tuk1DIYupQQllKHGrA9XIi4kD/E+Jo+0Y=;
 b=Q3Ct8YVuQYFSzVRgPH9TRzxBD5iJVt9nuFeC2QF6JfdW7vReS+qWynF8
 hbWogOAJV99/4zBmtOKCYtCFAFAdqeAbjh0yqZ1veSCgm4s+zTJ+liRVV
 qcjeJ6Ba45N5hM3voGjzjEXG/u5vgZpR0D/bXGQZMF2cU7n+bUSDbocEd
 sHSUwa8p/sYfzuocPCGeYUixWbfWQZE/i9yzEzm0cUFC4VRuPhW2fnxVe
 4QsKNliCYji6g0FOhYYYn1chZPLDkxPWrOqlGmxjvb4vz4FLNiAxjxuzg
 WxyYWw3WoZrspn9dBzNO51JQ+rAbNskiwWAwmzf7NC3TmxyoGvkUA7yIj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="7717133"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="7717133"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 20:47:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="748213754"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="748213754"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 20:47:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 20:47:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 20:47:20 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 20:47:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1KD/1PDCgPGT37ydzaHv98q1rgFBIor0wTD2l5ArBdHrp06PqVqi7/wV4fJbkg0nerlRVc89HYJSznq+HZ61wtF9WxOMO84PEW8kR3isiv6cPDj1SSJytRKNjtSRCi47pUzXTXfsUOvc8/GqjiKRYL0IoCuLKOwpRadMF/dp0vNc4zZt5AwDhNJABDlFgus5Mxb4Et8KjIs7zdUTeZM2dYwzo6bpA+TmY4OPbqZukxO53LjTGO6XbUL3s7I0oZGfbiaZIXuBkPgjSdVCKoBShK1r/BZu/Au/317S9m5yaPVjeRYi+kmCHboZuKZFPex4YppovMOpMr4II7Tdvtu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PpDPnMwcy8YAPhu1bB5aWKFzH3pNu6JorGrBKRthNo=;
 b=Ovtvo8Eq7MDmiqxdVhalHUWfhTlqU5jczyPlHUYeJ9awAiUFP0nJJcRvjFa6ABhEPJmOhsI/K8ySnHNwAm+H6LZucu1avxrFhZPJv7BYwRecHHv1Q3srHcfT7/0EuVh4SrjVPGRC2OUHpY/C9yPZY/7yO69gxcgzjWJuIFkcHz+pzrWybsLR/eiqrfRL2PJ3f/L/vA0aTSykI/WI0Tq8eXxlTUUUXdPcWXHZe7dkIcWkUTUonYuGNF1ih+FovvO9i+E/qgWWuNQ6z6NgENhagGZTgRt/JvH3a2yz1yLx59ctYpgOS7yeKgjVrLBk4ovG1+MyUiJF9/8Nd2+VfjZbWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB8293.namprd11.prod.outlook.com (2603:10b6:a03:44f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 04:47:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 04:47:18 +0000
Date: Thu, 7 Dec 2023 23:47:15 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Change the name of frequency
 sysfs attributes
Message-ID: <ZXKf0yVaESLeQ3eB@intel.com>
References: <20231205213659.179813-1-rodrigo.vivi@intel.com>
 <046df246-d29f-4551-9df0-fcf8aa4502a9@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <046df246-d29f-4551-9df0-fcf8aa4502a9@intel.com>
X-ClientProxiedBy: SJ0PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: eab0b6d3-db41-4e60-e3b8-08dbf7a8c206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7VYY3oaU6pzfqBRWOb4fRgiYuqKSfN/iHb6bpT3MJKQvZizlspaQ3fIUK75ifdiCi2EBcmj+AWPVLQT7yjUDfro9hgEdt71hi/V/Z/hT+lOC+Wso/AMwcdzXZ2VDxj0D8YTwna+HqVxjR2eUh8HivLN8kp/XwhpU2TQIBYYd+bri84rySRZSzvEF/uKW5rBXLGoppkCnXrh+H5Q8iuQm3aUKweV/VS3UcsvYxU9xW3bGeqeYO3kvRY3nPe67Lrn5V8liB6ylzFw/bJ8LOkTMaUQH022UmAojhmMU+pdv/AeXD66NSR0TlsISNZsiU+aFEKt7ZPjamuqd5O3zIEHgEd4kyZi18vhaTlLaL8T3uppES5bKRh6cu11lYT6w1/nYBBVlnzIU2WOHUfxI28rmplc7PEj4frkp5Jy6MA35n0TsUbvbENHx99sJl/3FD9qUC9pC5sR7hznKtSmMTXAZzytokmxpgs9CDEhU28izQ9xQg71KO9zMFWEIzFHLfH4FSR/o81fOvcnqT7rqvjJk1fJmRghHAOCEjBo1YpSm7bmaxD4QsnEFBi6YcEWzc4jw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(376002)(39860400002)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(5660300002)(2906002)(6636002)(41300700001)(38100700002)(66556008)(37006003)(86362001)(82960400001)(66946007)(107886003)(26005)(478600001)(6512007)(2616005)(66476007)(53546011)(6666004)(6506007)(83380400001)(6486002)(44832011)(8936002)(8676002)(6862004)(4326008)(316002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uBgtlHP8ufroglCUzGh7YKlONq6SKF5e6GjfkJFal3EbXU+lOqZExf/Ub2Wv?=
 =?us-ascii?Q?VjOPm3Ybc6QJCouc/TgID3VIIfinzxqWL6viJYv09f4OJxeiQAw/npWIWhWj?=
 =?us-ascii?Q?SamIVMm8b5F5lHQmibo+hUoC46p16GRMU46dREpkRIyuLrRUsyxUjOA8f6W+?=
 =?us-ascii?Q?vSSZjK92p/akjyR+pY5/48EBeWXVQ6/MNIDdD1W9wEi7nWLI7aBych1zF4+j?=
 =?us-ascii?Q?V+Zy3VZa9lUf70MDb9Kys7dn6+t8WBpauudsF2edyDQE7mJ/DbkkdU9oB5P5?=
 =?us-ascii?Q?fsYaKl59Rjz5AlPSVaeBa73p6wGhWqemfHvQEuev+8U7vnhOHzD2Yiilk6Dj?=
 =?us-ascii?Q?60kF22MnwZn9WTgDUtCTY1QygghW5VsGZYbnu5nMWiiaL2ij35ua5yZBC6b7?=
 =?us-ascii?Q?e9TZYBrkYm/gh8zf4D0XAtdMjaIvtk0gSOX8fXhShx2vEl7rFk/9TtrdZHrB?=
 =?us-ascii?Q?UrsinpR/trxDVNf35UXJiwTrnAQ9zONOejRVDVeZ7YxbaYNPuZgWdxWOU391?=
 =?us-ascii?Q?Y5nhiu43yaWxQQnz0krVN/v/ezlgpwFXnND9ErnJbrjqcfjmIfgTrQXKECVJ?=
 =?us-ascii?Q?eOA3CSzMCAWBe8nlvg5xwCu5/ilDixcqEuTTE5sJutC/AKifainK2km3Dhxq?=
 =?us-ascii?Q?mDEDNOcnIo0gBSYbSS1ykcCahzQhdTfk1HyEMgcaG9lNaoaAJMVs9x1KT8rJ?=
 =?us-ascii?Q?nbG49w2mWyA1/yM+GyFn6LEKTyDLCB00f4qlJBsetFoajYSU26457+VxE3UN?=
 =?us-ascii?Q?9IyMQItF6qYelBhQpN/4nger5lRXB7RFrEw0eWqMdRIQWSw992bAlNPxQhmC?=
 =?us-ascii?Q?cKdXFIEbGAK9DX3IKWp53UK14O0CnUCm7StHe5GgsVzl+/lJHr5qiWq6Ikbi?=
 =?us-ascii?Q?zknpeU3Zs92HdnvbsmtDvnBerNZjVP6fllNuCnM/QwOcCv5D0se+DB3wMMAZ?=
 =?us-ascii?Q?9YmQjodWwoIslkYSQZqMJRcR093goJK2osdINMx5+SzSNipV1cxnWVYLBdyX?=
 =?us-ascii?Q?QX7cYWvW258PovlORwMhsphpoKa8dScbeJOUCQYxVA3RkdRlS4lSiJW/tiTP?=
 =?us-ascii?Q?FDd4N6Wg8Op0WN3/BvDr28+4uxtF6RTy3eNIP1GxQKjg/gAbD3N02iz6OeAt?=
 =?us-ascii?Q?bIoN8rL+4mlATu64IFJNgD4dvUOwLbTGhaeThVCRrxja783nvQ35V3GZh7bH?=
 =?us-ascii?Q?IIye8xkWcc5kgAd1bLO7XSUA6UO4ySo3wIFrDQYf6u7rIBM86HkHq+vi7/Nb?=
 =?us-ascii?Q?9m2K10oZzEy8i18stQRg1kKoNZyv1wCPfiaXOdUcY94QuzxNka0mfBvxTh3T?=
 =?us-ascii?Q?wUGs4JBhlFFBSEGgI8qkUyELHxC/14zIKdbZM52io9c15lJRMoMhnwtVomBr?=
 =?us-ascii?Q?tH2gooKcGE4T3bFtP1a9vIvEa3vInxSSjJrq2CPiMatKqZY4sJamZ4FlyHtE?=
 =?us-ascii?Q?fXnqJjILVH2IEE91JjiESBP0aRi5nIAtckBJluu7EhHQZa8yeXC7rs34gDH0?=
 =?us-ascii?Q?cGwbtbHDMpL3RWmQy0eBmo84xpfG2SsJ9dsaKiE4DTaVKMvZaitfifFVVHVm?=
 =?us-ascii?Q?R+NaeV7YGQvqlWUE4/VfEuFaSzo9gTt9RzdM97HR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eab0b6d3-db41-4e60-e3b8-08dbf7a8c206
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 04:47:18.7171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tM22QkzAfXCI9YlBHA1Vd5kx8X1kB4SY9abb1g/VJq939U/vbGAd0t1PNHgGW+yvS4Xe5P5rJo5h3c5dDbUU5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8293
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 11:04:04AM +0530, Riana Tauro wrote:
> Hi Rodrigo/Suja
> 
> These changes are removed again in the second patch.

What? they are not. The final result is something_freq.

The next patch is based on this.

> Is this patch required?

and both are required if we want to be prepared for a
possible alignment with devfreq.

> 
> Thanks
> Riana
> 
> On 12/6/2023 3:06 AM, Rodrigo Vivi wrote:
> > From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> > 
> > Switching the names of frequency sysfs attrbutes to align with
> > required devfreq changes. The name changes are as below;
> > 
> > -freq_act -> act_freq
> > -freq_cur -> cur_freq
> > -freq_rpn -> rpn_freq
> > -freq_rpe -> rpe_freq
> > -freq_rp0 -> rp0_freq
> > -freq_min -> min_freq
> > -freq_max -> max_freq
> > 
> > Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_pc.c | 60 +++++++++++++++++-----------------
> >   1 file changed, 30 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > index d2605a684b1c..b1876fbea669 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -60,15 +60,15 @@
> >    * Xe's GuC PC provides a sysfs API for frequency management:
> >    *
> >    * device/gt#/freq_* *read-only* files:
> > - * - freq_act: The actual resolved frequency decided by PCODE.
> > - * - freq_cur: The current one requested by GuC PC to the Hardware.
> > - * - freq_rpn: The Render Performance (RP) N level, which is the minimal one.
> > - * - freq_rpe: The Render Performance (RP) E level, which is the efficient one.
> > - * - freq_rp0: The Render Performance (RP) 0 level, which is the maximum one.
> > + * - act_freq: The actual resolved frequency decided by PCODE.
> > + * - cur_freq: The current one requested by GuC PC to the Hardware.
> > + * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
> > + * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
> > + * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
> >    *
> >    * device/gt#/freq_* *read-write* files:
> > - * - freq_min: GuC PC min request.
> > - * - freq_max: GuC PC max request.
> > + * - min_freq: GuC PC min request.
> > + * - max_freq: GuC PC max request.
> >    *             If max <= min, then freq_min becomes a fixed frequency request.
> >    *
> >    * Render-C States:
> > @@ -388,7 +388,7 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
> >   	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
> >   }
> > -static ssize_t freq_act_show(struct device *dev,
> > +static ssize_t act_freq_show(struct device *dev,
> >   			     struct device_attribute *attr, char *buf)
> >   {
> >   	struct kobject *kobj = &dev->kobj;
> > @@ -413,9 +413,9 @@ static ssize_t freq_act_show(struct device *dev,
> >   	xe_device_mem_access_put(gt_to_xe(gt));
> >   	return ret;
> >   }
> > -static DEVICE_ATTR_RO(freq_act);
> > +static DEVICE_ATTR_RO(act_freq);
> > -static ssize_t freq_cur_show(struct device *dev,
> > +static ssize_t cur_freq_show(struct device *dev,
> >   			     struct device_attribute *attr, char *buf)
> >   {
> >   	struct kobject *kobj = &dev->kobj;
> > @@ -442,18 +442,18 @@ static ssize_t freq_cur_show(struct device *dev,
> >   	xe_device_mem_access_put(gt_to_xe(gt));
> >   	return ret;
> >   }
> > -static DEVICE_ATTR_RO(freq_cur);
> > +static DEVICE_ATTR_RO(cur_freq);
> > -static ssize_t freq_rp0_show(struct device *dev,
> > +static ssize_t rp0_freq_show(struct device *dev,
> >   			     struct device_attribute *attr, char *buf)
> >   {
> >   	struct xe_guc_pc *pc = dev_to_pc(dev);
> >   	return sysfs_emit(buf, "%d\n", pc->rp0_freq);
> >   }
> > -static DEVICE_ATTR_RO(freq_rp0);
> > +static DEVICE_ATTR_RO(rp0_freq);
> > -static ssize_t freq_rpe_show(struct device *dev,
> > +static ssize_t rpe_freq_show(struct device *dev,
> >   			     struct device_attribute *attr, char *buf)
> >   {
> >   	struct xe_guc_pc *pc = dev_to_pc(dev);
> > @@ -465,18 +465,18 @@ static ssize_t freq_rpe_show(struct device *dev,
> >   	xe_device_mem_access_put(xe);
> >   	return sysfs_emit(buf, "%d\n", pc->rpe_freq);
> >   }
> > -static DEVICE_ATTR_RO(freq_rpe);
> > +static DEVICE_ATTR_RO(rpe_freq);
> > -static ssize_t freq_rpn_show(struct device *dev,
> > +static ssize_t rpn_freq_show(struct device *dev,
> >   			     struct device_attribute *attr, char *buf)
> >   {
> >   	struct xe_guc_pc *pc = dev_to_pc(dev);
> >   	return sysfs_emit(buf, "%d\n", pc->rpn_freq);
> >   }
> > -static DEVICE_ATTR_RO(freq_rpn);
> > +static DEVICE_ATTR_RO(rpn_freq);
> > -static ssize_t freq_min_show(struct device *dev,
> > +static ssize_t min_freq_show(struct device *dev,
> >   			     struct device_attribute *attr, char *buf)
> >   {
> >   	struct xe_guc_pc *pc = dev_to_pc(dev);
> > @@ -513,7 +513,7 @@ static ssize_t freq_min_show(struct device *dev,
> >   	return ret;
> >   }
> > -static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
> > +static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
> >   			      const char *buff, size_t count)
> >   {
> >   	struct xe_guc_pc *pc = dev_to_pc(dev);
> > @@ -543,9 +543,9 @@ static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
> >   	xe_device_mem_access_put(pc_to_xe(pc));
> >   	return ret ?: count;
> >   }
> > -static DEVICE_ATTR_RW(freq_min);
> > +static DEVICE_ATTR_RW(min_freq);
> > -static ssize_t freq_max_show(struct device *dev,
> > +static ssize_t max_freq_show(struct device *dev,
> >   			     struct device_attribute *attr, char *buf)
> >   {
> >   	struct xe_guc_pc *pc = dev_to_pc(dev);
> > @@ -571,7 +571,7 @@ static ssize_t freq_max_show(struct device *dev,
> >   	return ret;
> >   }
> > -static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
> > +static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
> >   			      const char *buff, size_t count)
> >   {
> >   	struct xe_guc_pc *pc = dev_to_pc(dev);
> > @@ -601,7 +601,7 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
> >   	xe_device_mem_access_put(pc_to_xe(pc));
> >   	return ret ?: count;
> >   }
> > -static DEVICE_ATTR_RW(freq_max);
> > +static DEVICE_ATTR_RW(max_freq);
> >   /**
> >    * xe_guc_pc_c_status - get the current GT C state
> > @@ -667,13 +667,13 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
> >   }
> >   static const struct attribute *pc_attrs[] = {
> > -	&dev_attr_freq_act.attr,
> > -	&dev_attr_freq_cur.attr,
> > -	&dev_attr_freq_rp0.attr,
> > -	&dev_attr_freq_rpe.attr,
> > -	&dev_attr_freq_rpn.attr,
> > -	&dev_attr_freq_min.attr,
> > -	&dev_attr_freq_max.attr,
> > +	&dev_attr_act_freq.attr,
> > +	&dev_attr_cur_freq.attr,
> > +	&dev_attr_rp0_freq.attr,
> > +	&dev_attr_rpe_freq.attr,
> > +	&dev_attr_rpn_freq.attr,
> > +	&dev_attr_min_freq.attr,
> > +	&dev_attr_max_freq.attr,
> >   	NULL
> >   };

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB12FE95A96
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 13:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F83B10E0B7;
	Mon,  9 Oct 2023 13:08:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE42510E0B7
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 13:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696856918; x=1728392918;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1aer4XPpxWuJ5jDmsxhGv5AkV8/ztMEJyAGXasSewAM=;
 b=dtcmQNQF1XM3Yk7LsltRrKyVt+PRSbSOaYcxI++Kp896gx6Sv88vE79f
 AX8f/zhUMObpxAb+dG8GU7kS7WA1XVfMu/W8kBTzoDOSqv3fw5fCufL7r
 1yPdZ/inpuyTEiXpHolWrG9VOsLM9LoUTCcZjMjr/6MheBAXOyJ3Q8eYP
 4p9rCo4akW6r0x9u+OIEj+s2MiY+2lhOuyTieM/u7gO4MusMFDDIGq2No
 Akel6mYmQe+vSxQk1ojbYcAPZhN4DcQrtK+jX5fEpEbVbqlPZ5q/pmL1h
 yQUOmighroZwQrl8grrUSt6yFZ2uIy2fa+TEzw1EkLlsdkh/Hm6tbHNZk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="415127638"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="415127638"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 06:08:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="896764602"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="896764602"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 06:06:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 06:08:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 06:08:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 06:08:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 06:08:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MScEP4x/qLVjq0Si1fnLsF2bdE+EKHODqyKRfjRM9usgtLnJHzhlJzgalBwmR40VETaMwo/gsihRZ6AwK3yl4ca7b5Otwlfhq2lgX6kYbU/CmYusDeReHnFNw691Rgp1tuLcr4dw/Jrhs+r9AOFalUweWRgDtI1MYgL3cRVydZ97y2oRUmbyxaTLYe7K09f6mNHhH4B6El31MW9brVIzHg24VI/R2v5rXijHYtp8fs67aKWupur3JvBpX+w7MnjKqPTo86yvWHJgbMl8sVd7Hpl5kZNqY/M2437kJa+ik5reI9ds2J8kQnkmuOMdVuqSAaybgKI9VEXdE3hV+0Rb0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lpf5LLr7syHSFVAx8hk3JcfaLwNftLlDkmuNb1mAHAk=;
 b=ehSRf+Lou6snDH9SEuY04a3Es6aBB2rsKNPX9Gk49T3T9FPzcVZpuMLW6VUw96FVEVc2JIA8NhlB5wDwkHBqpP7RPUgOulE9n9B46h8qPwqidPEp4h/RotbEGVSngdSll9/TgYki31FW7d28hd8mTJ/kCzqwN4tRWlOk4l1j8KGmq9VSm87ZYvWqJyOVJKVXBw4UEYZhFtkWbGLkLZMKehJJDnZFb878ioSJPSG2OOAoteU53bQUnp6pQDisN9mX+4hC0ubCeu9EeqKzPp2pBa5OJ7mNq8U6142b7zyv7CwBmbGbapARxhdcoJZXahag2ZtD/pKMKeJKmb0SprXwow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA1PR11MB6516.namprd11.prod.outlook.com (2603:10b6:208:3a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Mon, 9 Oct
 2023 13:08:35 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 13:08:35 +0000
Date: Mon, 9 Oct 2023 15:08:26 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Message-ID: <ZSP7SsqjuPVoDPHz@fdugast-desk.home>
References: <20230926125540.7-1-francois.dugast@intel.com>
 <20230926125540.7-28-francois.dugast@intel.com>
 <f749c938c60f7b6a9cfda34846c457aafe400150.camel@intel.com>
 <ZRRgt81Ekx0tNk3e@intel.com>
 <30f2ed3daceb731b579938b87abdc0d16f182d10.camel@intel.com>
 <a3b880a3-555d-540a-0f10-4f2a7c017dec@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a3b880a3-555d-540a-0f10-4f2a7c017dec@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR4P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::8) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA1PR11MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: b9dd1aa3-83c8-4e96-5cfe-08dbc8c8d85a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3wt0tYY0bWh2JBsuhc3K5u0Ymo3iwlDDOPnKr2UKTan0rd7w4XAkTeR00AV8UbWTQ1eRw4YVvjaiTn+1BN2jnlPX8jskNv/znWrvbEMK9XeEel/Fy5BHf5gcgaMje4KmPaZreIgEvT5Ls0YMEQU3cp+yMPKDizqA3rJ33UmjTqG4ZC4/aX2ETLXIEkrzHerNLeQSFtY6JlpXdZRmlpqJ1Odtc+d+nqP1g/XsbI3TzlszHb8yEHPsj/GZerXZ7S1Tk94+hUZUs6VxeSRU11n8S9m1zYlclqfR0qJhnnXXFgR5os0M7IRxPtDBGvPPGhNOf+OSlsc0KFgU+wQSLKTfbgyLOOf8LCSc7fv6j4I//yHiV+/ol4+iUAdiyfaVDZOukr/yl+3sFFf1NqBwujEp6iaf4YVl5NjRN+nHplYfR5GAQ56rybCDDR2VgRpILydoYQEUU5pXNo1bqpOcdgI9xOeBXZVdGSpgt58Vt9xhvIvcdgT6EXUJhzNDpem/8E+/YlKQum0Yf7Fv7OBQZc7vsjoCDA3Wru2CknBqrfjmM1+MXRpxuIiVxYkCsVLlrUx1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(66899024)(83380400001)(6666004)(36916002)(26005)(66556008)(66476007)(6636002)(54906003)(316002)(66946007)(8676002)(8936002)(6862004)(4326008)(5660300002)(41300700001)(44832011)(53546011)(6506007)(2906002)(6512007)(9686003)(6486002)(478600001)(36756003)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jf7WcRBbQ4dBE4ecL4mf35+kFENbybY4SvyhKHQRw/rjPOFP73FZz6fhtVZt?=
 =?us-ascii?Q?RRkUiy8poI+kWz8eKhAGpA36OCPxxCUCb3dxveZh1bkNhnS6kWEuGqEG6mx6?=
 =?us-ascii?Q?GlKKtfFXM8JaQGulTgwKs78JDxhbhU4YRh7lGcGFgL4JfiM8A3B4DRO23B2w?=
 =?us-ascii?Q?CH5I2D1Vkggjl2kpw8PfhWIpXoR1KhXO8na5fBAVxzHJI0+5Dmpg6ez2r6eV?=
 =?us-ascii?Q?zx3t137JfRIzDX+b5h8SJxn4QzsqoggI2HVsuGdwVPsI32IDPjG48jQre5fH?=
 =?us-ascii?Q?Xu0VS2GgDW/1JgmVCbHyGdah28JeZV1hG/iAqWr7EKvxhSSLKBqTZYQIfbpx?=
 =?us-ascii?Q?IqrRvkV++F/nsOtja8NEI78VzWnz5TJltE8sBJX4/ggnUoOFxzJqpXykayRT?=
 =?us-ascii?Q?AEmhIrutIADAZDv6u6AL1eI+vWcvk9XxdfwI1vhPnJm1z1oHNXi4b33OGVqZ?=
 =?us-ascii?Q?h7ZAokOhTxOJTwXAR5Xi5OlRozZec9hWlamzjun7eY9AF+fgGNXGnA4H/PqM?=
 =?us-ascii?Q?bO9i/ijpz9HrVlnj/PlgzkxWiTIKn+/pkj4x+PVgKWUg82daxXqYZBoZ5/yC?=
 =?us-ascii?Q?wjEgq2f1lTRwOQrwMTPzOr5Jx7rdfi2qXfMyCJjTGo0N5EvhJe8/O46BiuIg?=
 =?us-ascii?Q?oQqrG6T/vCT7D8zunYZQmEpyjKEayQCdB8Lg4em+xLI1quP9lV98OlPbMjqL?=
 =?us-ascii?Q?eURKHUwJGPC0016WKMTnXNrCCkAvtXfKHZzN9glQpsX/5T4aJIg2jWrOt5r8?=
 =?us-ascii?Q?+drPc9ufPiTgffQHMrA/AlNT8qPDnNy1B8/drkaEsT57iGf+7Lc5TROAEZK8?=
 =?us-ascii?Q?urXrAOWjDE7QXtu6Y/wPcsUUFrSim+loBGSMOLS6iW/v29s87ysQFt2BzQ3u?=
 =?us-ascii?Q?OMy4z0/8miaXG2xKdt2y1QjprgBEJBPJPZi+wALP/jeCU/OQS0fLTMaL0Zgl?=
 =?us-ascii?Q?8+XNMbE1ZZcav/hatyENFycynycxk6o/G5YKgpOVHIgtBIrR8RVHj0ZRlmDT?=
 =?us-ascii?Q?osW+tTxnGQmiqJbFRJMrgEjwlq4Gp6/HTQbOeTC8/i8KOZkbjjvRqZ9MnliT?=
 =?us-ascii?Q?gVVlaAyj4tcB9S1PcIFa7h6nVLVJxGHEkX6B4VZPU4gESnz7ycAUQtPCZBHI?=
 =?us-ascii?Q?wlr92Sbs+IZJDnB05vPUXPxrw4u4Ns0pvbSlwMDWG4gF/2Gcs/s1HMr6ziDn?=
 =?us-ascii?Q?7tMV44mEDEMjmwjRqKA9aKxptG2R7eNDxP87ighTx4TkPY91QqD1vxGWtfAX?=
 =?us-ascii?Q?rD5UQtIB3hM4UF4Bo5x11JfGI0bZdArFOxeQVPoL2l5UEIoRIqLywLUnibdz?=
 =?us-ascii?Q?h4BQNItg8gDXCaVbr38dUVnqX5Of+FBh6HP9glQwEMJ1hVMALYn14RcxoNvZ?=
 =?us-ascii?Q?ULTceG48ItY1rdklEJ8jsYG+G3NLl8y9RdHlNH+VVv8AkrXffYSJWs9XSLQP?=
 =?us-ascii?Q?P1Kl8Ma6N/V3/qwHeSY8+OV0pixqMpJ3q7pl977XqODdVpMvVAs92GrlbVZc?=
 =?us-ascii?Q?wDpj9anhVRmJhJhIqPICqJMA0HxTpTyzJrw+ywJofUdUq3BE3T8e6AUGRB+/?=
 =?us-ascii?Q?hM8g24O6ENccgw8ofiOWoO116ZYEG9xMbPbSEvGHgzIo14tRXW3F27qCxa5F?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9dd1aa3-83c8-4e96-5cfe-08dbc8c8d85a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 13:08:35.4438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUjO2KYNGRJggTGrwTV919TinHtJZrrITt4rYL8QUiDJcjM+zsxEGkhDHgLrHftHoh7TFD2monrAuGdXDeEjsney5w7O0k+J3zy0GY7weYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6516
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 27/30] drm/xe: Extend uAPI to query HuC
 micro-controler firmware version
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 05:48:07PM -0700, John Harrison wrote:
> On 9/27/2023 10:22, Souza, Jose wrote:
> > + John Harrison
> > 
> > On Wed, 2023-09-27 at 13:04 -0400, Rodrigo Vivi wrote:
> > > On Tue, Sep 26, 2023 at 04:46:36PM +0000, Souza, Jose wrote:
> > > > On Tue, 2023-09-26 at 12:55 +0000, Francois Dugast wrote:
> > > > > The infrastructure to query GuC firmware version is already in place. It
> > > > > is extended with a new micro-controller type to query the HuC firmware
> > > > > version. It can be used from user space to know if HuC is running.
> > > > > 
> > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > > ---
> > > > >   drivers/gpu/drm/xe/xe_query.c | 9 +++++++++
> > > > >   include/uapi/drm/xe_drm.h     | 1 +
> > > > >   2 files changed, 10 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > > > > index 7a0ffd9a654a..c250ca534bb9 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > > > @@ -530,6 +530,15 @@ query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
> > > > >   		resp.branch_ver = 0;
> > > > >   		break;
> > > > >   	}
> > > > > +	case XE_QUERY_UC_TYPE_HUC: {
> > > > > +		struct xe_huc *huc = &xe->tiles[0].primary_gt->uc.huc;
> > > > > +
> > > > > +		resp.major_ver = huc->fw.major_ver_found;
> > > > > +		resp.minor_ver = huc->fw.minor_ver_found;
> > > > > +		resp.patch_ver = huc->fw.patch_ver_found;
> > > > Have you confirmed that HuC will not have something like submission version like GuC have?
> > > Nah... GuC is the only complicated fw in our set of fw...
> HuC has no split interface. It is only ever accessed by the UMD from a batch
> buffer. The KMD has no dealings with the HuC beyond providing the firmware
> image to whatever entity does the loading (GuC or GSC according to
> platform). So no need to multiple interface versions.

Many thanks John for the explanations here and below.

Jose: with this, back to the original submission, it seems returning
just the firmware version for HuC is correct, right?

Francois

> 
> > > 
> > > > At least in GuC, when running in SRIOV mode the VFs will not have access to the actual GuC version, that is why it have submission version.
> > > > 
> > > > Not sure if providing a complete different firmware version from one kernel version to other would be considered a uAPI break...
> > > hmmm... but now what I'm asking myself is if we shouldn't move the guc one to
> > > have the current loaded firmware and create a special category for the
> > > submission version:
> > > 
> > > XE_QUERY_UC_TYPE_GUC
> > > XE_QUERY_UC_TYPE_GUC_SUBMISSION
> > > XE_QUERY_UC_TYPE_HUC
> > I don't think any UMD would fetch the actual GUC FW version and risk fail when running under SRIOV VF.
> > If needed we can map a submission version to a actual version...
> > 
> > > But to be really really honest, there's something really fishy on this
> > > submission version. Why the VF cannot read the running firmware and
> > > get the submission version from there?
> > Got this information from John, he can explain it better.
> Because the VF does not need to know the master version number.
> 
> Especially when you get in to VF migration and such. The VF could start
> executing with one back end GuC version but then be migrated to a system
> with a completely different back end GuC version. As long as the submission
> API is compatible then the VF doesn't care. However, the PF that is managing
> the GuC very definitely needs to know how to manage that specific GuC
> version. Even ignoring live migration, an end customer may have a specific
> OS image that they have validated and tested and want to run on some cloud
> server system. The cloud provider may need to update the GuC version to take
> security fixes. But the customer's image should not have to change as a
> result. The GuC update must be backwards compatible at the VF level even if
> it is backwards breaking at the PF level.
> 
> In short, the GuC presents two completely separate APIs. One for management
> that is only visible to the PF and one for clients/submission that is
> visible to the VF (and directly to the UMDs if we ever support direct
> submission, plus indirectly to the UMDs via bugs!). On native, the KMD sees
> everything so technically only one version is required for native. But for
> SRIOV, the two interfaces are totally separate. A VF KMD does not have
> access to the management interfaces and does not care what master version
> the GuC is. It only cares that the client interface matches what it knows
> about. Likewise a UMD. Therefore, we need two completely separate interface
> version numbers. And we need to be very careful that nothing uses the master
> version when it should be using the submission version. Otherwise, stuff
> will break when it starts to run in a VF.
> 
> Whether it is useful to return the master version via this query interface
> is debatable. There should be no functional requirement for it. Any UMD code
> should only care about the client interface/behaviour and so should only
> need the submission interface version number. Potentially we might want to
> report the master version to the end user via some control panel information
> tool thing. But that should be the only purpose for it.
> 
> John.
> 
> 
> > > > > +		resp.branch_ver = 0;
> > > > > +		break;
> > > > > +	}
> > > > >   	default:
> > > > >   		return -EINVAL;
> > > > >   	}
> > > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > > index 84091860c7d2..fe7e83a5bd3e 100644
> > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > @@ -478,6 +478,7 @@ struct drm_xe_query_topology_mask {
> > > > >   struct drm_xe_query_uc_fw_version {
> > > > >   	/** @uc: The micro-controller type to query firmware version */
> > > > >   #define XE_QUERY_UC_TYPE_GUC 0
> > > > > +#define XE_QUERY_UC_TYPE_HUC 1
> > > > >   	__u16 uc_type;
> > > > >   	/** @pad: MBZ */
> 

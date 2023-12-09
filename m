Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACEAC4167B
	for <intel-xe@archiver.kernel.org>; Sat,  9 Dec 2023 07:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D701710E176;
	Sat,  9 Dec 2023 07:22:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B250110E176
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Dec 2023 07:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702106562; x=1733642562;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VRW/5GmcNFoAtQWryqBZWoX0cq/1maxY3iOiS9ViuQM=;
 b=BfcLl6l1Gxc63IGJ6l3MDRQY4rpIWq5Yk17lCjy9pHNBA0lZdGC105x8
 2q11iGmtwrKEZBnabbb3LSvviogJKTnFSGgVQa3PJVZyUnp4f4FFBXWlT
 uynt+pUOfZ2EXjsekbKKrJ/rcfGO/Sw+ACg24OuXMfAm/J02HApDUNFdi
 8Xh9ruV8rkdijEWcFPzpVhAe4Oc33i78dNjHFbP/yg373EtRrigS+BYdF
 PapiFYCbfg3MB/7xaEEGwzKFLyPFGDv6m/t3jzvMDKCT32bDZLJz1WhEI
 O+O1ihLpKr6qJL3LpfmmA6xKMVAJKOqxWIpA+HYagOUILWhhwxszLGPzr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="391671289"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; d="scan'208";a="391671289"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 23:22:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="806638992"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; d="scan'208";a="806638992"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 23:22:41 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 23:22:40 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 23:22:40 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 23:22:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmOOU0fM2WeRuKDQXcJbxGhcWojAUCJOcnBotyEtUSKp9u6/vhmBAjy+rOqgd5DSOAOVciQp232YclhaYNjOGD9UScN7VjNhcDLWn+Jm+dPIkutsuOWzcvhEFO31rYZqIF5Zjvzd9JVOhf8nDqcFZkQSqoXeTv9vDLXAKmYBGhKs5RLWSK0dP5JuMla2C2wlvrHeHlQhtSmVB38OsekTxfYExQo5A6EFF4Ddfr+iachMxM/Z6nDNxje9XitiBSoXI9mOHUmbTr37PhHgFP47XPBf6kYm2lmteJdaNIjUr38MlGyNWd9hfzETJ1naAbede4qfSM7y6fgAnxHvtBqkxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCKIGsPSEv/lB+BZUb7xF4x4AA5+8GZ2dhDBEknP6HA=;
 b=SPPSNISc0/si4GySaEF9tMRU1jb7lPsIqdWGPaP5zuXAu8Ks+KUuFR76C6q6a4hu3Ym9eapTzkrTMM7gj5HnM/BJsDNaiygNWY1Rqy4GwiMoBDk9Isz44MNbdNSo5+gq3jnFClAlpnMTBMULbNA2mj/wlEKHnNZkYcSRSy854mNUfv6KuAyKdRdSsINI5ByOKtNQjJEchTwEglg87FBemKQ0p9WkenDwCahGBych/rW7mTlSDF+moTcVztp3HG8esD+7ZJeJW+XWgz4w6dHQWBeJgCI5yGauV7J8KjN8x+WcdO+w2sJlyWL0FH3ajVe6ciUpK4bnn5AroTbZS2ECjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SN7PR11MB6851.namprd11.prod.outlook.com (2603:10b6:806:2a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Sat, 9 Dec
 2023 07:22:39 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37%7]) with mapi id 15.20.7068.028; Sat, 9 Dec 2023
 07:22:39 +0000
Date: Sat, 9 Dec 2023 08:22:33 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: check mask in xe_wait_user_fence_ioctl()
Message-ID: <ZXQVubBJ3mP96AWs@fdugast-desk.home>
References: <20231208143427.7-1-francois.dugast@intel.com>
 <ZXMNT/GYt5sn56k+@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZXMNT/GYt5sn56k+@DUT025-TGLU.fm.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB9PR05CA0023.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::28) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SN7PR11MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c102871-9f5b-4e12-c824-08dbf8879fb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VHCIEhtqyM09Z/NDF2W756SmuCJnI6knXKArHo279ReezUbZ6IKj9XWVCuoLETtCZQOJObPaeChNHnuF1RC5cIsTyuWjSwv5IMIO4jo+Lt3eRc1RqWNbOHAwoYHExrjctwvLinUazDk17H3a3v+rk1jt0cakApu7ksFh2+0xN/52s7epPz0oQfAfQWZEZMBLtdk6ld/r2LPq9j8jmQIhvYASjsIIirwVJPUJ+q+0j2IXMyE4c1wxR5BSCIxWf4J60WNk0qdeFEwqL3BL6AJpszXE60ZHn06n1LXB3ORytN369fbfogF6mjBacjxfsmYTRZovJA48CfCsVaEs40J9U95K584R30AoP62whnRgGCvpiWgVZ07SrVV7KsoveCE+rpdsaGCDZg+C/3mdMsEd6mzkEScbbbC7EikYP6xLCk2sJosLlxNhlgMWa9QbVjSqIAHNmvaUrwHg/DL4VviY0Bqn25dZeabnUcwFFTNJoqn7/l7KrudeE0NNXo4voL9Ohc31DV3EAQiZnlnOuJ4EQ9+tWf5vtEUr6V4EAwcGpnmjv6HjY2D3TG0rFT1M7lW1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(136003)(366004)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(82960400001)(86362001)(6512007)(9686003)(8676002)(26005)(6862004)(4326008)(8936002)(38100700002)(6486002)(44832011)(6506007)(6666004)(66556008)(66476007)(66946007)(316002)(478600001)(6636002)(5660300002)(36916002)(2906002)(36756003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/pnQ4gtjN8vKgHFCkWJaOwQ4i3gToBqzA8vb0Hnz6qalM9iAKIFFlfCMG3jP?=
 =?us-ascii?Q?4n04DsJSSqdvV61GMheeksfg92KEYBBQhm/+zNQe0n2PA4KpuIOwPLE1lylJ?=
 =?us-ascii?Q?y8iv01Ug5ltvseCfQY4KK6ufUCput7IcuW6N25vYnzN52kVnkWxcKru7Lxsl?=
 =?us-ascii?Q?Q4w33KDOsXg4QEHjX5pUoMc3ewkM4+sgocuIvZ687XC7JCslqxIJx2yRTLWL?=
 =?us-ascii?Q?0kT2G8ircyO1PMnDRi5d+Uu+XU+qZokrtbL32S1cDZ9Cfy87Qdimft7fFCCh?=
 =?us-ascii?Q?RCr/+ePIPiXStRO/D0JCI+iCdFZrx1O6leBukQcfGXjb7/9rwOoD5x/aLgcA?=
 =?us-ascii?Q?KRjQFuhPj3oMUjP9vlcRshdk4ikQlusUs00HlZ+y5BHmc2N3Xg0MR/91F/0h?=
 =?us-ascii?Q?6DNHftQqZMP25Jq5+l8a1/A4UelXHp9db/4ossF1mj1MbOmOW+N5BukobRIW?=
 =?us-ascii?Q?pAmNZIVP1fYvxX9sUrtHhnW5PqO/5Imn0K+fszDMXnpGSJ4WwP4Jrtu9HZOm?=
 =?us-ascii?Q?pr6KkQ+IpMXU6/PKegCa0BUNtS3CprT4TlsFe/TnAmDeyIAWeXw1IvOH6bKx?=
 =?us-ascii?Q?tLfWVxHEsi4d0NpPDxp+u1f6wrox+CymT5bosCJIi1yQU14ZmwMus0VqiUiY?=
 =?us-ascii?Q?qbbc7SSYU0IA7ab3kgduRlV3gK5dCXggI/ZR4/Nzgiw5S9IFh5m33Bj7XuLa?=
 =?us-ascii?Q?v32mUTtxj9Fe/PXFAvYkOSO3S5/UZDVQo3NoiOjWJPcc1Nrbp94Cv5TOr4zW?=
 =?us-ascii?Q?kHloU4PXik99/SoYXT0nl3u9RZZaO4npxAGAZLCWAJpfsxqoyq9WH+HlHFb5?=
 =?us-ascii?Q?6ybeVdYhlGu/sqjVQNL+F7WvOzZmZqtPKhAAwMWAJGJdoFnaJEuLI5yKMrJf?=
 =?us-ascii?Q?h2IE4JHT+yXifMMdVrmrFG4pTUpRYmUK9KMZPbtCz7/doXH0JOTkdpi4WHDA?=
 =?us-ascii?Q?C0uCRZvEKk0hee6nEKNfWtMcc5YoO8EexhuBJimfO1OvG8rRoIbGCuzQSDu9?=
 =?us-ascii?Q?EWknhz9EzhJUWIaQyU+c040lYX9aPKpifW+HDVn4YHJepz2Q+DN8C9td6cqE?=
 =?us-ascii?Q?eS8X/K5x0fS2RdaxpYtXROoBr1AEOcxofN4L/s4Rys0r2tAkTkenjBgrRRED?=
 =?us-ascii?Q?xR92gbSrJ3U9HmGq45uE5j5jctOztI2MijxZq6KFRjlGLjcmp8lopoeljx3n?=
 =?us-ascii?Q?CiA2FluHh58KKJynFJOS76DOPIGfeZDOjNhvVhjoG4In+1jVnigyF85OE5r8?=
 =?us-ascii?Q?b9dSPIAlEe8fwqqpHHE07AzGafMB30yzz23kAz+8O87Ke2am3Y8I9Rbc1llr?=
 =?us-ascii?Q?MhEN1y2uyvjJCGSyqU24jl+ZJZeMCH7oscaGcDxO6gC9lE9ZQXLLPsgPeVtM?=
 =?us-ascii?Q?vNKmIUX37pmPiuo8R5Q1hXvxwyerVY3y4kT92fxHULF/TvAbmgBFVlTcPwEV?=
 =?us-ascii?Q?ruJrVqwNyt4G11Ott1MRGBJTVVb9VvqWk2bba4BgyT7B9tojYsOx3vcDlrSb?=
 =?us-ascii?Q?kDRKm9Jj2GA5zPOJaeY+/I1fPbAyos0yF0sGNpLzxDmIhxbFs4mqr6TFD9N1?=
 =?us-ascii?Q?5rANgwcgR93EplziZCkO04Ddz5RUo4qYogwNEMW63h67Wv3wFf/6pf23RgAg?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c102871-9f5b-4e12-c824-08dbf8879fb9
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2023 07:22:39.1022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4AZlDxXGYmAAZYl3HkNI/98r6ItnaDABeLhOvRjBpBd5JBiNIX8qDYf9WNrtjIncf7vdofLAYgNghUZz/S6WClMySGsqwAkDfx0Y+I4U06Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6851
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 08, 2023 at 12:34:23PM +0000, Matthew Brost wrote:
> On Fri, Dec 08, 2023 at 02:34:27PM +0000, Francois Dugast wrote:
> > Check the drm_xe_wait_user_fence mask is one of the allowed values
> > DRM_XE_UFENCE_WAIT_MASK_* provided in xe_drm.h.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_wait_user_fence.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > index 4d5c2555ce41..a73139fe3fe0 100644
> > --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > @@ -164,6 +164,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
> >  	if (XE_IOCTL_DBG(xe, args->num_engines > XE_HW_ENGINE_MAX_INSTANCE))
> >  		return -EINVAL;
> >  
> > +	if (XE_IOCTL_DBG(xe, args->mask != DRM_XE_UFENCE_WAIT_MASK_U8 &&
> > +			 args->mask != DRM_XE_UFENCE_WAIT_MASK_U16 &&
> > +			 args->mask != DRM_XE_UFENCE_WAIT_MASK_U32 &&
> > +			 args->mask != DRM_XE_UFENCE_WAIT_MASK_U64))
> > +		return -EINVAL;
> > +
> 
> Why do we need this check? Looking at do_compare() I believe any mask
> value actually works. Would it be better to just delete
> DRM_XE_UFENCE_WAIT_MASK* from the uAPI?

Sure let's do this.

> 
> Matt
> 
> >  	if (!no_engines) {
> >  		err = copy_from_user(eci, user_eci,
> >  				     sizeof(struct drm_xe_engine_class_instance) *
> > -- 
> > 2.34.1
> > 

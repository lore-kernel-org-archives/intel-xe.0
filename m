Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01166C54E64
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 15:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB50610F369;
	Thu, 28 Mar 2024 15:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LicZ859P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6178E10F369
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711639142; x=1743175142;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GF10DPMeyDa9y/jGQYtnt88k5zEGNiNg2Q9WBJPDuv4=;
 b=LicZ859PcSUM0297h/5m6d6E6GGrDNzJ2spVRQDE4jb/iSvr1mR9+LWE
 4NCa9Yl45TWgteDX4lbSwwhw91rsbu1uyimo/Mb7xMT4AbIrpYIWwfssw
 tBfBTAk2Y0FCRtxNoWK0sbI0zhAFloxKAYPz+lDxk+icaHeNzO62JKccS
 AQcmMawTMf2X9+jkSgPcjlwqWrrB2WL8SPG5ldorxikL70qrw5Myi1RHm
 yvSOx4uysyHNsX3OeBkxs6mfjpVXMMejwVDjpovZOZKlNKqCrWqjh6/+z
 t9UyAD9dT2goU+RoaRzI4jEnDLXxBRXl35qwb80ezDXKsXxXolMyL+Po4 Q==;
X-CSE-ConnectionGUID: G87AJy+MREOf1OMBcKoc0g==
X-CSE-MsgGUID: 8T8tNMfPRVi9hV3cwhBCOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="17430438"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="17430438"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 08:19:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="54127995"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 08:19:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 08:19:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 08:19:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 08:19:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgKmVz0Uoys4OyZb76hoAWnLwx7NEM1JW84tjzPi43GROO6un/zmBl7sLGldLRqj6DRBT03ERGxX+ZGDCwwKKr6AVA3tiAFCM2/dStvC+FW4J3wc8NwAgCl2bp/wTx7U9YfxpOmBEUhIr1B+SZnjstJEA+8j/8HisfbigBHTrbCGyDzCIgMNV+BgbwuA+6BDF3Mou9yZplN2d4y+vdKZM87Z2BFBhVpxd1U+S8kBUGuU43gYy4jposCZDxHKUqNF3cRzHw2Vlf5uN1ZFoPzBKZHqczJbiJ5c/KwMmFvsihgHHur1hw0GA1goRBpHwJ9nZIs4CVsP1sbSAK+XGkZaPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yz1wT2pl3mvQdZi459Dacyri3OwfpKO7UNDzJyoSg4c=;
 b=iKJOhuCswt7S+uqGeOKlfhTe81BiDhnuK1sj8l0VFx6jnS+PfolbexEC+TT6WkrP0P5Pa6zj1P0PY/qB4lC04xUov8NDmur6r8kmsf0FIOFERuSXPKjziQDeZeFym6dK67g3OI0GIx39dWGUiCZsOX2CGuI1O2zDtpz3VdMJ+KeF86cHhJ9U3W2CxS82iR45fOVTTMS7dkSoVhXilT6lg7hlpj1IYi4jfWt91ebsW7vj4xPbGhrt7phV+UH+I3VHL0fsduWjuy71VAwfZ9JYA7VCaTHvnTK+wYkGN7R0gsCPM/4BrZU9EZzCGGMRZlu2BDBpZky15XntMKYG+f5HRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 15:18:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 15:18:58 +0000
Date: Thu, 28 Mar 2024 11:18:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, <ogabbay@kernel.org>,
 <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe: Store pointer to struct xe_gt in gt/ debugfs
 directory
Message-ID: <ZgWKXMwEio6ACp_b@intel.com>
References: <20240214115756.1525-1-michal.wajdeczko@intel.com>
 <20240214115756.1525-2-michal.wajdeczko@intel.com>
 <ZgGuAzMpdheUTPke@intel.com>
 <5a8f32d8-1321-4f71-ac8e-8e55455e59ad@intel.com>
 <bf4tfv7kpysuwcftwfk3onyckah6leq55wq7tiauuuvmu6hcfo@hkamegqnrwbw>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf4tfv7kpysuwcftwfk3onyckah6leq55wq7tiauuuvmu6hcfo@hkamegqnrwbw>
X-ClientProxiedBy: BY5PR16CA0018.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: 830b404f-0a83-43eb-e9b7-08dc4f3a63a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cHc0HzWL4YH3vE1lCWa+rRY5Nm4EDtALma8nQFkE1xJzNE2/GNGdQ87HhBArg71fmUrR7giZnr52oEsGpt9lMLAPte8+EdbhsdRO4TDT3OrIaBshin/SE44kvQNW5hgJTlPuPJL7YCpNSqc+JTt2/J4nvBtbkAQVF6MSmGLEjtzzXrmqFLfteqjpD/2fIRRhl1OQ0mFHGnv/jqF1ZMcu+yYF35J+Xt24zzB4U+SjLOqTcQ5/TMsvTheFsnm7xeXNIKL5iTI0bb/EMdHbI6dEqeryZNT9oy5l4DMLRg2j6VRX0O8k/U5z7XJ5k1manU+qBldcjjH69gFydTb2Vw2VDLMIoPNnnOqF91erV2lnbjBRorW3zs/Jkkp2M+/qhgkfEJTxCFsULIM5Q7kq0n1tflg8gyC+SXJhqh7GR5nFQT8yC4CiNJ72AaSpOaVWUn9XjObJFRdkU+hNQO4kgSPWG/2eSB18rLdHcxYAaaM2E11nMuLbQax7+ialbCDIezJVbvnin2jXI0Be+hEUN7MeNu8fWEyptST2Nk+xdVrWF5T3CCAAYc0YqrztVkOS4r6dlHA1xg+sqdd2+QZPhmPxzWX9efsm0HVgleg6gflbYbLnCAO+cXVIfgkbauNMKMd3wTS5bFlJRxz5usGUNd6S6KAtkgIv1M1gtTkV9G6y8Jk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nc9KNws+XZBZMz6GzdoDeB46Q8pXpE58gqCg4LxmhfKYKJqtnpKaGuqfkW?=
 =?iso-8859-1?Q?oxgQWF3uFHR2m6ONZ7g/Zso+aMDpH8QUs9fRVv2jyMLNqR4AXEifc8IxYB?=
 =?iso-8859-1?Q?uD+3Lbj2key5O6pQqe7MCSXQcabC41gtva+crYeZJFzcuVqj2ZaXf+LuUj?=
 =?iso-8859-1?Q?hAhY4oHln1K9GDmCNOGpO+9xz/opV6FzjcQrTQqQQ+PJuLBvInte561Q4B?=
 =?iso-8859-1?Q?cGUwGJokqbIgvqJzyfCa1P3OJTNPlvPDK9IFcqnH0s7jhsjCFv3mq5c10p?=
 =?iso-8859-1?Q?PqEPeHg+1RevUh+uDsonPPmCORttGUrhtt23hjTnKZYcQU4HiIrQOVhfvO?=
 =?iso-8859-1?Q?IuRGqqfYbFogKHVKFhjcksSEiQXv3ryoBlBeGEjHN5VZ50SVcIzw/4K1xI?=
 =?iso-8859-1?Q?tPhhvVEFfficPEX6t4Y7hQJYhmcXFbZyPlweg8BQ0Ey8+YESbKAltlpmvk?=
 =?iso-8859-1?Q?kp62zcBWqiYzQT/EHdM6AA4azAsvkVBXpJGRr2WWfnBuK+Exd4nThJWT64?=
 =?iso-8859-1?Q?b7b2c7YTzD4Dfl0HYrjdphG/u3diD0SJ3hv7WP5uISUhmn4jioPWyvKJI1?=
 =?iso-8859-1?Q?GbQr5VYJJL8VuwAYIpIQGGcWXaaE23PtFRSNExwfrrJHeb3Aiq5mQIeKKU?=
 =?iso-8859-1?Q?ImV4pay5EpfBOKhyaffB0TQ3tomE2SIxt4MnQZO6cKJ3ChyzrPugl1MGY4?=
 =?iso-8859-1?Q?NQNaBCOoKwHWdETv+VIy3SiGO4EwjRiFep8IBohEAC2iTxChUHKlyyhw37?=
 =?iso-8859-1?Q?Nn5G+f+jdedOYdu3DB8P1leD3DYCO4eKmcYimCJS8qZF7p6Y+JMruRmY7o?=
 =?iso-8859-1?Q?AzDQlOrNj3gTvXRF8eskaEeBU3uYhOzz/bKLZjA26zPzbD6ZE88eA2dzLR?=
 =?iso-8859-1?Q?XnHxE6dROrxX42XXcpqC3mM6GRqIZeczNGSK1cvgXJRAddClqD0EO2+SRS?=
 =?iso-8859-1?Q?CqvoO+9+Fh6j3mEyV+0O4hideGGcULS2KhB+lC0wPkJkAHgU6wU6H7Lue4?=
 =?iso-8859-1?Q?eRwGJnz28M4rPNzGBHBTAiv17gPYYZWpv/HHvwW3/VJp3NnaEqeOYPXpij?=
 =?iso-8859-1?Q?wFxeapX4fKmcX57ZdGq6N+3BHBaDOLWXC0QzhTDlffOcG3HnF5mdbWWPyl?=
 =?iso-8859-1?Q?059lc2v2E4+w/bQwXUTYlakmowGh1pjGcDcf5Q0OrDP7vud+gUDDqlaAmU?=
 =?iso-8859-1?Q?EPN6PiSZRq1pKoAAoGgqiY3FbsHzjTcMik6EBgwEbKT7/fPvwuqdGL1/+a?=
 =?iso-8859-1?Q?KCoIC9EDb1Brs/+Rmg43uRyITslYlkEJdrVTMRQMZwokbaIyCKEb3NMEzA?=
 =?iso-8859-1?Q?WnzdMlFhGqzY+RLnblIBAz5nkvY7DWZ8TgAF++VsAWq4wE6jifoTA8v/Zk?=
 =?iso-8859-1?Q?7dF66AA8vlmM1QabgAMW8DcKMnqR7xwMPQCyfQN7bLPX4RJVCc4vTA80fJ?=
 =?iso-8859-1?Q?gO2WLXrBRkZkW0Tc54Zf/CpT45ZAZe/z87VzGFr5f6i0MZeb+fTwzX6HSa?=
 =?iso-8859-1?Q?Husa/rJ1uUUXtatmB9heOv1b9pdb38w8SKEfPQBHXd8Ta5ZuU0LqfW3Ck+?=
 =?iso-8859-1?Q?Q/Cw1sa9OAoynSGI59xvUMCcSmk8sBAp1wigDPxPRPfrwoho96pDz6mMov?=
 =?iso-8859-1?Q?t/8JNoeoeVCyBKzRjiO4KKJBe+X1H3HOTaGdw4AJFOMT1W6VcP0lXntw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 830b404f-0a83-43eb-e9b7-08dc4f3a63a3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 15:18:58.2238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mc4FGbMdtyTqVQm91kYVUXilSTbTQ3I3d1t+8yhd2F8/WNaSZL3ZyoX4evqeiR+tbaZ/S13R8L6kI2AH6rQR7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6909
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

On Wed, Mar 27, 2024 at 06:20:22PM -0500, Lucas De Marchi wrote:
> On Mon, Mar 25, 2024 at 06:34:01PM +0100, Michal Wajdeczko wrote:
> > 
> > 
> > On 25.03.2024 18:01, Rodrigo Vivi wrote:
> > > On Wed, Feb 14, 2024 at 12:57:54PM +0100, Michal Wajdeczko wrote:
> > > > Attributes added under 'gt/' directories may wish to use that
> > > > in case they can't obtain it from elsewhere.
> > > > 
> > > > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_gt_debugfs.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > > index c4b67cf09f8f..207b992f1240 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > > @@ -225,6 +225,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
> > > >  		return;
> > > >  	}
> > > > 
> > > > +	/* other attributes may use parent->d_inode->i_private */
> > > 
> > > what did you mean with this comment?
> > > if others are using, what would be the risks?
> > > is this a good thing? is this a bad thing?
> > 
> > maybe better wording should be:
> > 
> > /*
> > * Store the xe_gt pointer as private data of the gt/ directory node
> > * so other GT specific attributes under that directory may refer to
> > * it by looking at its parent node private data.
> > */
> > 
> > > 
> > > > +	root->d_inode->i_private = gt;
> > > 
> > > At first I thought this was intrusive, but then the following
> > > patches made me realize that we are already being intrusive
> > > when disrespecting the data:
> > > 
> > > include/drm/drm_debugfs.h
> > > struct drm_debugfs_info
> > > /** @data: Driver-private data, should not be device-specific. */
> > > 
> > > 
> > > So it looks that we do need something else.
> > > 
> > > Looking the i_private that you pointed out seems an alternative
> > > 
> > > include/linux/fs.h
> > > struct inode {
> > > void                    *i_private; /* fs or device private pointer */
> > > 
> > > it is a 'device' pointer rather then a 'driver', but I'm still confident
> > > that it is the right one to use.
> > 
> > GT aka xe_gt is more a device than a driver, no ?
> > 
> > > 
> > > It looks like the debugfs_create_file functions would override that
> > > anyway with the data. Also other places in the fs code where this is
> > > used for other checks.
> > 
> > the drm_debugfs will use i_private only on nodes that represent
> > individual attributes, it will not touch the parent node i_private
> > (which is our gt/ directory - and this where we set pointer to xe_gt)
> 
> I completely agree with this. It seems nice to be able to easily
> retrieve xe_gt. I´d just double check the lifecycle if we may not end up
> freeing something that's being used during unbind.
> 
> I can't do a thorough review of this and the other patches right now,
> but ack on the approach in this patch.
> 
> 
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

for the series:
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> 
> Lucas De Marchi

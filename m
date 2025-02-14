Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D072C021A4
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 15:11:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BFF10E497;
	Fri, 14 Feb 2025 15:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Av+ajZOA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A761210E497
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 15:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739545899; x=1771081899;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2416vhRjBGJx+a9iJTK5O2FX/fNj7OJEH570oaqmS7E=;
 b=Av+ajZOAohqANJAyXYDWJ3vzs7Lj+V514rD5rwBSP5Yog42RcWLuJB1t
 jULajV2BfHMKD6XLel07iV9/3iDqlbs6rCzN5PAMYZcOLSiJNg2megLcK
 uS0lrvbcgRp0qCFAnBAicVbn4X/FUb997TvadFbhiyqJuQYP4YXs1EHCS
 n/WGlQ9JpGY159+uO9h4g0jxeAu1fnZ4u3IVwnC8bBPlneizOS1IxcxCz
 +Az30JRei0CfrOg0qiqIiiA+FiaH/MBL2F3p2axyw2Xsd+qht+juFgnIo
 tsvxnTovVTDCsB+IvQ2a8Y4yA79BEe8wuqxX3EA9We8h5wUR+7zIZxbib g==;
X-CSE-ConnectionGUID: hcaeafinSYyMUvZ5Yk2fHA==
X-CSE-MsgGUID: KGuqaa8OQFmePHTG35qGrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="44226299"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="44226299"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 07:11:38 -0800
X-CSE-ConnectionGUID: lSIuldM9R6SJ27cqfapoTQ==
X-CSE-MsgGUID: OSDCecKTREq7A8JZkws+kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="144337485"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 07:11:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Feb 2025 07:11:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 07:11:37 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 07:11:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3RECvr8k7sr9kbKt3LLKPdH6QWt0Yg9gzGC8SJi+qrmSCaFnWE2FbsddB714Irh7KDHoGp0vQj9ua+cjz8y6oBvTIb+wb+MtD/hR4Mh6zPqXq1tMVHnW6CXJiiM9ZoKa9dUCOUb/8NQLFnGMW7+F7ha83/6rAdiU5vTrlX02EnuEAOD6t/ikhxFA16umFB/o4BKuPRp607cPNeyg+jhLRBEvrxZbEMeElom9mK7/MTlFRU5qePWePypiZN298fxuy9dfHDWXb9ei/2HJa8Q62eUPXJU6xX1AbE1R4lAtNHGdGD1pS5wJXfRFTxz00piGAQzMGDaqEWvPgvnYcxEfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gy3EyJreLgiFRYuwrCDB7E7dfv0wO/3b32zA7TDP/7s=;
 b=P/XloH1fcRiPuv/9bLJjN/mRgc1BuhxiedUzIk4ZR7I/irqtKKXN1+x7sR+jIxoAn/EdhvIuB9zBHpZIPwhhsRh49eTlvmWEHjOUmBqG1JQum1MjKBDiXDoeck7pazRR3nHiBEsDFex48t2bU8OEKjd9fjq557a7cxbuP91Rgo8OXmHS3DmbfMJbXx4HPIBeRlkqx8s6LJAPpuNsipDsO6tgoeHRLxkgVATToiwZK7MLWK2CAfn8ttnJCVRvTalI7QBZLgjng8IpHTTw+YhHmApS/IVNMEiJJwzNAIFks6b6H+BJR0VtMaaPiE/0ZtZz/vdfgXxPBD+rf/zx4qTHLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Fri, 14 Feb
 2025 15:10:54 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Fri, 14 Feb 2025
 15:10:54 +0000
Date: Fri, 14 Feb 2025 10:10:51 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/debugfs: Add missing xe_pm_runtime_put in
 wedge_mode_set
Message-ID: <Z69c-8hjYzYsNATT@intel.com>
References: <20250213230322.1180621-1-shuicheng.lin@intel.com>
 <Z65-tkdKpqzH2gMg@intel.com>
 <DM4PR11MB5456C2C99492FD1EEF5C12DAEAFE2@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB5456C2C99492FD1EEF5C12DAEAFE2@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0293.namprd04.prod.outlook.com
 (2603:10b6:303:89::28) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|CO1PR11MB4819:EE_
X-MS-Office365-Filtering-Correlation-Id: d0868638-1ec2-4715-db45-08dd4d09c6b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jaMnfr9sxdRqLE3+XyBkirku4zV++4/I6zc1zM7z02JE6qWjIlrpf2a/qiRH?=
 =?us-ascii?Q?SfcwBkdYSkDcHlW2ebMRXK6vU/u+4YnGtpSOeVCyOK1o5P662u+3LcfWqCXt?=
 =?us-ascii?Q?phe66Q/JSz5WGdBRcRqceGTl37bejluhLo997uqp76xSzfFM8ZKG2Y68A/01?=
 =?us-ascii?Q?jpfJmex9Sd3Kp09N1XQ5ZPF9H4IrdTljKYX+iD6T0RWxDaM34NTcb/R58Ib2?=
 =?us-ascii?Q?8D7o8ptCHsgmrOHuQSAm8aDvCiDIIu3rcEeUGqbJ4549tKvQurKNckb92kLs?=
 =?us-ascii?Q?d2hmuzImSeTtFmPXBmOSEj1GnVYHwtBPFXBwkovT6DsUb/xXwcX7ZtAg1vBz?=
 =?us-ascii?Q?HSMQNzVVst57qJBMcvsKd6yD9fScsEpKUjtMFhWbPgF2OB/mVu4uD4KwB/rF?=
 =?us-ascii?Q?q0NF8boHcL1PYwsiJ6upYjcgRJOkkHFt2TrIrqetzUROrMxF2a65AhKw48bP?=
 =?us-ascii?Q?6gQ9c3UcNSOmb2EmMN2rheR2pjs7OE4lCmdY3HxaJFVvF6Jl/O/OKXAU2Y3O?=
 =?us-ascii?Q?a1s0Oer1C/jMolxzrriZXeIFspzGxuW9bWLs+M4+hL+5Z2f/fxSEHdjL6+ya?=
 =?us-ascii?Q?sRiQqFvoxDpgpFCQ17nJdxqJIN05G1CBiAyUSdn/d57Wr2X57l5fB3magl0G?=
 =?us-ascii?Q?+uYAoW272TxMKcctW1pMQ60VqGNFtqcg5T0DEH8hkXmqG5JJ/PAV8wnxTPsy?=
 =?us-ascii?Q?QYeVgUyBIdDQjhScvW8iqH6yTULKudSi7WEE2uoHwKX/WkGlOX5loyGJxPGA?=
 =?us-ascii?Q?uLK3jawzUV04gpM5lt4jbkuJeumHQhx1xvTnzpiohttxrHCl1Z9WPIHDWf5r?=
 =?us-ascii?Q?HuK8+bnjtPFqwAcEHw/isr3H39JLWlaI9niKEfACWnrlEcXjzszIe5o6/EOO?=
 =?us-ascii?Q?2se4CXWrL5S+wJDtJNAM5uWzJgZMsqhoyIm5fyt2wVQ8ybS0iJScDXLP5i/I?=
 =?us-ascii?Q?xmz5BIfTYai68PqgAtFuV56nxYStLu+OtK88iDZLg7DWizv6cwWz0rEX8Fb0?=
 =?us-ascii?Q?fysbTWXpO/NVpZyIfSad37Z0XeWKCvHNDYfu9Gt4tyUsT4/VPHjz4Y0Oahhn?=
 =?us-ascii?Q?uXpakcU7o07Rg9mksxqZIhBfQTb3yhnuhg4njRKxWDsIKeGnA4Rx63lZ4LwP?=
 =?us-ascii?Q?OUDHHD6sNVXEFpmGOzkSmt48WGpsG4E1FpjiyfcK5+1CUqB74vld5tJD+M3q?=
 =?us-ascii?Q?83DXzBgyMDW2It3SjEkFNeOdxjxVzyqc+awihtef6cNEA0rZ6XVsnz87LaBP?=
 =?us-ascii?Q?hP+dsehyh5XkZ8yfCxEuH2ZoTCXK6XLhhJZTrYwUJlXLjOiMGg6BqYuR0w4G?=
 =?us-ascii?Q?xI4iMOzJwLcgkbwUwRpstuTKDJAWS3CNnTrBJgsw0NwPTpbAk9Ybw14aV6v5?=
 =?us-ascii?Q?ndKI06qfvgp4u5leB7Gj3xN534SJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IJQaQ+FkGMzHvII1FKuIVsr4Yf5Bivc+l7DYgsGbTb4QlcGjdPXRlkvAssI1?=
 =?us-ascii?Q?5lh80QmDCrsVH1wtXChHm705rEpe5k5gk6X697d4lPhSa2V+BLuA6NhZRfH/?=
 =?us-ascii?Q?KYI+c6C9vWWVmu+OwlD8CNaNrPuv4GXqjJa3B4cfDdQII9csON1F8yop2Gii?=
 =?us-ascii?Q?ed1NIFqtR7kLr9Pd+C2k4UwqiGu6y/YJoEHjhZIx9u1MOwFItb0OuoXDCyoh?=
 =?us-ascii?Q?wMxyUUGhBwuudR1xcDIrJRclpeL0CvrJ3Z7YOAmJZrblRYM/1VL3k1EogqTz?=
 =?us-ascii?Q?OSiYpGDeyQGBminYrU+KLveG1EJf1Vu3spU4VzSH3sSRrwFWwox88pRAzzwA?=
 =?us-ascii?Q?K9MV//LBN+FA2dvwXUby2jiJP/bt217O5MnkByMyq8PkPc0zSrnRBGt3mHEU?=
 =?us-ascii?Q?NH3cfq8ewHmobTRf0zw+7R6qa820OSV/uUAwhgHcIkskHBU4eoUtHhUDikIa?=
 =?us-ascii?Q?8YLUB8LOVvSSEW3+ARTMnmVMqXedLOZkFYwIyieFQ4MBKJNeM+HmBLuEUjzv?=
 =?us-ascii?Q?yaMQkqFObI/huVQ2tr7FuPpuLKmeiM1OyYQOzq9oG4KsrjS0kObqS16r8z6K?=
 =?us-ascii?Q?jhG4txaFOhMTemJ55RDxL51HoxLng+74ywYcnUJ0vykt6ggxKWO/Vf8AijcI?=
 =?us-ascii?Q?K8vKJb/jL8yAhRoa6fS0nuXgtHH+023zfNVR6WqK14yUmBwzGC74y93ZmArK?=
 =?us-ascii?Q?fbnOB+uIeEjGDZgTQsprhiUoHZTIO+FEQxK9zF0vhKKBBNH4e/BnLId2Md1d?=
 =?us-ascii?Q?LRQFIwQcwt5vNk/1j9rFjam7CYKsszVPLNa7JjjxHruESH5G/p/du3utMzwN?=
 =?us-ascii?Q?hsQFHzKz6F6ByS7y4zJ671TFD5f60UU6GhqtqBY5qt8EohA0yvwLJugm4V5B?=
 =?us-ascii?Q?bAkhIVj+zH0qRdDC60uIuFtQhbR2VoVKqSG5rjiL4EuctKMk6mdXdKWUuA57?=
 =?us-ascii?Q?H1JH2PXEmnnis1mBykI2HtyEtATC4FxxqYd72Zp+S4H6Jl0JmoID5qmeVR3t?=
 =?us-ascii?Q?Gj5ywcYfR29rNfXQ5OPdOCEiHrQJZNj23bWDD1d6WvsTmQueP7tPd4+hYOay?=
 =?us-ascii?Q?X+1vEyYOLWfBLXpPinOYiO0jYZeaT+J9lk1HM9pCU7pbUIHnJu0/YDEpXDJX?=
 =?us-ascii?Q?g2ryzt2qdNaFZ0CutHPoaOSHuGIy6Xi4CNgv/gnl9yn5aVTrLmY8vyoA5qj6?=
 =?us-ascii?Q?/oDpy4KRWshbH7garSctqpst3xQyTwm20SKdmJbhdh2j8BHLIppI3isA1dd9?=
 =?us-ascii?Q?ONqb3iHokURdBkH+y47S+so07uMsjqMoxgPmwJH2GmKn80UGR1PVM7Ydf4l+?=
 =?us-ascii?Q?2N8RLGecFNpDI8yXFbXFgL+cphkLknbX7M5u6TM1OIJG70EVGHoZY6eh4kKD?=
 =?us-ascii?Q?pHDnDfBXxw0Thv5j2MhRQiHmiJZRMfz3JMVOolGXjuRIvDK9kjFglx2djMm6?=
 =?us-ascii?Q?GbHa5Ry8l2DtXsTxQfESsKYbnjLqENlihu487HVu0QexPw3ELGHP7RdWPvBw?=
 =?us-ascii?Q?ecoQnCt64W09u/cQJChcV0Af2GyLtCiaKYZlLKDirzKN0RiI7YZprOVaMt5R?=
 =?us-ascii?Q?vBZX22SqKx0grfLeS8G5WrH6b1NSrmE9vcogdPzaxdv576pqo9plbwCgFYlF?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0868638-1ec2-4715-db45-08dd4d09c6b6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 15:10:54.3145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: odhq6fKcEcLDSBpNkP5QUXVi8jeq/CbwG8TTmSzWrUg5UyDGwn+Vx5TEjVTyzB/Zl2j03H1cCIMzT0PGmrEZUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
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

On Fri, Feb 14, 2025 at 02:12:58AM +0000, Lin, Shuicheng wrote:
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Thursday, February 13, 2025 3:23 PM
> > To: Lin, Shuicheng <shuicheng.lin@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [PATCH] drm/xe/debugfs: Add missing xe_pm_runtime_put in
> > wedge_mode_set
> > 
> > On Thu, Feb 13, 2025 at 11:03:22PM +0000, Shuicheng Lin wrote:
> > > xe_pm_runtime_put is missed in the failure path.
> > >
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_debugfs.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> > > b/drivers/gpu/drm/xe/xe_debugfs.c index 56cb3788e752..761e00cb6437
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > > @@ -176,6 +176,7 @@ static ssize_t wedged_mode_set(struct file *f, const
> > char __user *ubuf,
> > >  		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt-
> > >uc.guc.ads);
> > >  		if (ret) {
> > >  			xe_gt_err(gt, "Failed to update GuC ADS scheduler
> > policy. GuC may
> > > still cause engine reset even with wedged_mode=2\n");
> > > +			xe_pm_runtime_put(xe);
> > 
> > to ensure a git-grep alignment in the balance we try to use goto in cases like
> > this...
> > 
> > so it would be something like
> > 
> > ssize_t ret = size;
> > 
> > - return -EIO;
> > + ret = -EIO;
> > + goto out;
> > 
> > 
> > +out
> > xe_pm_runtime_put(xe);
> > 
> > - return size;
> > + return ret;
> 
> The ret value is changed to 0 with " ret = kstrtouint_from_user(ubuf, size, 0, &wedged_mode); ".
> So I have to set "ret=size;" before the "for_each_gt" loop.

Well, the kstrtouint_from_user is the actual size we want to return
anyway, so you shouldn't need to reset the ret.

if there was an error there it would had returned.

> It makes me prefer to go with this one. What is your idea about it?

Anyway, I respect your choice there. I just pushed the patch to drm-xe-next.
Thanks for the fix.

> Thanks.
> 
> > 
> > But well, the code itself is right and better to protect.
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > just let me know if you are taking the goto approach or if I should get this one
> > merged.
> > 
> > Thanks,
> > Rodrigo.
> > 
> > >  			return -EIO;
> > >  		}
> > >  	}
> > > --
> > > 2.25.1
> > >

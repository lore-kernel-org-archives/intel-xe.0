Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0FDC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 18:45:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E0F10FE7A;
	Mon, 29 Apr 2024 18:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QgC8oMSg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB54410FE7A
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 18:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714416338; x=1745952338;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ageJoZJCuy/Q2zTMFW+d7+aq0OhfbIWrv9qgqEkyyds=;
 b=QgC8oMSgVi4k2l8wESLji8Werf0tmNbdi9erESGkVXuvLvW/hI0AvP5D
 rrsd/uTr8pXSbX4UtutVmKHtuS8chyhmkd9JJSRthuRc045Jaf+G1pad+
 r3fKoQOxu2awK+t9PqpeNWSDmjlTK2EJU2w50Pn5AHM3tzag1gLRvOgGd
 OoESVSxmbFJI6LEpFBGsvg6uh5sCyMt4REODbClJP16VfApb4S6FyYxF7
 jHIktXS06qItMHmdY1R4uKwKB+phv9h4ezwcPTk0UDoFO6IzEkoBrosp6
 gJU5MtWDBHpebLFD0PrEvbc/FbcOT4hvrS1yXrty74qBK/rmxbTaqhuP6 Q==;
X-CSE-ConnectionGUID: pkvt1OzCRmGsA7inldrZhw==
X-CSE-MsgGUID: 5q/4d6XKRbCHl/sCow++FQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9973017"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="9973017"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 11:45:37 -0700
X-CSE-ConnectionGUID: okdy37LgQ4KCT4hAqB9www==
X-CSE-MsgGUID: JXydi72iQYevVmRmV0caAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="30997200"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 11:45:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 11:45:36 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 11:45:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 11:45:36 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 11:45:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZwqf8qH/LvfdRx3lWKL9FVZNHic4x1sDh/1MRmsQi3vRssoyjdUWVCi0F6Gzsf795EwBs4fy96YdbT0VP2xgDKjJQHGJI+8CQWokg3cEEOFDCygS27F/qLCikr6Q9P7RZTM+1tHyHoLbuLzHou/xcWTvSYBp7q98FJkaFVAlQXa8Kgxp8hrQIqA6QreKwG0NIvtFzUxMB9qR7SZbHxxB39h5FPWgXEHwXe3FBYYZYsT2k3kg+0NX1Q/amxZNEZh5fh/SOq+yhl750txUslkw3QsqhddhyTMM/6bfibVD968pRVUdfU1JUS8IjyaMGRpy/e8yTbaPaX1GXq6+ZKO3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNtNwYhG1GOk83M+Jd100P5MNrU4f0b/+SFap5Ppk0w=;
 b=UnJN6IrEnSrA8IGIYl7Dw3J/YmV4nl1lPQlINFcIawYBNAPcpGeoA8JTvFZjw+nbNnsLf+TnX90Qym073fl8Sr3SBmBDhj1HpOUA3LlIFGlHw0GPilxJjH0pj+xPw3r5lqzNNcmRRpJ8XGFpB0//8nptAxjjSAaNut0Veotfcf8e0JdJDuDaIHSpIx+nr5xjlHxH2w6whhtoh9xtJuOnpx0Zq6uEpM9HOu6xVpUOebHf68OgxR7uUrCjfB0L9pgnO3YWefkD6og9AkJEgJgubwzqa8UYab+VNZgjPqmetVJEprZO/Al8FvyG4kJZqagFlQLTidtk5xn9kayLXdMbUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB7600.namprd11.prod.outlook.com (2603:10b6:a03:4cd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 18:45:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 18:45:32 +0000
Date: Mon, 29 Apr 2024 14:45:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <michal.winiarski@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/8] drm/xe: covert sysfs over to devm
Message-ID: <Zi_qxhMrrlUc7hBz@intel.com>
References: <20240429121436.33013-9-matthew.auld@intel.com>
 <20240429121436.33013-10-matthew.auld@intel.com>
 <Zi-gYDEFzI_bXCzP@intel.com>
 <wtqag5pd5plbiubuhypzdr7jitxutcfbft2xtchwx3fbf4zzfm@pmokwtkmlnf4>
 <2b6f8692-79ad-4976-99ae-c2b227b893d9@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b6f8692-79ad-4976-99ae-c2b227b893d9@intel.com>
X-ClientProxiedBy: BYAPR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:74::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b24cdd6-4418-4d28-b084-08dc687c8ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?tUg7Pij0HUKrMnaU7VXyuW/zf4C+N43joS7V6fw5aGva2iSC2jBCVxm8aO?=
 =?iso-8859-1?Q?ACZrYtCqfumYekutSDX8iJSZRoKcggfmltc1myXWPuhHT9ZsTVssc5QFje?=
 =?iso-8859-1?Q?gNvUvvj6ARr8s9QMgyZy/WWG0nhcRQdyUGvAnyFcYbbXr2yYbBqh+H+GkD?=
 =?iso-8859-1?Q?JXRlveOB5/Rbl2sQzdISTGme+6YO8tUG8Vx4DiuDSyVhOd9a8PRM9Z7d8c?=
 =?iso-8859-1?Q?mwyPZ9caLL+3L382v5mJZQJ4lySAVohQe9tFMUvllnwxFGL2/T/qJiktNk?=
 =?iso-8859-1?Q?G+X7agiO6eYyVLC53vqc6oKLKf+jWhFN8SONNawzTTOozh4HwZ6pWGNCYE?=
 =?iso-8859-1?Q?yWgAY99hET7wfqV0PIXJLgP0vv2DbFwqkz2oiXE/cY9gU37/KofRWo0SVn?=
 =?iso-8859-1?Q?gnu34ZCwiKcxi0nJVRI5KJB178he+LLuNAT7Xp2uNK63suoXoUypGOgJQu?=
 =?iso-8859-1?Q?6E+UZ8uvY2/c/K+C/507mnOdi6Nn+6c4JF9Q+6ZiVHSThI/RVL/V2lpU4d?=
 =?iso-8859-1?Q?gAZ9f6J4fWFb+Ns6Zn5n5RnH4aj6HzEwr5xucwhfhexj7l8CaPJ+915qmL?=
 =?iso-8859-1?Q?jBwDMzF3k3mYGL/yft6ADt3xJ6toi8Bc4q9xsX/ysgZOE+S40u5pzCst2M?=
 =?iso-8859-1?Q?7sJnJAX5qTyb7zDqcq05l1keHOaf3xgJDbLW56JN2mVVn9jpGyjvXYbWKQ?=
 =?iso-8859-1?Q?HUtlf0PLCq3EAQl8OL+yxtO4DfojWJfyE1t8AAqQGfoeNGKj0VF876b1W2?=
 =?iso-8859-1?Q?/t5VTsgHvIyutUabC+4hLhDcDIIibj0xnU9FTmHHs5SXiO2sxUEipa89dS?=
 =?iso-8859-1?Q?Bs5LxOxJfMcKego4ffYsewkR0C+miGeVhGh3NyjX162WRmxP/UOH7zL8ls?=
 =?iso-8859-1?Q?H1eI/vjb7wUn3lPOFjmDv78HM3jnSyUWCuLfVrU1prFmomDBL7bFMMEg+/?=
 =?iso-8859-1?Q?gO+er7qKmuuIlwcx03ISZBOVN2uQKHZDOKdB2NHh2+NUUV1850h4iCVSee?=
 =?iso-8859-1?Q?tlPJEIgPvGA5zFBK0DFd9cx6YwyAbqKYjLCnsGImSekPXwBEq6CjhqCwfq?=
 =?iso-8859-1?Q?WCanEaYM8lyzb0O/Cd0HbVLvAmQ2KBeO9uyoK+lhpYnyzRhUDMWYi7yJVq?=
 =?iso-8859-1?Q?p6vLA/bASiPR16Yw1j9+qVI85g2iYpIWbBgs0xCJAq+5EEByQUE7QunEbq?=
 =?iso-8859-1?Q?E/Yon2a11SAFSgmcWRN6EMaHn68mPJ8L+gEf5vaujM3SehqtWzUv6uljqc?=
 =?iso-8859-1?Q?OvOmKEJA026ktBKNXSWOT9XaM3VBmkoDb99NWk31s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rfRxXlHja0x5uwc/bwO2S9lHLWEQmW/vOiXhFKruYWXTN1SA7h3nY80imC?=
 =?iso-8859-1?Q?3jEzmWbQ+n5r7SKb/8wXzuYH5p6RFCsC9l7J/M+dnU0xl9TUgpjRmw+d9E?=
 =?iso-8859-1?Q?zuihSbmzq1SAtCu3kAMaMTJX2PFbwmqQElmdiq7Gqv/2B5J4EM6DHDe+NE?=
 =?iso-8859-1?Q?lAyrx3vp3vkuGcNAadTnXyA5/Fsvuptfpz7tZEF+a8rQjRXbV+77Pf4vgt?=
 =?iso-8859-1?Q?6q23pzkhk/tmFyExV+j+FQrLJc1lqrPkj39hZq/U4DdzD5uVPbQlxNCwSo?=
 =?iso-8859-1?Q?j/taNHmuK7+tCwuRmliJBk0+ytBXstfd73RhabHmdmfBL2bompBx1bg7la?=
 =?iso-8859-1?Q?Vtlp2zSRD23TUAODJAyiYhXWQEoWPJgYOQa60bdquWdL0hSoxBLNUXklun?=
 =?iso-8859-1?Q?ciBBqsByL5NE4VSIh0yczNwxVccioY9jgfsGEeYQueiYsjOUFm3mx+hftb?=
 =?iso-8859-1?Q?RuJUbADC5NVgdgjwDM9AnYicCROLecA52VEucTaI9WwA7uVwF3+jBSLsUZ?=
 =?iso-8859-1?Q?Elg+vWAJvN4QpIHZqXXnrv9j1+x/yWDaZdcYAV3Z3UnlYsfGUG71kabBI5?=
 =?iso-8859-1?Q?PMgzDrbklQSE7gboQGZXLjV5lMXDUQym9WBgaREF+vpo+3Ix71EdUbTpEG?=
 =?iso-8859-1?Q?yOcPefGb6Hxm5kUK/1OaiXepOkhJitE0Rd/qsvFq+iJPE7ITYlNY3V09v3?=
 =?iso-8859-1?Q?u+i7gH3VI9tt4eUfXYqS7wp1KZE1aEGbjgxbQl+JgpIOvtV0+XGRQMoeP3?=
 =?iso-8859-1?Q?kV3Q7ls0YoxQVooF22rBWfaDyn3r8IIGHe0uUBMgqhHGe/2N5Phj495/53?=
 =?iso-8859-1?Q?aG/lAM8EJ4Np6KKdEKMrqGYQsAVrxq3Bk2pQENU6ZrjaQORMOo9I70/SI7?=
 =?iso-8859-1?Q?folj7UxkWok6XJQqVmfhBPbmzxuEIzrsvHeT6es5rvEG54G9NRKWrkXonj?=
 =?iso-8859-1?Q?QbPXuYowy3wI97WPqnjHrZmzf3iVcNBf0JZHMjVFtX2hkIv5xCpDJziq1S?=
 =?iso-8859-1?Q?zwNoREKeqqD+lMpkuSPJ+ze8Yk08+Zu+U0PVung5SzOEenITRWzTKEahqi?=
 =?iso-8859-1?Q?OXmA0fkgjcOwKddgfLizJFHX2K3s8mdlLpODc3Rzmx4zSaTWu12/dDmhbQ?=
 =?iso-8859-1?Q?hW9RrdsjoXzi7OtCpI4yjEUFD3SFmH3EHA6z34F8MtYCZijWuiloX3EKWO?=
 =?iso-8859-1?Q?bonl2JplSCl4rEVfpk71Mb2Lz/Oum8k3ZGEL+f6EncM+ze7fi9T5stWBPG?=
 =?iso-8859-1?Q?/fRDAJpPxXAbvvTsLBJwGCQviHzhQXQSyRpC5i7zGPl/yYmrkDQX1Hrl6b?=
 =?iso-8859-1?Q?1a+KDEY6ICDJZj1Bb9GbLpvvI4YT2DLwCE933nLzxWtxLQxa4EwRMeVlFf?=
 =?iso-8859-1?Q?bXLKJifdJkbWBBrIIaR63vgJ/iBbReM98mMqShPXlKlLTeaS+xm/y/l/py?=
 =?iso-8859-1?Q?s0EqTC5iT3c2MpoFgaQ33i5aAHZ44pWQILdVKx2sGnUYuDbbqhLHWnwct0?=
 =?iso-8859-1?Q?iW6288p0kBHLb3JCBkXycLidBG5OgEEWxxVXfqpvnzakP35/OPa/tdjv+g?=
 =?iso-8859-1?Q?Bcc7fauGFf7viTqIZoI8pw8AYhTiGsOb8AIIoszxBfmFwwfXuBe39v1Lzr?=
 =?iso-8859-1?Q?jhzFcaojjZdSDBZbf90eFzQRipc3BzORkXdgKzQnp3f543nYD4WH6btA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b24cdd6-4418-4d28-b084-08dc687c8ca5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 18:45:32.7153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBbvEsOpP6qOzHOnKCHjWz9ntEA2sYwFiNqV9eVAU3A6u3wT/Kc0Tgp1ymYVDZAhtIc6A9mL1Mk0jPhZ9Ei++Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7600
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

On Mon, Apr 29, 2024 at 04:17:54PM +0100, Matthew Auld wrote:
> On 29/04/2024 14:52, Lucas De Marchi wrote:
> > On Mon, Apr 29, 2024 at 09:28:00AM GMT, Rodrigo Vivi wrote:
> > > On Mon, Apr 29, 2024 at 01:14:38PM +0100, Matthew Auld wrote:
> > > > Hotunplugging the device seems to result in stuff like:
> > > > 
> > > > kobject_add_internal failed for tile0 with -EEXIST, don't try to
> > > > register things with the same name in the same directory.
> > > > 
> > > > We only remove the sysfs as part of drmm, however that is tied to the
> > > > lifetime of the driver instance and not the device underneath. Attempt
> > > > to fix by using devm for all of the remaining sysfs stuff related to the
> > > > device.
> > > 
> > > hmmm... so basically we should use the drmm only for the global module
> > > stuff and the devm for things that are per device?
> > 
> > that doesn't make much sense. drmm is supposed to run when the driver
> > unbinds from the device... basically when all refcounts are gone with
> > drm_dev_put().  Are we keeping a ref we shouldn't?
> 
> It's run when all refcounts are dropped for that particular drm_device, but
> that is separate from the physical device underneath (struct device). For
> example if something has an open driver fd the drmm release action is not
> going to be called until after that is also closed. But in the meantime we
> might have already removed the pci device and re-attached it to a newly
> allocated drm_device/xe_driver instance, like with hotunplug.
> 
> For example, currently we don't even call basic stuff like guc_fini() etc.
> when removing the pci device, but rather when the drm_device is released,
> which sounds quite broken.
> 
> So roughly drmm is for drm_device software level stuff and devm is for stuff
> that needs to happen when removing the device. See also the doc for drmm:
> https://elixir.bootlin.com/linux/v6.8-rc1/source/drivers/gpu/drm/drm_managed.c#L23
> 
> Also: https://docs.kernel.org/gpu/drm-uapi.html#device-hot-unplug

Cc: Aravind and Michal since this likely relates to the FLR discussion...

but it looks to me that we should move more towards the devm_ and limit
the usage of drmm_ to some very specific cases...

> 
> > 
> > Lucas De Marchi

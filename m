Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557ECCCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 20:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1627B10E837;
	Wed, 29 Oct 2025 20:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Egvznou3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B126B10E837
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 20:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761769474; x=1793305474;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jSkmZusSA0EX9d5GIRlQ8odIM55BHCdS5OJKF4EJRQ0=;
 b=Egvznou3HtIJneML83kY4CNhV0iJV4X0uHK3sc5txID0eVzuQ36mU7y3
 NNqHk914G7KU7wpZf3SYUJrR3v7ZFCoksnV49Ku3lUbKOqMrwUxDWU01w
 dK0apA8fbyoY2H3lugT3aUyCQrda3KTo7hSQKZWwhFX10XHZgZR11Z31q
 Z5N+uWWxvCcGUg05WyrkDL23Hxc5SWp4tA5yVQSOGKiAQ2k8TSHATTm4v
 gnxH+3YZxt301mxyXapLbJXSh99HHQVW1e2xJDW2JdknNCrw5yfmMkTss
 J7eww3e0sG06NMO84NKqYrv6dvZr+qjkzBlPkosh03GO7X2LfAQgmSqU1 g==;
X-CSE-ConnectionGUID: tilvR36tT2SyGvfOY9DemQ==
X-CSE-MsgGUID: acy0qAIsQIKZpwnNqciSxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63834227"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63834227"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:24:34 -0700
X-CSE-ConnectionGUID: 1AjuIrtIRP6AeG1LGIum8g==
X-CSE-MsgGUID: rsxFdSOCQyuHmDiIqGYXsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="190082260"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:24:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 13:24:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 13:24:32 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 13:24:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqIqac2GlyHU+ObeKu42Umx+dluFYQJMN1nxTn3pyGe//wcpd0VHyJyivQY/pU73RVDKa58g4aGT0SBP8t4QUgYQM1hg0B5Sqto8ma/H2g9zbaHaiyb/fUML3u7Y5IFCGg7z5oyJkktbxauud2OerimKM8RPvPfKi8xYKAtzp9+6QcxuPi7etvp6vWQ4LDJDSQylmKFOAkGSN4oGW0s+pFv5dE3FPylUfmM/eGI6iAv/Gi8vZxUFTGwxwk16yFig6unc/wye7xxUL3gkMBZW41DK/u9jx8ty/kPxJns2DiQZRsF0MhWJQg+zflWvGQb7xWuGOAdxOsT/1YCysVoxWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2syq2C2zpsIjBxkio/LBrxT5VzlQG9/I7JzLB9wSDg=;
 b=RgSfm/dgnj7jDLBysY0EJGABhlpGofP3PBAqYes1ruCEp+wwlYylpb74PL857ejQmItu0MC2/3ysvb4bBC+Z5HAFzsRmVYVm0nDizKTIObazZx5qRvVVpJx49quJYQhL6zrAtIzSS32M4Ub4tJdS4WgWvK1vyHzGZeJqGwVhLn+tl08DW5UAk9dOVAO/LkJz9quji1E0pdkv+gzHtjrKEmyWio4Q2Y1yv8ZNxoPy8d2z0btXoFPTaC8X4/LxH+oQUyK3OCeZXJPMic28vJfloYNT4rCn0iIbAzTicbMN5jwaP2Q3r48MBoqGP/Hf2EZElKlNabKwndMI4t807cY7EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB6345.namprd11.prod.outlook.com (2603:10b6:208:38b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 20:24:30 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.018; Wed, 29 Oct 2025
 20:24:29 +0000
Date: Wed, 29 Oct 2025 16:24:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v2 8/8] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Message-ID: <aQJ3-mltmVNmgEAP@intel.com>
References: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
 <20251026-gt-throttle-cri-v2-8-41f8288a71a7@intel.com>
 <aQDNBR28h6o1hM4O@intel.com>
 <q23qstnnvuocvqru7xmev4s7ke23qflgdekfkb2jx6kltuu2l7@b6xg7yt7cx3a>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <q23qstnnvuocvqru7xmev4s7ke23qflgdekfkb2jx6kltuu2l7@b6xg7yt7cx3a>
X-ClientProxiedBy: SJ0PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::18) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB6345:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d9bbe1-4730-44e5-f19b-08de172929cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5zT/zVN96aJroGMRh3KqElML6Yc5Tp9PNHyknhGEicEjx59LgZlHzxU3Fqop?=
 =?us-ascii?Q?WEWmWQNb/c4WQ+rzgw2JGqVMdhQHyLKkXoJLI5mBYBoYZ/FBTuFJGDa5hpWZ?=
 =?us-ascii?Q?dFSFBeoxgqA5ujaWJd76Iz3B4r7J9UpEKP5suRIVPg7PEhuY5o3CmZqQ7XyA?=
 =?us-ascii?Q?FMp+1Wd808uDRgO9fJm8eQma3+8KAkSXU6Vq/JdgF/TTT//ohg/VAhp/n7Jn?=
 =?us-ascii?Q?7yIBHNT/lfOHkv2Y9p/SjAhfQ+uKVlN6WyXOan6UJSStR/AIO7YrwM4rweBT?=
 =?us-ascii?Q?cJRdcHznUtBjGfGBUxIRSE9kiUlGzRo3QM52RBJJsM8dyd8Vy/23bupiRdAi?=
 =?us-ascii?Q?GkLqJyW+p3jmdL3K9gDw2yWulfTKNMoTM759lHi+uTFHqap+5Q5BL5o/i0xy?=
 =?us-ascii?Q?6SVoafOQhWEcqzLQ1QqXbmE7HMPJQVecXOlo8B8RDPO97hBOp1GqIiTtJ8eV?=
 =?us-ascii?Q?isb8A83d6fIVnJBTLbALdH/n5IDfytXrbLLNzoBPeN7ELk3JjKil+mFbQ5bp?=
 =?us-ascii?Q?WfXum54NnvuFPhd+/9u8E8XiQ4ktCKXggJjjxCVAditpu+NcwqmSbvjK3NI3?=
 =?us-ascii?Q?2vdlHs7+1ZA0ZLqkR6VFtKLbDpw2kD+zKwRhq0fzBfIf2rz4/Ii1cRGTVh3H?=
 =?us-ascii?Q?sHUyw+rcnq6giI7ZpAZwRiIecERRoKQ5nntjHx2ZapKEzNvqhSXDQT21M9fh?=
 =?us-ascii?Q?QdY24Tvw3bslT/HhqkLFY0kC2XI1xdiT7nQAlcqOv12RPqwyLV2wCKqor6Sq?=
 =?us-ascii?Q?aFFUpnKG8knGv+1mqLUydJym96J9lUWbLuXeUF/th08XUWsfNXRmjyX8bBs5?=
 =?us-ascii?Q?xqsH6ULawAWIP+2MX4ilPT2sH7bn5rN4hgIHMCjqagAsF4f0F4M9JDK/6FaG?=
 =?us-ascii?Q?qhG4iDJfKe7eNPFCRF22urNn+88r1InD6gJVxI8IketPHhx5J0Rc8UjESl+W?=
 =?us-ascii?Q?2wTo6Oi1exGFe2FRZWSmsuNrO326NIJmPy5ZC9r0yQFsa7Q0zH+D/lp/K2tR?=
 =?us-ascii?Q?ydOlqePaPZ4aSFbjQ5BgGi4tshdvb479oe+LsyOlZ1/oKzkqslD552M1cHEs?=
 =?us-ascii?Q?gDkzivEsBRy4FhkTa7vuQBSdWTwoWu6keJp4CuaiPxP8T7lg51eYlhe6dwyX?=
 =?us-ascii?Q?Vmuu4kOCyfV3Ka/Fc2wUFsWOZVqRL6eAjrUHCQjBWII3z/t5Flr9wp2KQoXI?=
 =?us-ascii?Q?8ib+9ns2IUdf2JtYejUFIScuo0KplMmYcO//WMopVwiof1nxGtb7ipDjTCad?=
 =?us-ascii?Q?LTv8iZtxV0DzQlHxscuoXuc91QBhq8X9EdgxubqIcLCL67qFdBBRKmco+zAo?=
 =?us-ascii?Q?bb+j3kaNtYkluDrNX6s8O9WGhIV/WjipvjLx8h3u53vfo4M2snn3gRfi6/wd?=
 =?us-ascii?Q?4CudMrpwhczUQVgfveFvhwkdmLKxzuqtnfZ4BHsPEOgsQVVbY8zDbGddS3D2?=
 =?us-ascii?Q?69+SU5AkX0ucgSZEiU95NxILR1vvJ/taeNkS3vbiX69298kGYLHRUg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QtcX0oiP2St9JPZ8Rtd4bH6tDjH0peYZMd6wrZO+tRzzbDRnsACIwwvvAzAD?=
 =?us-ascii?Q?6BhLGFPi9jcUmDRNczIho/rjGldpTBsAIQTXTjltl9OKGvMrCEUtBCqD0ehK?=
 =?us-ascii?Q?vwcVtD/6eZ/+yah9eajsKo3jwVSkVKGmkI5aCwjal/lqRCPd/5u8N9FjFwfo?=
 =?us-ascii?Q?9HpNt9RvkNIwMu99SHDryn3Kk4jfI6sZhnHJUlJgknaXTtLOsZHuuXQhNTxi?=
 =?us-ascii?Q?1q9a+RuIkBuonr9UVboAs29edEjkXY+Oh26o+Q1nGR/0OX9itlEs28/y6lbC?=
 =?us-ascii?Q?pNH6+SqWYZEFyh0+/BejiA87Y+zn0vwnXqocL8Pgs3QX0boBvvMuGrgqVbL8?=
 =?us-ascii?Q?dXp3O9Qz5SFzlZuhUvsKbtnS2GMP0zM3UatLZlufDMNUMuVlBAJzFez/M5KK?=
 =?us-ascii?Q?lQBHGA3QovzLkLfl6+3MJzmWfqwszFUnXJOJEytGtIl1ddldZMGtMHNNh7TB?=
 =?us-ascii?Q?Ja48bBLvT5xfHAVXyodth4gqpr66F7gazvOpVkrhUYGEg/wHDEf02YBaraya?=
 =?us-ascii?Q?8d+rKkAHENoeEf6/M12fG5J9X2e0aJqcGDRr8GEqWIZWeNHKFFIyzI0aVCYY?=
 =?us-ascii?Q?DgYNq7M3ELCYvdQSRbIDpIRxfLBeMEqcDyf9CQw9CnOsGPv0WYNalVeIlrnz?=
 =?us-ascii?Q?QM20nfAXB9OzVnSh+65SKnWqFtiyHThD1us18AJLpP73l6RxHKyjC9ct033e?=
 =?us-ascii?Q?0Yli4n6Ofsi44a6ZW6i1wRu/G6gg/sGkj020iiihqnOs1mAawkMQ8KzrJFlX?=
 =?us-ascii?Q?90KsgeUEV5Re6qhG09iMAtOiGzIqtlffWbk4nfXE/N3BuUt91t5MDVv/wP8d?=
 =?us-ascii?Q?NISbOn9G4Cm9t8Gymo6sEQtdEL2Lg+Qj7n+OlcegkPfo6mjvoIz0hnRtY2SA?=
 =?us-ascii?Q?iw+R9F3fSiuF3sGoDT7a5DdrHMaAay6qZCV+Soyx68h8wGLNQM/k4pHu4kNm?=
 =?us-ascii?Q?re4Yf2CNZZrnNsNd6VNuywO8XXduomJvCmb7DBj1ZlTLlBA+jgHU0iFEuB5y?=
 =?us-ascii?Q?sriXXxytgIaimOGwUsQwbul7imhYWFWZzOi0moBPeJrGL5t0gUYu1PZUeEEy?=
 =?us-ascii?Q?JE6JSy1cB64hHimB2Kw0mrz4ucNY2TPYCFCkNGnJ1qhdm51/QJZf3Cz73Iz6?=
 =?us-ascii?Q?UK9tvDDd5dlvUYvINJs8tH9Toc9+xtH74duT2zPcZi67iejPD4E1XLoyyP5E?=
 =?us-ascii?Q?fE/XHqLn6uupFijN+IGdnetFAgC0wx2XO32TcBiqTjsMaqth0HeyF48OWVea?=
 =?us-ascii?Q?UvCBFFty6qrsIqoVoytRnwQXUOTDaCSk2Pns2+W2z3SeQE81ronZNzFkdKUe?=
 =?us-ascii?Q?ElygZCUcUI3spfqLYjA+GZhBSNv1yWOJtRBYTfaomG8A7Lj1l/fbYnBXsbDl?=
 =?us-ascii?Q?QefE0v6yncmN5m1kCIZnsYLWQqa9YmRryZErI3XJjBhjYoMbqIrGjRw/6Kai?=
 =?us-ascii?Q?lsouZMW14uDEtfyXOZ0lU0J/ANRDgT4Db+8VzZBKVDJGjS5zoXqEmQjWyZM6?=
 =?us-ascii?Q?rx+6GkeQv0aDK4+5tVeUOFBHmUXVzCMc8r9RbNXGdutg8BkYy95TeQj7d4Sg?=
 =?us-ascii?Q?qdtDmg1vXdn5lig0zqtSJs6Za0JsdNpcCZ2MQNj+yeVg4Q9INlMWiB+86vQ5?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d9bbe1-4730-44e5-f19b-08de172929cc
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 20:24:29.8571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNs+nlGywWt2i4y0TFiExqScOjLKKRwq25AL7zp8Ev4F9ljj4MTEtdvu8ro77r6ICW4EnXC/WF6H6tKs53GOdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6345
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

On Tue, Oct 28, 2025 at 11:04:56AM -0500, Lucas De Marchi wrote:
> On Tue, Oct 28, 2025 at 10:02:45AM -0400, Rodrigo Vivi wrote:
> > On Sun, Oct 26, 2025 at 10:57:20PM -0700, Lucas De Marchi wrote:
> > > It's currently not possible to safely monitor if there's throttling
> > > happening and what are the reasons. The approach of reading the status
> > > and then reading the reasons is not reliable as by the time sysadmin
> > > reads the reason, the throttling could not be happening anymore.
> > > 
> > > Previous tentative to fix that[1] was breaking the ABI and potentially
> > > sysadmin's scripts. This takes a different approach of adding and
> > > documenting the additional attribute. It's still valuable, though
> > > redundant, to provide the simpler 0/1 interface.
> > > 
> > > In order to avoid userspace knowledge on the bitmask meaning and to be
> > > able to maintain the kernel side in sync with possible changes in
> > > future, just walk the attribute group and check what are the masks that
> > > match the value read.
> > > 
> > > [1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/
> > > 
> > > Cc: Raag Jadav <raag.jadav@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt_throttle.c | 46 +++++++++++++++++++++++++++++++++++--
> > >  1 file changed, 44 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
> > > index fa7068aac3344..fd2988dacbbb6 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_throttle.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
> > > @@ -22,9 +22,15 @@
> > >   * Their availability depend on the platform and some may not be visible if that
> > >   * reason is not available.
> > >   *
> > > + * The ``status_reasons`` attribute can be used by sysadmin monitoring all
> > > + * possible reasons for throttling and reporting them. It's preferred over
> > > + * monitoring ``status`` and then reading the reason both for simplicity and to
> > > + * avoid TOCTOU.
> > 
> > Perhaps add something like: TOCTOU (time-of-check to time-of-use).
> > 
> 
> ok... just to be clear, this is not about any security issue that
> sometimes the TOCTOU abbreviation is associated with, it's just a
> "normal bug/race" in the interface.
> 
> > > + *
> > >   * The following attributes are available on Crescent Island platform:
> > >   *
> > > - * - ``status``: Overall throttle status
> > > + * - ``status``: Overall throttle status (0: no throttling, 1: throttling)
> > > + * - ``status_reasons``: All reasons causing throttling separated by newline.
> > >   * - ``reason_pl1``: package PL1
> > >   * - ``reason_pl2``: package PL2
> > >   * - ``reason_pl4``: package PL4
> > > @@ -43,7 +49,8 @@
> > >   *
> > >   * Other platforms support the following reasons:
> > >   *
> > > - * - ``status``: Overall status
> > > + * - ``status``: Overall throttle status (0: no throttling, 1: throttling)
> > > + * - ``status_reasons``: All reasons causing throttling separated by newline.
> > >   * - ``reason_pl1``: package PL1
> > >   * - ``reason_pl2``: package PL2
> > >   * - ``reason_pl4``: package PL4, Iccmax etc.
> > > @@ -111,12 +118,45 @@ static ssize_t reason_show(struct kobject *kobj,
> > >  	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, ta->mask));
> > >  }
> > > 
> > > +static const struct attribute_group *get_platform_throttle_group(struct xe_device *xe);
> > > +
> > > +static ssize_t status_reasons_show(struct kobject *kobj,
> > > +				   struct kobj_attribute *attr, char *buff)
> > > +{
> > > +	struct xe_gt *gt = throttle_to_gt(kobj);
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	const struct attribute_group *group;
> > > +	struct attribute **pother;
> > > +	ssize_t ret = 0;
> > > +	u32 reasons;
> > > +
> > > +	reasons = xe_gt_throttle_get_limit_reasons(gt);
> > > +	group = get_platform_throttle_group(xe);
> > > +
> > > +	for (pother = group->attrs; *pother; pother++) {
> > > +		struct kobj_attribute *kattr = container_of(*pother, struct kobj_attribute, attr);
> > > +		struct throttle_attribute *other_ta = kobj_attribute_to_throttle(kattr);
> > > +
> > > +		if (other_ta->mask != U32_MAX && reasons & other_ta->mask)
> > > +			ret += sysfs_emit_at(buff, ret, "%s\n", (*pother)->name);
> > 
> > perhaps a space instead of the \n to keep only a single line?
> 
> I'm lazy and I don't like the additional space that the lazy approach
> would cause in the last entry :-/. For printing arrays to sysfs
> doesn't seem there's a uniform approach. Some use \n and some use
> space.
> 
> do we care about the extra space? if not, then it would be:
> 
> 	ret += sysfs_emit_at(buff, ret, "%s ", (*pother)->name);

For the simplicity (lazyness?!) I believe we should go like this
and then an extra \n after like done in
show_scaling_available_governors() at drivers/cpufreq/cpufreq.c

> 
> if we do, then:
> 
> 	ret += sysfs_emit_at(buff, ret, "%s%s", ret ? " " : "", (*pother)->name);
> or
> 	ret += sysfs_emit_at(buff, ret, "%.*s%s", !!ret, " ", (*pother)->name);
> 
> thanks
> Lucas De Marchi
> 
> > 
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >  #define THROTTLE_ATTR_RO(name, _mask)				\
> > >  	struct throttle_attribute attr_##name =	{		\
> > >  		.attr = __ATTR(name, 0444, reason_show, NULL),	\
> > >  		.mask = _mask,					\
> > >  	}
> > > 
> > > +#define THROTTLE_ATTR_RO_FUNC(name, _mask, _show)		\
> > > +	struct throttle_attribute attr_##name =	{		\
> > > +		.attr = __ATTR(name, 0444, _show, NULL),	\
> > > +		.mask = _mask,					\
> > > +	}
> > > +
> > > +static THROTTLE_ATTR_RO_FUNC(status_reasons, 0, status_reasons_show);
> > >  static THROTTLE_ATTR_RO(status, U32_MAX);
> > >  static THROTTLE_ATTR_RO(reason_pl1, POWER_LIMIT_1_MASK);
> > >  static THROTTLE_ATTR_RO(reason_pl2, POWER_LIMIT_2_MASK);
> > > @@ -128,6 +168,7 @@ static THROTTLE_ATTR_RO(reason_vr_thermalert, VR_THERMALERT_MASK);
> > >  static THROTTLE_ATTR_RO(reason_vr_tdc, VR_TDC_MASK);
> > > 
> > >  static struct attribute *throttle_attrs[] = {
> > > +	&attr_status_reasons.attr.attr,
> > >  	&attr_status.attr.attr,
> > >  	&attr_reason_pl1.attr.attr,
> > >  	&attr_reason_pl2.attr.attr,
> > > @@ -153,6 +194,7 @@ static THROTTLE_ATTR_RO(reason_psys_crit, PSYS_CRIT_MASK);
> > > 
> > >  static struct attribute *cri_throttle_attrs[] = {
> > >  	/* Common */
> > > +	&attr_status_reasons.attr.attr,
> > >  	&attr_status.attr.attr,
> > >  	&attr_reason_pl1.attr.attr,
> > >  	&attr_reason_pl2.attr.attr,
> > > 
> > > --
> > > 2.51.0
> > > 

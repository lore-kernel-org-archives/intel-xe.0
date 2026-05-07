Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B7DCD3442
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 18:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330CD10E079;
	Thu,  7 May 2026 18:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FUtcsLsJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47D910F236
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 18:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778177434; x=1809713434;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bC3C6JTjpSkeSe862F3mEddqGxTdIV9HdqJoYNuqiok=;
 b=FUtcsLsJtUUlC258Zh2j49ldf4Nmn+hlqK6bXhtlV++NYjHHS2bsV68R
 2CDiS71Kb0ewfLt1Ewq2vP2Rhz94wrVQm6d78f6NKZtAtF/4osu+2m52N
 5bmQppe9XCtJ+mEZjj+AYKsCBa1U4PywQ1KGoovpiB2vDTE4SVoIVzra4
 8RjtbXWIGe+KR4v1LCV7FbvR4+OiuV5Jwk4rjymfRGjLWARCGFxVMdeD3
 01fl9pI6QnBjhB7RIaiwYvvMsSSa26TPRDr5H4m6pgwy6696MW/PCo7mT
 3KTYlanFluUBfdUXGrUEZ71krSOylcugbtoFrtpna+LdWH6DMYyLPxtxQ w==;
X-CSE-ConnectionGUID: iqki9jNeRq+nQdsP2G792g==
X-CSE-MsgGUID: L6ug8TgeRhedXOprKUIRNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78989939"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="78989939"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 11:10:32 -0700
X-CSE-ConnectionGUID: onQI9wLBTwy4m3i1uJEcQQ==
X-CSE-MsgGUID: n6VOw6xhRoSvdFggzm67AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="231994657"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 11:10:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 11:10:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 11:10:31 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 11:10:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2rijdZKHunLyNrb6zx0idusM63G6hLMT13AI1orDfRLm4O5ukT/9ayFhRLNY2igB8aL+4x0roA5q33VoBnIm0/yYuGk7hWr6QeL78mqMRjgRZFeB/y+rjFeh7ptL5mG4+crNgHZKZLYLuuheJsnYmsOn0NFueonZyeKTLRZxGviYXiD/XSgV7GSFRkMR0/UnXKdScMhLj7iOFUN8euvluubvcNBeWVctMpT5oJSqcikhPn5ThO157VI4Eg0yymYC//p96hvr5TxLVulyLnod5+jLnPxtnTj7y8Nr/zRffP67N7AWIRQUFUfDMsu9CeTvm8BhgiI4vz327SHt9FIDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGISIDnxoVJp+PyG2/ZvWx5aar6TaB++1Fm1h96urIo=;
 b=F7rt+/IJztN4944iBhej6zuCE+7jbIBUoulIDsyck5+9XxwDVQ51LEzxWy9wyWdbGJ/mVIkYeLf3FVNAhjCXRYAawzBamd9yUCxKTV+wHxPlWfWFq9aQctwp2/RBpLl/9pTLyUuxWRyuYbZSELOiE6FHAHTeWna7AcuHK6fU5MwIpM1S65pZZMXFf6ExPRpvZe62xhRwg4wYLfTM7JB3UXS3hd2F6K+rEW2XnnNXLkt7SLzFy9mTIzSF6Jbrw9wZg/CiB27VKnfskhX9hpoPwe3PTnjAf0KuxYdXjxpie52DlHVIQWuDlrZ12UnYER/ZePSjIP8pg97Elx6z2TOeYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9421.namprd11.prod.outlook.com (2603:10b6:208:578::9)
 by SN7PR11MB6972.namprd11.prod.outlook.com (2603:10b6:806:2ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Thu, 7 May
 2026 18:10:28 +0000
Received: from IA3PR11MB9421.namprd11.prod.outlook.com
 ([fe80::1b70:3d93:d363:155f]) by IA3PR11MB9421.namprd11.prod.outlook.com
 ([fe80::1b70:3d93:d363:155f%6]) with mapi id 15.20.9870.023; Thu, 7 May 2026
 18:10:28 +0000
From: "Degrood, Felix J" <felix.j.degrood@intel.com>
To: "Chegondi, Harish" <harish.chegondi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cabral, Matias A" <matias.a.cabral@intel.com>, "Ranjan, Joshua Santhosh"
 <joshua.santosh.ranjan@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>
Subject: RE: [PATCH v5 1/1] drm/xe/eustall: Return ENODEV from read if EU
 stall registers get reset
Thread-Topic: [PATCH v5 1/1] drm/xe/eustall: Return ENODEV from read if EU
 stall registers get reset
Thread-Index: AQHczQWJZOm25O5WM0qBy2D8JOR2T7YC/1LA
Date: Thu, 7 May 2026 18:10:28 +0000
Message-ID: <IA3PR11MB942142A9CC94DA68BF219E28AB3C2@IA3PR11MB9421.namprd11.prod.outlook.com>
References: <6935698d70b6c7c347ff8b138209d601030c2c9f.1776200094.git.harish.chegondi@intel.com>
In-Reply-To: <6935698d70b6c7c347ff8b138209d601030c2c9f.1776200094.git.harish.chegondi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9421:EE_|SN7PR11MB6972:EE_
x-ms-office365-filtering-correlation-id: 85d1e6bb-b7a8-429c-e38b-08deac63eb53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: eq2GGB9V9ndSIv1oqRl0VZjevq88VAo8Mm3a01HkoBtYHjP8fwI2KSwS8Xzyq+Xffvsff9O6STaZSPvn0GcFqae8L3BSyrG9f7gZCqDa3nHhBZAsSb9MVRXiOMDumczFQGGoOmJBXsu9Lb2QvdRJuPv8eCm2gw53Oc4XyH4qNwhPSTxxkMfslI/x3/xL7T51BCizLQ1xiawffMUorNeEZ+OO70yFtzZGmlEl5jSZhS/JMFM8vV1BKCOFCEoGNE8Ty3dzeP0QP2hraw9nC07maLqzGyVPis0HtBPlyuP6cj3J21ShHW6xoxwOFwxOqayiKxq50Mlu0yL/CvmTstPTmb6v1VzfpH3FckWVPiYjWBDImm5eGvF2tfURAOlrB2aMy592kPgMVi6GvoHdWl5ivgWXifP7QeVSJU7/crICRAWoL2YWaXV/Ljfb/Aetjh8ZK7Od5wNUoO+KXgpRgB1paNvMnzYLih67+/iHnDC9qb0roLcF1vfSl+guRJwNu9vRhEAjk5Ig8gxzI8KNqqO2izqKc4bTMR9a/Ilc/bTlTLn5XS2CqoTv/SMg+wVt9qhUczU06SmopGHEY+UTGQUoMYjrBhu5gSnjZ3+zQVVVloWLE1gYPoEiA1CdQ3QHqRRo2Xb6mkaGuE2bKFDmH5Epy1tJVAjPEwk4os4GeTgltsFFMoSaBrPBhdd4snRsTKvSRLGPacF3CwY8aToBNRepcRxWj0B/ld84IG2cRb+zYsDDoPWvEx86C812muSf34Qr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9421.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RS0VhCmVP37utAT+QdVVvVa9IaTFJ4BJV6r4vNqeb/GBbNDo9xikIMCeNdM4?=
 =?us-ascii?Q?4MjyH7GcL3y4YbY8/AcekjZJBj6je4i/CF7UKQm5LzZp2SMLCVMqbD/CSX4K?=
 =?us-ascii?Q?5R9wtQSqNkZkS/wwTGe8iqmFSARdZggWN4dvif0HuCkTkyM5SjL2XWW4ujG5?=
 =?us-ascii?Q?RK8CjFLmqrLSDHFcNGlONhOanIyC6gLboY86wqVvT8IW2PRSLP5XxLzEoqMS?=
 =?us-ascii?Q?B5sshElqCSHXOAXj/YtHQ/WaStr32iAPGvp6RafruQ6omWqN2RqnlPsblSjs?=
 =?us-ascii?Q?Vf2dI7TbsDKs2dpOmCO0Jo7fDgowWMaYHEw3JJVQnWf/0j5fK9pp9wsOil5J?=
 =?us-ascii?Q?xDPikf7vox6kjWjl4TOV/Ik3A3QeWCHjWRaiuJERy1SD/JIPDz6gplW2uUAv?=
 =?us-ascii?Q?+D64gRlU8FK+IVc75uRn+SSqfzKrSl4Uj1BfDW4YATLS092FChiAxgDBHDl1?=
 =?us-ascii?Q?INnoEIE+N/6EJ6av8v4bEoNNmCO6e2JhysDlrwREHcN7L+2EJquSHVzxF17o?=
 =?us-ascii?Q?QTK5bPpu+dqa9w+SaQ1nE2IkITBxIclnA5rDMwTAGLYCyDucn9mLcdGphupt?=
 =?us-ascii?Q?t6evL3c/lCx/eE0SLC05spsLs+Tbb3YVa4OV4bibKtvcbn9CcvjGDQbqwBJ+?=
 =?us-ascii?Q?+/q+b/YtqagBN86GgPLCgxDT5xC/0P0PLliFIlUJG34m8xowjBcv7a6oQyiZ?=
 =?us-ascii?Q?isjuzawAIImtbD3qFJ21FTzXwbOyzJ8GJxZGaIak8gpVNtHLyGmsq+rs+mhe?=
 =?us-ascii?Q?92rjDuhxUqdyo/N04sa0bX74lKJ+oZ/s+SIWuMp4jW81KlMNKe/p8dwkJ2cS?=
 =?us-ascii?Q?IvnhwfH/ctcq/Qhm8L+5LTCJevJMk2DdiB1lQM0M2YIfMZRWRWEbYevWbC0G?=
 =?us-ascii?Q?k1ZiD2Q3eIZTuqW2verks/qXJ2IeTiBqzD+iak/9NKGGkD82l8OgEnKJYSJV?=
 =?us-ascii?Q?Xcwe72fpcnfhNw/RwkuZdc5GziaNTCknb2Zfa1Gwz4uy4f7j0JhqspXd33yF?=
 =?us-ascii?Q?wV9kBIr9AskKNmmlTAfeqitnJIOhH9SIcOJn3x58mJsi83YaIJ+XlwInNNQy?=
 =?us-ascii?Q?iWcltk/5p0r4Gh9jrQ1z9uAVPNVXf5RxONCPHeLpFMR4G4PbXH+FZICrWaur?=
 =?us-ascii?Q?weNbCwim1G07lhy16pEOc2Zk7onU9SFPyiBzAzeoK4phF+Zi6dbjA+y/e6TD?=
 =?us-ascii?Q?Ae9dX4I7CT7pM7KsVizfj48D5dzC7ZDkN4mIAaEjJJMAK7nHWL/CLCcpzjAC?=
 =?us-ascii?Q?HZFNEx2Fsq6T8Y4q65d/1vhKEmeJuzBewgh9EJ9+gARuEPIh1UNi5dqRIXnA?=
 =?us-ascii?Q?djTvN+8NXD6AYhOJS7eGjBkYWbXCJL7LKriFzDoefHzAuUG91xJ/s87pqSRs?=
 =?us-ascii?Q?ERPpxuacew/tP7UuOtsyUYAbQu9h6mtWmnblH7junyZ575TtXexY1C34OqKy?=
 =?us-ascii?Q?sVSE8H7enGaHDHRPH5OJT9VOeMpS65oev3Xh9fWu9MlmA+/hdouyQqRFgqxb?=
 =?us-ascii?Q?0/qQaq/REUVeLXFz8qU3nw9Z+wCpZiyqu4/7MsFDOB3J00PF1OSkkFf79u/Z?=
 =?us-ascii?Q?ploGpsuCdmWOMdbP9AXGi6YrfBpozfcJBd20WkZ/flpFEj+sUE2yODrheRkF?=
 =?us-ascii?Q?AqbsKm21xlSUzGDTxYf8LA+F65x05IpRH0kZjiOdG/Sv8Kl+sRvDaVhkzTPB?=
 =?us-ascii?Q?SjfGCJeGfDmLUxursiwX44SWj4VvZOaKxgY6DiHeQAGAbLj9W+luqdvSzKfT?=
 =?us-ascii?Q?6AnpZKGZNw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LXKFcfnXvfo81r0xI45reXyEtpT0YgdndmTLzhPucKNBif/TsFfpQOYcQYk52GWIYPe6ZmszwgTqWwj0w8YBVddrep0dmddrpWso9TdcO8PhzJkci1ehqpIAhJ1DU80If5Z5WX1i1bnpkn0Hr9LB/FtEGX59OpYiS6QRHaRRhYo6muBmZ1vbAH9+1Rz2ZeVPXu6Imf08NGodeS9HhwNDO1FjBvmBTqYw9eU4PqPmetO7NW7OrXR+s8GJF8WLAwmIn2uSCxM/K+cIBo5VEmNmWeh7kwSJydElUtGtHM+qGDltx53JBnNLtCKa2I7C1iwqhi0bbXP+BvMvTHG5goI1Ow==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9421.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d1e6bb-b7a8-429c-e38b-08deac63eb53
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 18:10:28.2486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ndNGsD7JMGRYbRoilxBoyQ0cEe/z7jqJyzmwaq2+YiZwXazhwwt+eXMkhX8BMk0yxsDB2xu7xtX7Xr32+9Zb8MzWyf9oCBCE9mb8t44PLho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6972
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

Acked-by: Felix Degrood <felix.j.degrood@intel.com>

-----Original Message-----
From: Chegondi, Harish <harish.chegondi@intel.com>=20
Sent: Wednesday, April 15, 2026 11:27 AM
To: intel-xe@lists.freedesktop.org
Cc: Degrood, Felix J <felix.j.degrood@intel.com>; Cabral, Matias A <matias.=
a.cabral@intel.com>; Ranjan, Joshua Santhosh <joshua.santosh.ranjan@intel.c=
om>; Dixit, Ashutosh <ashutosh.dixit@intel.com>; Chegondi, Harish <harish.c=
hegondi@intel.com>
Subject: [PATCH v5 1/1] drm/xe/eustall: Return ENODEV from read if EU stall=
 registers get reset

If a reset (GT or engine) happens during EU stall data sampling, all the EU=
 stall registers can get reset to 0. This will result in EU stall data buff=
ers' read and write pointer register values to be out of sync with the cach=
ed values. This will result in read() returning invalid data. To prevent th=
is, check the value of a EU stall base register. If it is zero, it indicate=
s a reset may have happened that wiped the register to zero.
If this happens, return ENODEV from read() upon which the user space should=
 disable and enable EU stall data sampling or close the fd and open a new f=
d for a new EU stall data collection session.

This patch has been tested by running two IGT tests simultaneously xe_eu_st=
all and xe_exec_reset.

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
v2: Move base register check from read to the poll function
v3: Don't reschedule work item after reset detected (Ashutosh)
v4: Return ENODEV as errno instead of EBADFD
    Reset reset_detected in enable()
v5: Move reset_detected check above data drop check (Ashutosh)
    Rebase

 drivers/gpu/drm/xe/xe_eu_stall.c | 40 +++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_st=
all.c
index c34408cfd292..d7982d893c49 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -44,6 +44,7 @@ struct per_xecore_buf {  struct xe_eu_stall_data_stream {
 	bool pollin;
 	bool enabled;
+	bool reset_detected;
 	int wait_num_reports;
 	int sampling_rate_mult;
 	wait_queue_head_t poll_wq;
@@ -428,9 +429,20 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_=
data_stream *stream)
 			set_bit(xecore, stream->data_drop.mask);
 		xecore_buf->write =3D write_ptr;
 	}
+	/* If a GT or engine reset happens during EU stall sampling,
+	 * all EU stall registers get reset to 0 and the cached values of
+	 * the EU stall data buffers' read pointers are out of sync with
+	 * the register values. This causes invalid data to be returned
+	 * from read(). To prevent this, check the value of a EU stall base
+	 * register. If it is zero, there has been a reset.
+	 */
+	if (unlikely(!xe_gt_mcr_unicast_read_any(gt, XEHPC_EUSTALL_BASE)))
+		stream->reset_detected =3D true;
+
+	stream->pollin =3D min_data_present || stream->reset_detected;
 	mutex_unlock(&stream->xecore_buf_lock);
=20
-	return min_data_present;
+	return stream->pollin;
 }
=20
 static void clear_dropped_eviction_line_bit(struct xe_gt *gt, u16 group, u=
16 instance) @@ -544,6 +556,15 @@ static ssize_t xe_eu_stall_stream_read_lo=
cked(struct xe_eu_stall_data_stream *st
 	int ret =3D 0;
=20
 	mutex_lock(&stream->xecore_buf_lock);
+	/* If EU stall registers got reset due to a GT/engine reset,
+	 * continuing with the read() will return invalid data to
+	 * the user space. Just return -ENODEV instead.
+	 */
+	if (unlikely(stream->reset_detected)) {
+		xe_gt_dbg(gt, "EU stall base register has been reset\n");
+		mutex_unlock(&stream->xecore_buf_lock);
+		return -ENODEV;
+	}
 	if (bitmap_weight(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS)) {
 		if (!stream->data_drop.reported_to_user) {
 			stream->data_drop.reported_to_user =3D true; @@ -554,7 +575,6 @@ static=
 ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
 		}
 		stream->data_drop.reported_to_user =3D false;
 	}
-
 	for_each_dss_steering(xecore, gt, group, instance) {
 		ret =3D xe_eu_stall_data_buf_read(stream, buf, count, &total_size,
 						gt, group, instance, xecore);
@@ -609,7 +629,8 @@ static ssize_t xe_eu_stall_stream_read(struct file *fil=
e, char __user *buf,
 	 * We don't want to block the next read() when there is data in the buffe=
r
 	 * now, but couldn't be accommodated in the small user buffer.
 	 */
-	stream->pollin =3D false;
+	if (!stream->reset_detected)
+		stream->pollin =3D false;
=20
 	return ret;
 }
@@ -692,6 +713,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall=
_data_stream *stream)
 		xecore_buf->write =3D write_ptr;
 		xecore_buf->read =3D write_ptr;
 	}
+	stream->reset_detected =3D false;
 	stream->data_drop.reported_to_user =3D false;
 	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
=20
@@ -717,13 +739,13 @@ static void eu_stall_data_buf_poll_work_fn(struct wor=
k_struct *work)
 		container_of(work, typeof(*stream), buf_poll_work.work);
 	struct xe_gt *gt =3D stream->gt;
=20
-	if (eu_stall_data_buf_poll(stream)) {
-		stream->pollin =3D true;
+	if (eu_stall_data_buf_poll(stream))
 		wake_up(&stream->poll_wq);
-	}
-	queue_delayed_work(gt->eu_stall->buf_ptr_poll_wq,
-			   &stream->buf_poll_work,
-			   msecs_to_jiffies(POLL_PERIOD_MS));
+
+	if (!stream->reset_detected)
+		queue_delayed_work(gt->eu_stall->buf_ptr_poll_wq,
+				   &stream->buf_poll_work,
+				   msecs_to_jiffies(POLL_PERIOD_MS));
 }
=20
 static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
--
2.43.0


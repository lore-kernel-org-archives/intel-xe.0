Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1D1CE8372
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 16:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0BA10E556;
	Mon, 30 Sep 2024 16:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R05vEpYY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA0B10E554
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 16:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727714649; x=1759250649;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=L+1L6TUqeO3IhcxtO5PzxFuj6VXfIgGg2ZJUwOZcfic=;
 b=R05vEpYYkJGEKBpq8hJZrLVzG4UGrgwaSa82W8qzUFJhTEWquKmH+w0b
 hwVSDHN4FCLRk8XWzkvr3h4ebmUt9nF+cv8uzBI7eCC7Z39M6xNMuiv6v
 dK5EPq6Ztt4JJ1cfWcMPq+7j9IPCmcU2mchKrvFc6UPOSiAB60k9T0UXa
 6ORRjkH9+ghQkmGc8LPadf2GqHnZfX5ABm/d7YNIxNon3bLPFon9oW/9e
 Qo8jekr0CjcxiA6mL6PH4VsBsi6JYuQSas/qNA54G9SoSvbWx8zkwsP16
 rpJ4T2RB5qgJgb2RmSiWRQcDPuEGCvjSPplwVA4em8q+fFUd8RH02CVwu g==;
X-CSE-ConnectionGUID: /VnLhOFCRkWlr0px3yY2Iw==
X-CSE-MsgGUID: nSdGR4nXSXCh4K3N8JPk9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26770392"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26770392"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 09:44:09 -0700
X-CSE-ConnectionGUID: BO1whIHiRAqZrhEG+o7YFg==
X-CSE-MsgGUID: SpNo5OjlTSqxSjJh2r+Kzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="78205156"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 09:44:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 09:44:08 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 09:44:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 09:44:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 09:44:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNw9zA8Xli4iZn1b0r3jErqdkk44tIyzFN60z+eh0/4Eot5DMEolwokKJJfGNwVdX1OJu4yjRspIQF3e5HInL4NAFl4UOijPmHpbA+HHjxLSpSVdR5/2LHU4xVTZ7AORslm8Ow+6RaF09WMoMle/WwCYjMQpv8e6U1ranqibJH4/0QxAmQPSeUMLumWH+SSOxXvIA8PTHLji7R00j2CysrqFHgdRk3utFN8vH1XjvPw+K/tid+HMdLP5k88BGiheLJ3osFFmbhnZxuKTYbR15lVxDlq1kc6ZmHDtvRdeIzohwV6yldcLE9sljHGPW8ztXXby8FAxXRQWl+amMlrvQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ngI902MkEhWZv/JsDAX8q1yAZk1IlZ3DWmbmqWGr6w=;
 b=KsdYxy3brusNrl0r3GWX9FbjdmJDiHR9i368+2o39A20pHyRLqcyt9dSYxeurd0zD0TjHo+rIQIBv3RaZNp4WfqGY7PLLSUTbd1lDPZur5Wvm0N3xDPru02rU+dGA2aR1hIMBile0ZT/ew1uTkxYNZhTa7mubwZWDSkCNaBr2ivARRe1wSas2I9k0OrNFLRA/wAdhDOAccQagEqWFPV5NUWRyalaFMYWNVcEgwFPbu/tsapadnJZ6chMvHt9IJS4A6MAD1MRfAXmtZt0Yah+AUi4l5bbN1fI6WsJwRZTSl+Y00XZG6ctJ8bXMl6b6hxkVOmXzevqcJRnKEEa6YnzHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB4991.namprd11.prod.outlook.com (2603:10b6:a03:2df::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Mon, 30 Sep
 2024 16:44:05 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 16:44:05 +0000
Date: Mon, 30 Sep 2024 12:44:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Saarinen, Jani" <jani.saarinen@intel.com>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] Revert "drm/i915/psr: Implement WA to help reach PC10"
Message-ID: <ZvrVUnXeXImJLch_@intel.com>
References: <20240930071329.1630583-1-jouni.hogander@intel.com>
 <ZvrCANmHJIw59v8b@intel.com>
 <DM8PR11MB56558A8F4EC6ECEE1712BC0AE0762@DM8PR11MB5655.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM8PR11MB56558A8F4EC6ECEE1712BC0AE0762@DM8PR11MB5655.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0198.namprd03.prod.outlook.com
 (2603:10b6:303:b8::23) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB4991:EE_
X-MS-Office365-Filtering-Correlation-Id: 93784915-ac31-46d7-cbdb-08dce16f186b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?/02s+rfFXocmPzx7UJ16hSG/6XsC/9ugI6ISJnMR+ptbG8j+Qi0p6xA8OS?=
 =?iso-8859-1?Q?ye5+ApyKt5St/SKycs602Hhsl0PY5Lp2QE4MLIE6dNVweHSfWPIM7viZv5?=
 =?iso-8859-1?Q?IhpnIm0iQEoSpcEN+8C5HjvTncGBJR+qMl9D9CsWLX9e0Rm/P1OOSoeOgy?=
 =?iso-8859-1?Q?kVYyLzA6gjjPaXoXONetAKELxXv2CtVGy1v9k5Y898ezIlJFl1WvttAve7?=
 =?iso-8859-1?Q?wuNY9AHG8/QROWVj85A5G5dWSTtCPwqQleQSsn7vOU2dE85Kb0R1bB/c0V?=
 =?iso-8859-1?Q?XVKDWDjkDRa3AutWcsMO/BQ7Jhd/DsgSMuXUDonOegtShZjeMjrjHcHFzb?=
 =?iso-8859-1?Q?1ZA8MUqvvr5iJ57TlQTCwFBmOAChAtLx20MaBAaJfCBY+P79cW76D7JzAc?=
 =?iso-8859-1?Q?6KtMD61bIDnt288oj8GHUnGL1aGvNQRK+shzs48LaUULRU3YLAv953mS0Z?=
 =?iso-8859-1?Q?nlaeH4zaF5+frcIs3mCKRrdXIliTS+Z2moWWlwxwbaX/I0bGkIgQm22W0D?=
 =?iso-8859-1?Q?NBabiT8K905wlw0sYRo+MzQ0KzDYGOclGvs2ISwzf2rMywgx6CykjTSfZs?=
 =?iso-8859-1?Q?KuHV3ldnnq/2moAdQP9/Am2a+0LZe+vnXjDp1YXu6REqYgR2AFts9aPAVL?=
 =?iso-8859-1?Q?lQHE0bnuGJd60PM8jUvxHKxn0cDxXZKJT2oPM1Txf56bwI7oFCtMotGMC3?=
 =?iso-8859-1?Q?huinGWNZIlxdprJq1a1mU2tH3EBtK58N1G/9CfU6VAOrqUtQk0hHEVNjp0?=
 =?iso-8859-1?Q?12lgQLtiAR0mB0oYEzXNyqT88T1Xjl5fNS4F7FFBDyqmJ34E5RQYhcIcEQ?=
 =?iso-8859-1?Q?texggSSzpPw04JLU+kI6vOc0IXAqNRtfB/gSptlMdB31bHTZF4Eijb/nSg?=
 =?iso-8859-1?Q?ROkp1xUIYk/vL3e3gUIjgy2oTfzEyl1daSFllSv+cwE0V6keDDWKzWpxF6?=
 =?iso-8859-1?Q?z4ik3YVQ9JEUSnmnmxiGEZvEtM2DWGe8wMvAgrdje62N5+Xn7WFDzXm3V3?=
 =?iso-8859-1?Q?9rIWsut2v5++GwIkBhtVqwl17tDVz+FggZ0hLNW3M3wYVwdwDFH4UZhFC7?=
 =?iso-8859-1?Q?KQpd8aiVWg+HBF48V9t55bHfoO9nt744GMuXoyHmHX2AXIG7dGDAowxnzP?=
 =?iso-8859-1?Q?qq1Jq1ebTVaNmk73cNbjsjj9RGvTurF3HFS1k9XtsncaKqZH2Ap19gCq4B?=
 =?iso-8859-1?Q?fVly6AxAvjYgY1pwJDYf7sA6WY+BdP1lG0V3iUX9sFeVk6u/y7Nt9SrOKc?=
 =?iso-8859-1?Q?kgFyKKQFToPWf5mfPwqj9ee62ZifiTJrdvYt55hPk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Z/HqRtfdMUvuxmSoGL5vC7Do0+Xh3cp+KG+Yjae3OHBNJZSHVtl3AdqOtJ?=
 =?iso-8859-1?Q?eWjFiosOGcA8QCzNv0ACAILDbRFK4MU66SF4qMp6EsnmR6/4uBsLZx5ISS?=
 =?iso-8859-1?Q?jn4xTjgz8eb+ErhXdgSNL74OFncAeYzVlU0D8epL5QYbjvowUBEQ44OiaN?=
 =?iso-8859-1?Q?QHRZjy7Ixp8xnD82ARB2Zgyi5GsRSQVQLeYZkDPkZ9H59MynByGcPKFm1G?=
 =?iso-8859-1?Q?RRUCT9o/EgoTv0wF1mvvpWPDTeAbG1nggbpau2IT7at5OsleUJeRb4SfZs?=
 =?iso-8859-1?Q?RyM6j+dt3Uvg2346Rx3GYxPSGzI7w5GQN5jnNO9UnScJyIGMGmUHBhfvH0?=
 =?iso-8859-1?Q?CrzpCl6Tut2SCxgaoQuiSy4Y4KoO34oZlO9MvtNVSLTmK795E2M2j3N3Hf?=
 =?iso-8859-1?Q?7dOeHHPgEMHx+O3VZ1PaG0SgDtlgozFhI7h9XMqIprPQzYvlBFJM5TlvR2?=
 =?iso-8859-1?Q?vzlXhBP6IHmN6UgAvi6vJTjDkNDhX/ys4+o9O3Jay4JZtr9ku9OznOLa6M?=
 =?iso-8859-1?Q?VJI5th7BIG8pmXTPN4m7jIrdHPB66+zt3O6dX5Q+YL++fCg1HJIaa7UZhs?=
 =?iso-8859-1?Q?GgNA6RdxovXvZpgmog/coom3oca+KOcK9+pnMM9V72TC01F/xY8ebnqAZj?=
 =?iso-8859-1?Q?+tfzUXcc/jRiiMNZ50AKRgyidCqEROHqFhlMzYUdIlLNFR6v/rHYqzIr8X?=
 =?iso-8859-1?Q?8TBQlc9LUNhr1VOu7KAgsP7Pj9a1z3UC2ABpBzbmzn5udow27H03Ak4unC?=
 =?iso-8859-1?Q?261VJny+pvStbN2Gsuemk0RG0CiLkKM+L8ahSKbew2u5MRC9XHRkrorQz1?=
 =?iso-8859-1?Q?d2i9b2huHg+ZfgklQNUs5bzZvr1YQ+fAdwVew3HORKmsuq2ypzZqGZQ5VG?=
 =?iso-8859-1?Q?9iN2v/SFCCfzDA00bUCJw35m4wlCXX5KAhwgYr2Yxlp5zuzO/Hb6XmyH5k?=
 =?iso-8859-1?Q?e1wIHkvxLO2hGhoKzU6pbOIQFPsX/CD8K9kg7lnLTwooZD2EdLZ+L0vzjf?=
 =?iso-8859-1?Q?rubTS2ERFm3pgXxmP4W5jJ1VAkYyp29sOdJT+Xvh7SouxTV5CqrdXi+SAX?=
 =?iso-8859-1?Q?WdHzFYlvsATsWguDZEgEupO2IRUKOdR5r8A40SKU0w9voS6g1pqZn40ojV?=
 =?iso-8859-1?Q?MZBWqzJfHUAYG+ehIFVnOQ5QmHmuJbxSx3mdK3zHuOfNHiGtHtDBDKUB4S?=
 =?iso-8859-1?Q?2/hU/M/+TAeW31UIb9Q557CqsNLsOk3e2/uYBp08jQOGPNIhLle5Q5hRiB?=
 =?iso-8859-1?Q?tmC+MF0DUEUHzZeGO3T+CnSj6ck1rOlA67rCN668z7Ysf1eMwxnK8CzQwb?=
 =?iso-8859-1?Q?FkdogOt8DUNN6CzvyBZk2BSajZsJHSdZzB9uOt7a/7AvcX6MMDWoho7YKq?=
 =?iso-8859-1?Q?orwWpPPq8zZxQe5SVCtlWAUu1aBBUQQky3XylQdMILqsyFG/zV8gUW+YjH?=
 =?iso-8859-1?Q?YKTYPcgKtmFm5BWIYqUyfL5nzOgc6lo/qSLvNfcatRnlXZUzNlnuh2xu+6?=
 =?iso-8859-1?Q?QYp0vuEe8c/h6Tu/4iuh2NZdpqpsXj9HqlFB9LrD4r716uwu7vsgTP0xLB?=
 =?iso-8859-1?Q?OuYhtETJ0AGQAjeuq3/4VAYdjd4oNSC1IWjxMfmoAnc+XZxlHeDC3yWsGx?=
 =?iso-8859-1?Q?VShcyulEBLyaAgM43ifeucjaiyP5+Zl5s3HBhkEdWJPhIgi4ffdQ16QA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93784915-ac31-46d7-cbdb-08dce16f186b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 16:44:05.0090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpWn2uJ23KGZiOeJnaoE7tIHjcIb5s71VxpDCTJ2f89RZ6H5p2hAebXPGTJg7/x7ONH38qcG1XoJNp1e1Ti3MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4991
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

On Mon, Sep 30, 2024 at 11:28:56AM -0400, Saarinen, Jani wrote:
> HI, 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrigo
> > Vivi
> > Sent: Monday, 30 September 2024 18.22
> > To: Hogander, Jouni <jouni.hogander@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [PATCH] Revert "drm/i915/psr: Implement WA to help reach
> > PC10"
> > 
> > On Mon, Sep 30, 2024 at 10:13:29AM +0300, Jouni Högander wrote:
> > > This reverts commit c2579a217799ba577fa39a2a12643a277334e691.
> > >
> > > Reverting this commit as it is suspected being culprit on regression.
> > 
> > Any link to a gitlab issue or any information about the regression itself?
> Some here https://intel-gfx-ci.01.org/tree/intel-xe/index.html?testfilter=kms_psr&hosts=lnl 
> Gitlab : https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649 

Thank you

pushed with:
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649

> > 
> > >
> > > Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> > > ---
> > >  .../drm/i915/display/intel_display_types.h    |   3 -
> > >  drivers/gpu/drm/i915/display/intel_psr.c      | 119 +-----------------
> > >  2 files changed, 1 insertion(+), 121 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> > > b/drivers/gpu/drm/i915/display/intel_display_types.h
> > > index 7ff97e5b83dd5..f60d66f4b980a 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > > @@ -1576,9 +1576,6 @@ struct intel_psr {
> > >  #define I915_PSR_DEBUG_PANEL_REPLAY_DISABLE	0x40
> > >
> > >  	u32 debug;
> > > -	bool is_dpkgc_configured;
> > > -	bool is_dc5_entry_possible;
> > > -	bool is_wa_delayed_vblank_limit;
> > >  	bool sink_support;
> > >  	bool source_support;
> > >  	bool enabled;
> > > diff --git a/drivers/gpu/drm/i915/display/intel_psr.c
> > > b/drivers/gpu/drm/i915/display/intel_psr.c
> > > index 39aa46de15e43..e3357f3b5c705 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_psr.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> > > @@ -26,7 +26,6 @@
> > >  #include <drm/drm_atomic_helper.h>
> > >  #include <drm/drm_damage_helper.h>
> > >  #include <drm/drm_debugfs.h>
> > > -#include <drm/drm_vblank.h>
> > >
> > >  #include "i915_drv.h"
> > >  #include "i915_reg.h"
> > > @@ -897,89 +896,6 @@ static u8 psr_compute_idle_frames(struct intel_dp
> > *intel_dp)
> > >  	return idle_frames;
> > >  }
> > >
> > > -static bool
> > > -intel_psr_check_wa_delayed_vblank(const struct drm_display_mode
> > > *adjusted_mode) -{
> > > -	return (adjusted_mode->crtc_vblank_start - adjusted_mode-
> > >crtc_vdisplay) >= 6;
> > > -}
> > > -
> > > -/*
> > > - * PKG_C_LATENCY is configured only when DISPLAY_VER >= 20 and
> > > - * VRR is not enabled
> > > - */
> > > -static bool intel_psr_is_dpkgc_configured(struct intel_display *display,
> > > -					  struct intel_atomic_state *state)
> > > -{
> > > -	struct intel_crtc *intel_crtc;
> > > -	struct intel_crtc_state *crtc_state;
> > > -	int i;
> > > -
> > > -	if (DISPLAY_VER(display) < 20)
> > > -		return false;
> > > -
> > > -	for_each_new_intel_crtc_in_state(state, intel_crtc, crtc_state, i) {
> > > -		if (!intel_crtc->active)
> > > -			continue;
> > > -
> > > -		if (crtc_state->vrr.enable)
> > > -			return false;
> > > -	}
> > > -
> > > -	return true;
> > > -}
> > > -
> > > -static bool wa_22019444797_psr1_check(const struct intel_crtc_state
> > *crtc_state,
> > > -				      struct intel_psr *psr)
> > > -{
> > > -	struct intel_display *display = to_intel_display(crtc_state);
> > > -
> > > -	return DISPLAY_VER(display) == 20 && psr->is_dpkgc_configured &&
> > > -		(psr->is_wa_delayed_vblank_limit || !psr-
> > >is_dc5_entry_possible) &&
> > > -		!crtc_state->has_sel_update && !crtc_state-
> > >has_panel_replay;
> > > -}
> > > -
> > > -/*
> > > - * DC5 entry is only possible if vblank interrupt is disabled
> > > - * and either psr1, psr2, edp 1.5 pr alpm is enabled on all
> > > - * enabled encoders.
> > > - */
> > > -static bool
> > > -intel_psr_is_dc5_entry_possible(struct intel_display *display,
> > > -				struct intel_atomic_state *state)
> > > -{
> > > -	struct intel_crtc *intel_crtc;
> > > -	struct intel_crtc_state *crtc_state;
> > > -	int i;
> > > -
> > > -	if ((display->power.domains.target_dc_state &
> > > -	     DC_STATE_EN_UPTO_DC5_DC6_MASK) == 0)
> > > -		return false;
> > > -
> > > -	for_each_new_intel_crtc_in_state(state, intel_crtc, crtc_state, i) {
> > > -		struct drm_crtc *crtc = &intel_crtc->base;
> > > -		struct drm_vblank_crtc *vblank;
> > > -		struct intel_encoder *encoder;
> > > -
> > > -		if (!intel_crtc->active)
> > > -			continue;
> > > -
> > > -		vblank = drm_crtc_vblank_crtc(crtc);
> > > -
> > > -		if (vblank->enabled)
> > > -			return false;
> > > -
> > > -		if (!crtc_state->has_psr)
> > > -			return false;
> > > -
> > > -		for_each_encoder_on_crtc(display->drm, crtc, encoder)
> > > -			if (encoder->type != INTEL_OUTPUT_EDP ||
> > > -			    !CAN_PSR(enc_to_intel_dp(encoder)))
> > > -				return false;
> > > -	}
> > > -
> > > -	return true;
> > > -}
> > > -
> > >  static void hsw_activate_psr1(struct intel_dp *intel_dp)  {
> > >  	struct intel_display *display = to_intel_display(intel_dp); @@
> > > -1092,15 +1008,7 @@ static void hsw_activate_psr2(struct intel_dp
> > *intel_dp)
> > >  	u32 val = EDP_PSR2_ENABLE;
> > >  	u32 psr_val = 0;
> > >
> > > -	/*
> > > -	 * Wa_22019444797
> > > -	 * TODO: Disable idle frames when vblank gets enabled while
> > > -	 * PSR2 is enabled
> > > -	 */
> > > -	if (DISPLAY_VER(dev_priv) != 20 ||
> > > -	    !intel_dp->psr.is_dpkgc_configured ||
> > > -	    intel_dp->psr.is_dc5_entry_possible)
> > > -		val |=
> > EDP_PSR2_IDLE_FRAMES(psr_compute_idle_frames(intel_dp));
> > > +	val |= EDP_PSR2_IDLE_FRAMES(psr_compute_idle_frames(intel_dp));
> > >
> > >  	if (DISPLAY_VER(display) < 14 && !IS_ALDERLAKE_P(dev_priv))
> > >  		val |= EDP_SU_TRACK_ENABLE;
> > > @@ -2815,20 +2723,10 @@ void intel_psr_pre_plane_update(struct
> > intel_atomic_state *state,
> > >  	const struct intel_crtc_state *new_crtc_state =
> > >  		intel_atomic_get_new_crtc_state(state, crtc);
> > >  	struct intel_encoder *encoder;
> > > -	bool dpkgc_configured = false, dc5_entry_possible = false;
> > > -	bool wa_delayed_vblank_limit = false;
> > >
> > >  	if (!HAS_PSR(display))
> > >  		return;
> > >
> > > -	if (DISPLAY_VER(display) == 20) {
> > > -		dpkgc_configured = intel_psr_is_dpkgc_configured(display,
> > state);
> > > -		dc5_entry_possible =
> > > -			intel_psr_is_dc5_entry_possible(display, state);
> > > -		wa_delayed_vblank_limit =
> > > -
> > 	intel_psr_check_wa_delayed_vblank(&new_crtc_state-
> > >hw.adjusted_mode);
> > > -	}
> > > -
> > >  	for_each_intel_encoder_mask_with_psr(state->base.dev, encoder,
> > >  					     old_crtc_state-
> > >uapi.encoder_mask) {
> > >  		struct intel_dp *intel_dp = enc_to_intel_dp(encoder); @@ -
> > 2837,12
> > > +2735,6 @@ void intel_psr_pre_plane_update(struct intel_atomic_state
> > > *state,
> > >
> > >  		mutex_lock(&psr->lock);
> > >
> > > -		if (DISPLAY_VER(i915) == 20) {
> > > -			psr->is_dpkgc_configured = dpkgc_configured;
> > > -			psr->is_dc5_entry_possible = dc5_entry_possible;
> > > -			psr->is_wa_delayed_vblank_limit =
> > wa_delayed_vblank_limit;
> > > -		}
> > > -
> > >  		/*
> > >  		 * Reasons to disable:
> > >  		 * - PSR disabled in new state
> > > @@ -2850,7 +2742,6 @@ void intel_psr_pre_plane_update(struct
> > intel_atomic_state *state,
> > >  		 * - Changing between PSR versions
> > >  		 * - Region Early Transport changing
> > >  		 * - Display WA #1136: skl, bxt
> > > -		 * - Display WA_22019444797
> > >  		 */
> > >  		needs_to_disable |=
> > intel_crtc_needs_modeset(new_crtc_state);
> > >  		needs_to_disable |= !new_crtc_state->has_psr; @@ -2860,8
> > +2751,6 @@
> > > void intel_psr_pre_plane_update(struct intel_atomic_state *state,
> > >  			psr->su_region_et_enabled;
> > >  		needs_to_disable |= DISPLAY_VER(i915) < 11 &&
> > >  			new_crtc_state->wm_level_disabled;
> > > -		/* TODO: Disable PSR1 when vblank gets enabled while PSR1
> > is enabled */
> > > -		needs_to_disable |=
> > wa_22019444797_psr1_check(new_crtc_state, psr);
> > >
> > >  		if (psr->enabled && needs_to_disable)
> > >  			intel_psr_disable_locked(intel_dp);
> > > @@ -2902,12 +2791,6 @@ void intel_psr_post_plane_update(struct
> > intel_atomic_state *state,
> > >  		keep_disabled |= DISPLAY_VER(display) < 11 &&
> > >  			crtc_state->wm_level_disabled;
> > >
> > > -		/*
> > > -		 * Wa_22019444797
> > > -		 * TODO: Disable PSR1 when vblank gets enabled while PSR1 is
> > enabled
> > > -		 */
> > > -		keep_disabled |= wa_22019444797_psr1_check(crtc_state,
> > psr);
> > > -
> > >  		if (!psr->enabled && !keep_disabled)
> > >  			intel_psr_enable_locked(intel_dp, crtc_state);
> > >  		else if (psr->enabled && !crtc_state->wm_level_disabled)
> > > --
> > > 2.34.1
> > >

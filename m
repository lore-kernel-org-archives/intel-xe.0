Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F8BC44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 20:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C4010E4CC;
	Wed, 22 Jul 2026 20:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aeYYSou4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07A010E4CC
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 20:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784751187; x=1816287187;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vH9wICF88vz0/JF/wJc+e2L6NlW2SD4M/+AQQIzjftA=;
 b=aeYYSou4AWyyJxMxn/LFHneNIDaCJV7joWK32Cv0TbUntcUOxv24yToa
 JllBo7bUs5/D4qOoI70qXoM0ml5zPqc/LHI6uYlvgfpBfylxfC4O5I97U
 NYjQL7u1i/IECBuA13d/nxSiO1ptHkCphntMzQwx2smGmdrnn6xUbaTsZ
 14vW3YuFfI8HOMO5nDhbVYWNiYLvUQj3rRjrf2d325ujoswKEccqqJ4IF
 9J5RGIt+swXAvkfDJ/kxiOXyKnQAp+G3pRa8K6+xBDPIgxmwu4bzgs7W9
 4hBomR7Cxmk88NYNDNmmvaTDJbrZEMLd5uDyqpR+ShbHMg6rVvBfkOD1s g==;
X-CSE-ConnectionGUID: iBiPXjOGRRuPFozdRw603w==
X-CSE-MsgGUID: FSZRxHZ4R1WCRNKmzcw2WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="72939734"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="72939734"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 13:13:06 -0700
X-CSE-ConnectionGUID: /r0Wum4ZQZWamH7IX6t3Wg==
X-CSE-MsgGUID: TQpCJJqRTC2MDHCeknSucg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="260147765"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 13:13:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 13:13:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 13:13:06 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.21)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 13:13:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHhxKw2kd3on6+flo6VOaDG7WqwjIkDYhjNexpRLGoLUyU31VhGkuRyLtHfMVzQYchsTnBuLIVjO8dAKoeVrNZefvI4gIO/BdJqAaDxWmBFUvAmCQG6NBy8X/C/NFqz3fRVIooKcdu1A7FNNmbjw+007DcQg6yz1BTeKVLkS6VcxIF8ZT0YnITs+9F1cSfgYGkD8Eu+ksuJ4VQfUZwoZzdJIGzQ89vmeYNNTeaXVv6t4jXj1RiilkVBbcp+EnZT3TKPEahbpHPcns2brfrGLrdbEH+zXn8v4o2EjZebP/Ay7nTP557Ff5tKL3Rgf3vB254zsh6A947nRhuPLNH6nTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNiCuCGQ/ddzdUC7L2DHZxfrt0q/iVnhZ6zZM0uUR0c=;
 b=BWKSFukmWBK9Pb75TjYDGGnzAwxyW9q77ES4JaAAtgVh5muY3NWnjD+adTio/1CrU8hbdFySn2tjH1j0fzeDKIiQEJuQXDvD/R6P7pVOAZ2DeLM1qzShC2VdqqK1jbrO0dKy6EzRkFjgLMvgs7EoPyLzKdJv+S4h3dyExPwEDE6yi5+LXrZkZWmkS87xz4dDRyaKf9le4kdjGXsfRpVN7wqOccHD6mz+8DnErnYAX86zRKpMCWAuGnzO2Q2l2kVKLk1ZVbMjRzc4dL+1pZrTtxWcrPlPloaw7eYrRolZ7NPUe5guOWdZZApK9Hkw91MLMiy+J1gLJM1ke70S9SD8+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DSSPR11MB9644.namprd11.prod.outlook.com (2603:10b6:8:374::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 20:12:57 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0223.017; Wed, 22 Jul 2026
 20:12:57 +0000
Date: Wed, 22 Jul 2026 16:12:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Julia Filipchuk <julia.filipchuk@intel.com>
CC: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>,
 <matthew.brost@intel.com>
Subject: Re: [PATCH v6 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
Message-ID: <amEkRTttC5-ldITs@intel.com>
References: <20260722180605.2498906-1-zhanjun.dong@intel.com>
 <20260722180605.2498906-3-zhanjun.dong@intel.com>
 <7367ab63-127e-4926-933f-d529b72d5faf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7367ab63-127e-4926-933f-d529b72d5faf@intel.com>
X-ClientProxiedBy: SJ0PR13CA0121.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::6) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DSSPR11MB9644:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b890cd-0027-4ef9-0e38-08dee82d9ec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: IbGq2b/UAmiibItRAqEwyEEOKoFfo3Fb25jlwMJUO1D/vqPvs1EQ+5Oc9WUcQaVfIv0pZaoOyslDyTI0EWeBK8UzKOvlY7itGMXYKXQaOcvc2MQG2EvKozf2qKOX5vgU9BS/YEjUWfFHHpixFYRvctTjZy9se94ufKwB3KNnXWKharP28YoILonvMtVSWou5/FtlOD53Yr8EJ+75e56POvpJ1TYAJThjJyTxuDeASi4swU/GoGCj6eJzC8Y1Slrt+WUiQ2VtdTV9gMeIhTp57RmxyV6laa/BD3RxXltXPb4doTSz39HiUgL7iyng1OhQZguCwwbRrJc3OkkqXC+wWiJFDgRGbe3NEuu+DWNo1J4NjUh2FELdpBC01VI7pxtcoAFyWXyrRTctEvLUrKJY8oo/wQm9+kWVqNgUZor2+q/0kxNXyHyhfK5HDkmgyQCwm2uXHkF93DZVp5ZIctdg2d6yPAW820KKtUQvByZR+8GGqtAKMj/YYlGO391SG3oX3K1ijs8RpzNNPgg6jBkJvs6mHc7kY5Fuug6A/SgU8OucAAf7DZoMGuuDQLs7XIUtswXqxx4llBIVGAVyWfDHSjGkFmmiezOjmO3dwJYjlIk1nkpRkF5yRaRbW1S/whMp6evYzVSQXBqEZXVKOQV0/CcysHe7uS4QzULs2o667O0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6BopKpW5uHV7AS8tXtUBkonVBiEsVMzfYSrCRssX58g2Qo434B3TaiPGKjfq?=
 =?us-ascii?Q?ph2lxmnV6pwil0w29jzOddvL7UmI1NpMqNH3wKCnAPf/DqJUzAAQhwmhc6Od?=
 =?us-ascii?Q?gkSZ1mt6oVBqierbMrPB4PZ2OXGIpA5ZlCI3dj1CGMMdq+P4orxVYAiiv5RH?=
 =?us-ascii?Q?D1GPHmWwSsqRbUykWG5uzqPfDa49bh53oUwCn6E2eEsoWPqP3xpaC1GJP/ui?=
 =?us-ascii?Q?0WTTbvsgRDC6k2aHQn7to9ygT5oWtzeV1Lh0cuX8eDyRKyUy0JfXVmzmIKan?=
 =?us-ascii?Q?9r18sdfULyVR17xEXZilWcbOTCZ75P/b8Obo618wxr7gRZFV3bcDKv2gu768?=
 =?us-ascii?Q?soPld8iA4BMztBTwPM3NkGFSomrRyCJxH64Y69Z4Mz1T0rxbOf0haxOVgo4f?=
 =?us-ascii?Q?i5i+YNdwTorEijXXgbLWPc8tpqT3iz3FuBrG7ZLlDgkS4R5im74JTWsbEuyk?=
 =?us-ascii?Q?GkJ38B3aeAPSOsoOE1XvuyZ1jx6KHLCEx44Ky/uSv8MSjQpY7EHqDk8mH9UI?=
 =?us-ascii?Q?+KLpyfzi39tt3e0JCoUSK4g4jlsLjNnpy32GTakzf9bzz/OFSbHqenXpojQT?=
 =?us-ascii?Q?7FwyxyMwz73OZtQm5UGUk6AY9Sy0qkJTdfi/OTJvrfZJ806L6YpNbaIeJSX0?=
 =?us-ascii?Q?S3H6Z+lLQ2nxol0kRbJ7Sapd7RAz6hZMks7NzqZjciXi0+++tOMxI8BKy8sx?=
 =?us-ascii?Q?R+LStuoYcaCEdKgRS3EW3Lq5N9Y7ylBVgmFe+Yck5Ja8WUsuDz6k8G6SDa7V?=
 =?us-ascii?Q?5DwyTHeYNfv8haR9QjI/Otgf9CtzQ12wQIUadRsRv3fLsCPwE6tPVCzT0eRw?=
 =?us-ascii?Q?1RRD8/wNevO2L65Gf49iwU3mmvfsEEV6fnuXHLjbNFVy8cK3J6yVoGGQrjbj?=
 =?us-ascii?Q?dYZnBt7ziBfe4ZUHVxLo31674e/UesGpWFk0MOP4oERX8Wngrd0o6lTR8LKa?=
 =?us-ascii?Q?8MEHnXCLo7WzxdMVDMJ3pVZ/MbTfCFpx3o8R3ZCcc0oLwmbynDs0ofJ9THE8?=
 =?us-ascii?Q?Pl6/b9ppCWGCCtW+HP23BezJIlLUOARHWlruw8UYyDoS1trFLa/3njIzIhdr?=
 =?us-ascii?Q?62jzIzcot9dSIVqQOCDQRAgMj+mxyUGDu+GEenXfPJZ54iFLB2rWZt3uEf0t?=
 =?us-ascii?Q?ZtoICdrp1OEuN2ps02i+0choUnimlXimZ3jvAV1sskY1YvdYaDX7XUTUD+9L?=
 =?us-ascii?Q?CmeAR1fNgvcdRp6SMuW/fZMaBPCM8smk8/9BMbqJs0xDewlSI3sbxZmjuGmM?=
 =?us-ascii?Q?VDq/bC5+vkUH7wmBCNC3YMCjnsOwAduRog3VjtGunZZnjFIwwMxL9A/d+dNo?=
 =?us-ascii?Q?LeuonXHkGdkSkWLbEpGNgZiLR+5XCDJgj901/1jDehmDXlGQTQpahfOvJV0E?=
 =?us-ascii?Q?fwA5AW9/1HA7/stCtLDtbbd2MBNmYSW3hxjlOfTGL5bzuYrIzTY5gQ4A4F6r?=
 =?us-ascii?Q?s9LvI26/MtXEvWo6Y3Y462p1SkllXCsNNrOWNq83RgNYFHk50EtIOLQHIZiw?=
 =?us-ascii?Q?UunK1qjaK/Cs17fA9If6lnS99UWCuQMoN80V3bzZdm9HBXlcGHI5KrSgiJyp?=
 =?us-ascii?Q?1UZAs7cCYpBGje+pfOAb1zgoNIxUn3L4VdhdtkBDH4EIkbSgDMOOartuYBWj?=
 =?us-ascii?Q?vriAcmk/EHBTEHuYiufg62+nneBGUOXldPy6yGeD2VuOGAYFrSUnQx5D1yZF?=
 =?us-ascii?Q?uFCxX3xBudMWnlY8KpoZk/ZXYPNn/T2IaWnkJO+kD5rhR/SlIHLl67KvN9vS?=
 =?us-ascii?Q?kZMaekujWg=3D=3D?=
X-Exchange-RoutingPolicyChecked: MsvOGS9AvEps8w7FRmWCJovy35NTPR9ns8cZdVQ8CWZP11iN8sjO9iK48AL2AhU4LYFTTzUSRBKKGwEPfGmGwZBsfCtEiMhA5Pm339JGBYjTMV9WwvDw8cRKAU85hkyCf4G1OiZog4iIDlj5CQvFrbhGLzMQ/q5G3pKe0NY6VspDmf2yow0NCKzX+phKIjWLmOK9HUUFGzJjhnqnWmoNzAkSWgSrq6HE6nW1zl3Zv1/O2Eu/PrI0PZ3+0r4gTOl3ikpVdO2erWkdT3/c3mKYHva6rNEqnJmyogGIdeoaToL8RiSpmPmjCKVZ0H7PnedEKvnNIDDIaKVVX1kkeXvBQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b890cd-0027-4ef9-0e38-08dee82d9ec0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 20:12:57.0535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SimA5OoXya07akez2rexe98m6OGw6KPDw6YfewFkyZlKTK8zgGQCaoBjIz3Wfxd1y+ky1J9kWeNSPLU8JVOmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9644
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

On Wed, Jul 22, 2026 at 12:11:27PM -0700, Julia Filipchuk wrote:
> 
> Looks good to me.
> 
> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

Please do not merge this commit.
It fails to explain the most important thing in the commit message: the **why**!

It has the change to bring regression to existing tools as well.

Thanks,
Rodrigo.

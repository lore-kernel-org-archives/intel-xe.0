Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115CCC282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 16:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B017910E487;
	Mon, 10 Mar 2025 16:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQEcgbWF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B870D10E487
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 16:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741624847; x=1773160847;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pDazTBTABnd5kWUN1317kZTqG5bkMsTzlfcjufiroiw=;
 b=WQEcgbWFw1jaNkw7bM3GH0DOhcFdGoC0sCBu+7vmtWxVviH3RfsJddfT
 Bc4dQ2iefr0ZMRDV4jsp1n2TfRlpSY1YI5EfDzMlMv2UffiwgkzLQ1Yb9
 6mbRvrwnLJNpwh4B49hH3ary3k9B2KelMejMe4NHRgFzOo7hqaywxCHbp
 ZL20wGzv2BSOclBl4Qk8q1rI6wyvwYnsD95DBHZbbyt2V1BxsEIU7Xy3j
 py8EyIuNg0qmBpE75rByvnYVhOvmpL8LJfNP3JYc2fOYibZePEJZ9KwDq
 6u7yzE/kHkcEwQ2P443lP1ENCxEW9y+1xvDNyxHVYBCy9DoWMIFawXL9W A==;
X-CSE-ConnectionGUID: Vbx8H/s0QKeOL0RJxxnyBA==
X-CSE-MsgGUID: wtiX34hWTNWxwO0bZt9hCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42481287"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="42481287"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 09:40:47 -0700
X-CSE-ConnectionGUID: iyjiveq4R7yU0aX+TimYJw==
X-CSE-MsgGUID: x/PNwFyhTguOREVh/8G6rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="125089841"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 09:40:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 09:40:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 09:40:45 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 09:40:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYv7C9uHgQLx/O7lpEN6MzHlg/xahGJoHONBw+MCP+y+kRQVmfAT5HYMpGdVOynbNMRGfljxHUf+rg27ngPoVf/89rBvQLY6g27YrbVBeCSSxVgd+7w41kodhidms6e/yu9LY/tqnNhSCZZhDCrolTAFj43PuqFaKDZfufd8Z5vdXJ6r/CV43D048q53sbwVo1CoTewVXkawq+G432cFgTsmMN0ePH6qMFZ1M3TvbRDc/GiOTD47vcT0iANvE8zVEtB6sQfocAmauAhG63EMpwXGE0XJdrr8gkruzne1m65JMLzmYzFbDR0Irh+2I4BQuUGPxIy98Ka9/K0VSXgQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=101tnEVQcYElU6+678rluOd5PSZID6k3iuGjqJRcO1w=;
 b=qghn4eJxibKOTeSGeENomAd0Rq9iy6jb6fROQUStu9OKvIE2pOnfsu+inP2ESNq95pIikMSqjmX1J1ndI9oen7/9hUd68yi7G/mNoqUDmFBMXBq9lDstxnkaQoDMwMYvUl69uhekmN5NOja3tst4gGo8SSatfN10SVEvO8hQCTXfE/mX3XUD09EVVFQCDu0w3vX+QGhpm5ZmCUl86YmgeHC6ncaKq7Pr7CCkSYLWsQ6UH6go+xKOy/oBgkkiuCLqpoViUWAgKoF2olVIjKugw1+++xK3VOguOEK0iH16N49bEpcXyX2krNVcYEE5SAK9YsOgxCI/Fa3oY5q5RcnmNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by PH8PR11MB8016.namprd11.prod.outlook.com (2603:10b6:510:250::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 16:40:43 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 16:40:43 +0000
Date: Mon, 10 Mar 2025 12:40:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] RFC drm/xe: Add configfs to enable survivability mode
Message-ID: <Z88WB7oI6hwbzteq@intel.com>
References: <20250307142446.1790715-1-riana.tauro@intel.com>
 <20250307142446.1790715-2-riana.tauro@intel.com>
 <txoeuk2zlt4gotrzltt3cjtzf2u4ebsjtjicvtsa4a4iz5o5eo@oqgl43byhdoe>
 <bb979148-ec3d-43c8-b73f-e22476f9a809@intel.com>
 <xgmworhkqvbo3gr6toa54occ7tanxjimgyx43pzoojf3li4wxf@7imyzpy5vurl>
 <7024396b-0356-4723-bc75-4cb6f6a05cd1@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7024396b-0356-4723-bc75-4cb6f6a05cd1@intel.com>
X-ClientProxiedBy: MW4PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:303:b6::17) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|PH8PR11MB8016:EE_
X-MS-Office365-Filtering-Correlation-Id: 7005e1c5-38d8-45ca-9e7e-08dd5ff24c7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GmN7FPc97UDPYgiJqVc4aQIH5QiaURIEyhqZXc/uS548DiecsdCh554Or1?=
 =?iso-8859-1?Q?53g1FbDmXEFPg2Y/McNCqhvS/LUPEGDLEuOvtEZXR6FawUxDmZvGcYD59D?=
 =?iso-8859-1?Q?918oxFVx97pd2hB0oj7UrBDnMQdckUdRRY8sUrjjnuxgfbFceCSsmL1VDg?=
 =?iso-8859-1?Q?iyvwGtxYr99fUMZmfoOBZi+alMjVSWEyfm7caJPFee36kAWraFT4FoVcap?=
 =?iso-8859-1?Q?D+icSl+vIfbbFkhzMynCQG51fOWwfRHbZe2IoUOnHWxw/s/FSdL3X+N7LI?=
 =?iso-8859-1?Q?v68TAL/xXa9urHpOOoeOAjE76QNpisHyi7M1XYRFjGwz0BjxihPhVYNDKL?=
 =?iso-8859-1?Q?81pU2iNmzqUK43vk9LzjyXxNC5+mcc6Qb2JZxrCTN80xf+dZIs9hs1VYGE?=
 =?iso-8859-1?Q?ieTlv63gibIUGRTLokQrPpZetmOSDnfUQqYn+olVtJpWCBWMpX4ILjFgcs?=
 =?iso-8859-1?Q?rAn9ife6FWbuORcn9eoKLFxZUg36BpTRrSTZXrH7htygt0nT9wKeW5WJJd?=
 =?iso-8859-1?Q?QXNmP4EHHIwGvMdZAiDSYNTBpbHpPgUZbV5D/LBlBMYy6QGzizg6PBx4Rw?=
 =?iso-8859-1?Q?SvUd8SWjeqdGGUCRXG1buUgI0MR5+vQyOQ37kkwgj5l+rtiYgTtalaHxjJ?=
 =?iso-8859-1?Q?dPTmtcI+N8g1y3GLRmD0Wo1Klx1M/GH0ff7qILUHAWhfkY+B2o9VXniSJL?=
 =?iso-8859-1?Q?NOYkep1Z9PG8tOoMLuIe6j2ru1LwQr5QW+GF0WWUxtrSxnq5YzjzIwYdiN?=
 =?iso-8859-1?Q?EVNAMHu5bbRHM+OCE+G6/tMYqjudBxFtLk1uJpB9lqme4KafeQVcRFleuP?=
 =?iso-8859-1?Q?e4A+RFbvRuozDCySC0Vzzu2RMZyzmO1gJXqv3j4+8IBW/+/gCI+lXJ+2RJ?=
 =?iso-8859-1?Q?Xw51fYOhkmOnushGWfAB0b6MTXMJjfpgStr14r1A0EPwqHFSuV44f47Kvz?=
 =?iso-8859-1?Q?ttLxX4c5UxHYFs/W7DQhSh0U4ajEwCoCpsRUMIqnKcsaC2Ppfw3f+Vxx5D?=
 =?iso-8859-1?Q?DzzNMXSw6MRILHt1ZC8FggW83j9RqBFX3NO0avVPbq5cTsrjY87h10xxdT?=
 =?iso-8859-1?Q?Ve+7n51SdOw1nYv/wI3SjrQ8OmAbkZwUCNRpwetC3rmCPbU8vKLgWNzNjW?=
 =?iso-8859-1?Q?oruDMxdEIwg61rX5qeaa9rB4hyHAdyjnwwjpFqJcipB6Jyz2bTyLfI82Fr?=
 =?iso-8859-1?Q?kz3aaKbBDCEUCAbyJXmKsA+d9GhtI+l/nt16LwJ6Fy/R6qVhv21UPCpUQv?=
 =?iso-8859-1?Q?V7RtNoQUYWOC8ZKv7aLJ/cr0capAGLNBT7qvWVuVNBHEp6pDG0hujgiWFY?=
 =?iso-8859-1?Q?Wl+TzEvceb0M6bpRjPF5GVHlnN31hTLbcDu9bHNWLQ11yzslysyZAn2Brv?=
 =?iso-8859-1?Q?f5btlIVauYPmmfvy/muc8iLewDzljMRLGuc6KdfGYsxqAPel5bR/QPmlkp?=
 =?iso-8859-1?Q?tZYWnHWeQl0RMalK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FIr11dO5a/PBQC6CN9ZmpmVrKGfLQdGd2H7tmCXNw4odrdTILGob9GweGG?=
 =?iso-8859-1?Q?9IBhxvrkODRZCfJXFX32cACwRjhSpVL7fUWdbk3QU4O/UMV01gcu2va+Nk?=
 =?iso-8859-1?Q?YaEe8XA1QFA7KTw0mHFq/NjQJGmGpjCioa956+NRnLWb0sMbLZiiy1l98l?=
 =?iso-8859-1?Q?niGa8tj0DUJR6eR3py4o71slok9iCZixUG4BKk9Wkv5RcFh7RBHrpLIYyX?=
 =?iso-8859-1?Q?K7L57rmRxgX49j/V1G/ILdy/2lQ5D8oZ8Vnpxzc027gu6fMKUXLZ47rf4A?=
 =?iso-8859-1?Q?eP7Ngbx+G0yFRJ11tndeqz2NnUWBFsC0JMpa7VjL8MR+RzJFmY86XAPPWP?=
 =?iso-8859-1?Q?qYUDyYD2gJxMG9Ighv9nI3cnlwUVXjCqwEAbiCbHXyFIHHq8e1HQtAul3B?=
 =?iso-8859-1?Q?QEEijNjJR7z5faIMGs0Uv+HH5FYZ1fGfibVpr1r5oVjMR/U9opxfNmN/fP?=
 =?iso-8859-1?Q?pBqNcZYZu7oxbqXI+fqCwQxlD1ob3DUiNza6TvzRU6CgHZmTWD5wSIYfUt?=
 =?iso-8859-1?Q?TsCJ/7YylneYBOJbPeB2jwuq2aB2QR8aXI0mUbo9Z+Exy68PWmeQ2LhrV4?=
 =?iso-8859-1?Q?UrLWLDNMpPEqo0TVwB/4AxCQ9LIZCVbV9IwYrYbuml4UTddLVQ5NGVNyrJ?=
 =?iso-8859-1?Q?50vsfhtFyJW28Yn1htJJ7/gE8r7H2MGFhibueYXRDp1Y4OTduNeN7eACQq?=
 =?iso-8859-1?Q?AhN+aaSuby7PGX5FRf1lvqZ9BMr3YzY57GpT7CWhtw7mtogrI8MQiLVY1Z?=
 =?iso-8859-1?Q?lzMSArgm66LHAhGg6JL1ZYP6AKNYSO4rnAQzSDJP3CuQHCX1kmrexrpZHs?=
 =?iso-8859-1?Q?Llw9vIYb89oVWKarcCu2wbiNprcNcfFQXp3o2EUDR6PNhvbCPltf8czVQP?=
 =?iso-8859-1?Q?lAgWUzyX0e4jvru3DrvKEhVYD2eiCvzj+t0Wnu/bPhIfqQO98B0QMS57e3?=
 =?iso-8859-1?Q?wK49vQgIwpItmj7q03td+U3z1I4ySffbgXkwyHhUl7eRNsqMS9Q/p1Ym19?=
 =?iso-8859-1?Q?H9+10YcM186M0SEUYqqHgn3mwRbhdD9u7/qgAa75fatVh6wwiWzQ8GoApm?=
 =?iso-8859-1?Q?MxUrQDATZG6IVeizcc/JsR3Uqnvvl69BluL5feUEs9AAg+r72TvjlMSXx/?=
 =?iso-8859-1?Q?5sIX9KUVKbqqst1b8MtyGZHy9P97XOXTVpfXdG+hpJj3wI9VxuB08uGaMV?=
 =?iso-8859-1?Q?hJtpYeqwjhZvA63zPjFV1RUqyrHRhjciOuS2TbrN6dcX9HX8NSqOZIzCNG?=
 =?iso-8859-1?Q?6Vu6jcdNveVpDLzbFT+hjbwhnoKgpV+5eCeGTHQkjXaiO0ec6O4oZRK6jr?=
 =?iso-8859-1?Q?d4XJzKHQd1AEbKcoU6xnF/AIDijPqKLOjS4VM84SEl8ZrxwAAS/+0AQtxy?=
 =?iso-8859-1?Q?IOqnh+5OFQ0RiBblYHXRGeHCHedL2WM6ceu+7+k7UIYJPZY8xivbVyVP8u?=
 =?iso-8859-1?Q?xXQCqEAN5c3UCswa4JCK6+qkdDfiiQ4I2wr/llJNqRPVG7aa3MH0hNhlT1?=
 =?iso-8859-1?Q?jIWZ7/kvgmxoipoDG2Z6SyLe3nktbmFe9T98HVLaT3n66YHB6/QTv7pXbT?=
 =?iso-8859-1?Q?UHd1JszIhsTLf1Qm+Bu3c6JgD3C+I238bNNmXtM+aGPysvjggca8/0ECll?=
 =?iso-8859-1?Q?yCVfMNm3Vb43N60QveGbAx8L9xiy71VbPZkHpOduOutKzH19gihg3WiQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7005e1c5-38d8-45ca-9e7e-08dd5ff24c7f
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 16:40:42.9333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXmygH0p4F8BEsJfQAHymKgKd3DG5XP5Jfu/vZE1WsqIzVxB7DUh4QJWlFUMDaf64vLYogP9kuc8DzUJ2yeUqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8016
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

On Mon, Mar 10, 2025 at 07:53:27PM +0530, Riana Tauro wrote:
> Hi Lucas
> 
> On 3/10/2025 7:01 PM, Lucas De Marchi wrote:
> > On Mon, Mar 10, 2025 at 11:01:50AM +0530, Riana Tauro wrote:
> > > Hi Lucas
> > > 
> > > On 3/7/2025 8:46 PM, Lucas De Marchi wrote:
> > > > On Fri, Mar 07, 2025 at 07:54:44PM +0530, Riana Tauro wrote:
> > > > > Registers a configfs subsystem called 'xe' to userspace. The user can
> > > > > use this to modify exposed attributes.
> > > > > 
> > > > > Add survivability mode attribute (config/xe/survivability_mode) to the
> > > > > subsystem to allow the user to specify the card that should enter
> > > > > survivability mode.
> > > > > 
> > > > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > > > ---
> > > > > drivers/gpu/drm/xe/Makefile      |  1 +
> > > > > drivers/gpu/drm/xe/xe_configfs.c | 95 ++++++++++++++++++++++++++++++++
> > > > > drivers/gpu/drm/xe/xe_configfs.h | 12 ++++
> > > > > drivers/gpu/drm/xe/xe_module.c   |  5 ++
> > > > > drivers/gpu/drm/xe/xe_module.h   |  1 +
> > > > > 5 files changed, 114 insertions(+)
> > > > > create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
> > > > > create mode 100644 drivers/gpu/drm/xe/xe_configfs.h
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > > > index 9699b08585f7..3f8c87292cee 100644
> > > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > > @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c
> > > > > $(obj)/generated/ %_wa_oob.h: $(obj)/xe_gen_wa_oob \
> > > > > xe-y += xe_bb.o \
> > > > >     xe_bo.o \
> > > > >     xe_bo_evict.o \
> > > > > +    xe_configfs.o \
> > > > >     xe_devcoredump.o \
> > > > >     xe_device.o \
> > > > >     xe_device_sysfs.o \
> > > > > diff --git a/drivers/gpu/drm/xe/xe_configfs.c
> > > > > b/drivers/gpu/drm/xe/ xe_configfs.c
> > > > > new file mode 100644
> > > > > index 000000000000..8c5f248e466d
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/xe/xe_configfs.c
> > > > > @@ -0,0 +1,95 @@
> > > > > +// SPDX-License-Identifier: MIT
> > > > > +/*
> > > > > + * Copyright © 2025 Intel Corporation
> > > > > + */
> > > > > +
> > > > > +#include <linux/configfs.h>
> > > > > +#include <linux/init.h>
> > > > > +#include <linux/module.h>
> > > > > +
> > > > > +#include "xe_configfs.h"
> > > > > +#include "xe_module.h"
> > > > > +
> > > > > +/**
> > > > > + * DOC: Xe Configfs
> > > > > + *
> > > > > + * XE KMD registers a configfs subsystem called 'xe'to
> > > > > userspace that allows users to modify
> > > > > + * the exposed attributes.
> > > > > + *
> > > > > + * Attributes:
> > > > > + *
> > > > > + * config/xe/survivability_mode : Write only attribute that
> > > > > allows user to specify the PCI address
> > > > > + *                  of the card that has to enter survivability mode
> > > > 
> > > > I think the desired interface is actually that the user mkdir the bdf in
> > > > <configfs>/xe/. This populates the available config entries that
> > > > the user
> > > > writes to.
> > > 
> > > Initial thought was mkdir bdf, but since it was a single attribute
> > > and after a offline discussion with Rodrigo, did a simpler version
> > > to get comments on the RFC patch and if configfs is okay to use
> > > for survivability mode
> > 
> > I disagree on the conclusion as then you are moving away from how
> > configfs is commonly used and also making it harder to add new
> > attributes in a uniform way.

My bad, I'm sorry.
I might have created the confusion here.

> > 
> > > 
> > > For survivability mode, below procedure needs to be followed
> > > 
> > > echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/unbind
> > > add bdf for survivability mode
> > > echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/bind
> > > 
> > > After the device is removed directory has to be created, the bdf has
> > > to be checked if it belongs to xe driver and then attrs populated.
> > > Even i think mkdir is better in case other attrs have to be added in
> > > future, but for unbind case the check of the driver might be tricky
> > > .
> > 
> > I think you are talking about the mkdir in the wrong place. It isn't
> > related to unbind at all. The sequence you mentioned is just because we
> > lazy and let pci auto probe the driver. Under the hood you are doing:
> > 
> > 1) load the module
> > 2) bind the driver
> > 3) unbind the driver
> > 4) bind the driver in survivability mode
> > 
> > The sequence we should actually have is:
> > 
> > 1) load the module
> > 2) bind the driver in survivability mode

No, this doesn't work for the use case we want it.

The goal is to be able to only move one single device to the survivability
mode at runtime without disrupting the work that is going on on other devices.
So we cannot unload the module and remove the autoprobe.

> 
> This is what i meant.
> 
> 1) load the module
> 2) bind the driver
> 3) unbind the driver
> 
> 4)  mkdir /sys/kernel/config/xe/0000:03:00.0
>    echo .... > /sys/kernel/kernel/config/xe/0000:03:00.0/...
> 5) bind the driver in survivability mode
> 
> 
> At step 4, when creating directory. The bdf needs to be validated, ie (it
> should be pci_dev that xe will probe). i checked the struct pci_dev but
> didn't find anything.
> Will have to match the device id against supported pci device ids.

I don't believe we need to run any validation. If admin creates a file/directory
with invalid address it will be just ignored, no?!

On the probe we only get the directory, file for the pci device we are probing.

> 
> Otherwise, there might be wrong non functional bdf directories present based
> on what user provides.
> 
> Thanks
> Riana
> > 
> > You shouldn't create any directory when unbinding. It's the user who
> > should create it. When **binding** the driver we should check what are
> > the extra configuration available and adapt the probe according to that.
> > 
> > For that we have to disable pci driver autoprobe and tweak the
> > configfs settings:
> > 
> > 1) echo 0 > /sys/bus/pci/drivers_autoprobe
> >     modprobe xe
> > 
> > 2) mkdir /sys/kernel/config/xe/0000:03:00.0
> >     echo .... > /sys/kernel/kernel/config/xe/0000:03:00.0/...
> >     echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/bind
> > 
> > 
> > Lucas De Marchi
> > 
> > > 
> > > The attr is WO and any value can be written, only if the correct bdf
> > > is added in the attr then it'll be used on probe to enter
> > > survivability mode.The current patch only checks the format and does
> > > not check if bdf belongs to xe.
> > > > 
> > > > > + */
> > > > > +
> > > > > +void xe_configfs_clear_survivability_mode(void)
> > > > > +{
> > > > > +    kfree(xe_modparam.survivability_mode);
> > > > > +    xe_modparam.survivability_mode = NULL;
> > > > > +}
> > > > > +
> > > > > +static ssize_t survivability_mode_store(struct config_item
> > > > > *item, const char *page, size_t len)
> > > > 
> > > > once you handle the mkdir mentioned above, this should probably be
> > > > a boolean attr like this:
> > > > 
> > > >     drivers/nvme/target/configfs.c:CONFIGFS_ATTR(nvmet_,
> > > > param_pi_enable);
> > > > 
> > > > > +{
> > > > > +    char *survivability_mode;
> > > > > +    int ret;
> > > > > +    unsigned int domain, bus, slot, function;
> > > > > +
> > > > > +    ret = sscanf(page, "%04x:%02x:%02x.%x", &domain, &bus,
> > > > > &slot, &function);
> > > > > +    if (ret != 4)
> > > > > +        return -EINVAL;
> > > > > +
> > > > > +    survivability_mode = kstrdup(page, GFP_KERNEL);
> > > > > +    if (!survivability_mode)
> > > > > +        return -ENOMEM;
> > > > > +
> > > > > +    xe_configfs_clear_survivability_mode();
> > > > > +    xe_modparam.survivability_mode = survivability_mode;
> > > > > +
> > > > > +    return len;
> > > > > +}
> > > > > +
> > > > > +CONFIGFS_ATTR_WO(, survivability_mode);
> > > > > +
> > > > > +static struct configfs_attribute *xe_configfs_attrs[] = {
> > > > > +    &attr_survivability_mode,
> > > > > +    NULL,
> > > > > +};
> > > > > +
> > > > > +static const struct config_item_type xe_config_type = {
> > > > > +    .ct_attrs    = xe_configfs_attrs,
> > > > > +    .ct_owner    = THIS_MODULE,
> > > > > +};
> > > > > +
> > > > > +static struct configfs_subsystem xe_config_subsys = {
> > > > > +    .su_group = {
> > > > > +        .cg_item = {
> > > > > +            .ci_namebuf = "xe",
> > > > > +            .ci_type = &xe_config_type,
> > > > > +        },
> > > > > +    },
> > > > > +};
> > > > > 
> > > > 
> > > > so... it seems you are missing a configfs_group_operations.make_group.
> > > > 
> > > > > +int __init xe_configfs_init(void)
> > > > > +{
> > > > > +    int ret;
> > > > > +
> > > > > +    config_group_init(&xe_config_subsys.su_group);
> > > > > +    mutex_init(&xe_config_subsys.su_mutex);
> > > > 
> > > > this mutex_init seems odd, but inline with other drivers
> > > yeah it is not used anywhere but the sample and other drivers also
> > > initialize it
> > > > 
> > > > > +    ret = configfs_register_subsystem(&xe_config_subsys);
> > > > > +    if (ret) {
> > > > > +        pr_err("Error %d while registering subsystem %s\n",
> > > > > +               ret, xe_config_subsys.su_group.cg_item.ci_namebuf);
> > > > > +        mutex_destroy(&xe_config_subsys.su_mutex);
> > > > > +        return ret;
> > > > > +    }
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > > +void __exit xe_configfs_exit(void)
> > > > > +{
> > > > > +    xe_configfs_clear_survivability_mode();
> > > > > +    configfs_unregister_subsystem(&xe_config_subsys);
> > > > > +    mutex_destroy(&xe_config_subsys.su_mutex);
> > > > > +}
> > > > > +
> > > > > diff --git a/drivers/gpu/drm/xe/xe_configfs.h
> > > > > b/drivers/gpu/drm/xe/ xe_configfs.h
> > > > > new file mode 100644
> > > > > index 000000000000..491629a2ca53
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/xe/xe_configfs.h
> > > > > @@ -0,0 +1,12 @@
> > > > > +/* SPDX-License-Identifier: MIT */
> > > > > +/*
> > > > > + * Copyright © 2025 Intel Corporation
> > > > > + */
> > > > > +#ifndef _XE_CONFIGFS_H_
> > > > > +#define _XE_CONFIGFS_H_
> > > > > +
> > > > > +int xe_configfs_init(void);
> > > > > +void xe_configfs_exit(void);
> > > > > +void xe_configfs_clear_survivability_mode(void);
> > > > > +
> > > > > +#endif
> > > > > diff --git a/drivers/gpu/drm/xe/xe_module.c
> > > > > b/drivers/gpu/drm/xe/ xe_module.c
> > > > > index 475acdba2b55..15b3cf22193c 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > > > @@ -11,6 +11,7 @@
> > > > > #include <drm/drm_module.h>
> > > > > 
> > > > > #include "xe_drv.h"
> > > > > +#include "xe_configfs.h"
> > > > > #include "xe_hw_fence.h"
> > > > > #include "xe_pci.h"
> > > > > #include "xe_pm.h"
> > > > > @@ -91,6 +92,10 @@ static const struct init_funcs init_funcs[] = {
> > > > >     {
> > > > >         .init = xe_check_nomodeset,
> > > > >     },
> > > > > +    {
> > > > > +        .init = xe_configfs_init,
> > > > > +        .exit = xe_configfs_exit,
> > > > > +    },
> > > > >     {
> > > > >         .init = xe_hw_fence_module_init,
> > > > >         .exit = xe_hw_fence_module_exit,
> > > > > diff --git a/drivers/gpu/drm/xe/xe_module.h
> > > > > b/drivers/gpu/drm/xe/ xe_module.h
> > > > > index 84339e509c80..c238dbee6bc7 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_module.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_module.h
> > > > > @@ -24,6 +24,7 @@ struct xe_modparam {
> > > > > #endif
> > > > >     int wedged_mode;
> > > > >     u32 svm_notifier_size;
> > > > > +    char *survivability_mode;
> > > > 
> > > > drop this.. We want a  config struct in the xe_device. It's actually
> > > > allocated by the mkdir in the configs and when we are probing, we should
> > > > find the config instace based on pdev and set the pointer xe->configfs
> > > > or something like that.
> > > 
> > > Will add a new struct
> > > 
> > > Thanks
> > > Riana
> > > > 
> > > > thanks
> > > > Lucas De Marchi
> > > > 
> > > > > };
> > > > > 
> > > > > extern struct xe_modparam xe_modparam;
> > > > > -- 
> > > > > 2.47.1
> > > > > 
> > > 
> 

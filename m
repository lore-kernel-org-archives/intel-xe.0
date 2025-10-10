Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9A7CAC5BB
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 05:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D21A10E267;
	Fri, 10 Oct 2025 05:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kd6PosSc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4FA10E117;
 Fri, 10 Oct 2025 05:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760075813; x=1791611813;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yvq9KGSIUtnY/kY5hKrpkx4FBYFaeWY93u+oY+6Etgs=;
 b=kd6PosScVeTzU1Pnq8dCCRI47SDJ7D7LRbvszd6LG93T4Jtb+2xOjeEB
 QDuc/Gxp/1TE0Ey6imiW87Ma0N6U8qkYqYOFLJ4xrFiQWBWp4OaiFlT8c
 KnOFQGATquoS6VY/6dyLgRZRmowGnDN20I0GGm+T7XeMiVtkjsqvfvT3I
 7JgcXaCFagZ3eE8foH97otPJqslWh1LritmbvBuaSU4uB87VwYjHtuqOw
 LM4W8opGNrhQ7SHdFwLJy0WtN/9lxcDdjjZP/xYBLsIJ0O9Az5QEvWtCn
 /xYEyJfVbmWgb5IyyFswEEK0ulCr/ma8c/rmyk/DbufzDkYA339KOnFf1 Q==;
X-CSE-ConnectionGUID: Mo1XXyQOQX+p08yMzHKPLQ==
X-CSE-MsgGUID: i1VD2p9RQ6CBmAXLJSi5PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62176496"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="62176496"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 22:56:53 -0700
X-CSE-ConnectionGUID: z3983WHmT3+6JT9l1Bv6lg==
X-CSE-MsgGUID: Gplg2zrbQbW+c+0laDzvPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="180145513"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 22:56:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 22:56:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 22:56:51 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 22:56:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSpQHQqSzYTA18x8ryypFozz0rNUGansm6zmG+DjcPrzb0Y/KEvPXwiw//VMM2jueJyF3SGEQZI1tg0CWfawPqhwROzfqWgE76fBF/j4DkwQ2CLGiJtHtGWcNFfDofquN+gBNx8a5HnlVQ76qDOte7hsGTSnKOoEgtDpc2024QtQkG1E9mOW0N/jiA0yXxRTw1hC8R3LS9Ote5SmWkTUHPlEPszIierP8NJiOfVv3XclNi72l5PEB8QvCSxI76rkurm4TUxIVMMIt76QwNy4oon+rrJSO+H02KSmMYEEifNfUwQDsKGYwA26jUy3l8IORhgFHtON3D2Wu+7HoQTe8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDJrJ3s0c7umzcV0PrQvqFVmlLC3f5irRpe3EaNIa4w=;
 b=EZaGNI2IOzckpDaNdCkr0yPArAsL0bLVfv03CF3AzaQxsPO69wemfnL3ogd9mgd2/c0tQfXAmlHgOAyn7vvBvkLzmXOsW5tyeCnFSgU7XuSvh8KDfCNpaIo84cx9jJervl+IKkxD+KxCCCKOmdF/GIw2TcEglTZwBhyQLHymT43ClL9ElpKyW/+rTs8rIsRlV4xXa463r3FjJUbr9sijUYOTmtwW1m9AG2obz9jFRgLIHJKCygHQUHj4ZV6Y5espo4AICUFIe0FJOp6nghXc6IEqzL6F23JKvAFKXd625TLNIFxFXdphcjSqA9ACZlR9eUvrvY62IfR2XzcdH3Y6VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SA2PR11MB5051.namprd11.prod.outlook.com (2603:10b6:806:11f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 05:56:42 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 05:56:42 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Lis, Tomasz"
 <tomasz.lis@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block section
Thread-Topic: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block
 section
Thread-Index: AQHcDZIUOsvG1ggVzUyz8/qLFFc3p7S7OeXA
Date: Fri, 10 Oct 2025 05:56:42 +0000
Message-ID: <CH3PR11MB8434532E4C4F2803549A32458DEFA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250815030936.2387322-1-matthew.brost@intel.com>
In-Reply-To: <20250815030936.2387322-1-matthew.brost@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SA2PR11MB5051:EE_
x-ms-office365-filtering-correlation-id: 1abc8194-0868-49ab-b30d-08de07c1c99d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?VRdNHLLz2rNEFbJJUMzmt6ABrCZo8MSyKP1yWYg+eiksB9IL07E1G6H+PSDL?=
 =?us-ascii?Q?vMy5NyZ8MIfCJ1nepIuEgBQQPDtjguCuzzuIhuqlS68dcDMLJHjYY4RSWyAY?=
 =?us-ascii?Q?uTJHScAEGkUU6ahNUJyHi70SQNLPfa1zofs0LzMU/xhsPptsxgLMHSoxkmAy?=
 =?us-ascii?Q?E1880BQ9iAv/tSMu19s0iY+In2McdwidG0QvHDtiqzDVycs3Up3eCtw6YXmd?=
 =?us-ascii?Q?aCteBB1dAMbGsltAyYRU0G0NdDGn5O0fXy1CIKPVDgBBu9zS5UNICfTKZJAJ?=
 =?us-ascii?Q?ANKrtzhpXyyztREHve/iaHrTQG+Ev7HK0veT7DHobaBGsVYK56xWv93tmAzr?=
 =?us-ascii?Q?pmzLPQfaOD2kQK+sHzgNraDlnUKF1cD/5qqujJF7lEoWQUVQYG892zGrBRqE?=
 =?us-ascii?Q?SNqORTMUSAB6eVTpb/3GIxGPEiVPZbENpJKIX/IZMdr4IyxfoxTHzgBE4jBJ?=
 =?us-ascii?Q?fmXOiIUtpaqLrJCa7u3yqYcsyUapDWju80zNYyV4q2RrM+nMy1Rd1mZiPjGj?=
 =?us-ascii?Q?M3BQ09cc8h+c6x9YnEUcpEWucOeKdmo0Bxe7+4Yehu26jawP3de+LwBhGB0u?=
 =?us-ascii?Q?PeuIJx3Jhv4C9PttPnF76rLshtpEBVXmcLgd/32k8wjLnJ+MdxntoLJmUUZ8?=
 =?us-ascii?Q?5/a5LeWU1tOQJ1RyetM4/vyHsgCHUSBu92DQBzWThVD7gkXv4HGzzsyInJbz?=
 =?us-ascii?Q?RoOGRUV/0SGED67lZa0W3i6zdZIn5qKiwTI55R9606re0ob6pa4r21+Gwrme?=
 =?us-ascii?Q?gNsEqKofkaMIAmGewArNvLmwyj3eowC/tGakBvg44DfCTS3IA/t2xnEjhklt?=
 =?us-ascii?Q?uXTAWsZpzjdKWq+BhuWlGwGSmocBhyilLzYE26UL01Oe3EkwtQ76NWBpoxlQ?=
 =?us-ascii?Q?18oCxsB8tUdQwgB0tVc33Mhg2/dV71o1ucISwBA5iHzR+PTavBTJvo5AWqTh?=
 =?us-ascii?Q?o/U7vvXeeJ7bpO7rFHa8VXlgWR4/1MljjM40R6Ybos+PL5RpIKTQXFoqGbKO?=
 =?us-ascii?Q?JkWZcgNrMiIZAHiwcSzBPp3ENi9piIPTA9/L75H5ZGitDOUNkasS0edfrr5Z?=
 =?us-ascii?Q?KN1hLRSMrjbYICxjvm26Chmv9on2/PQ4QwiAj8aDDzqE63ZkgY0IoXSktfvH?=
 =?us-ascii?Q?ZnnDYedr8TyRJZ7eSSs+paNIr3cGM/+/0d3nC+i6g2X7MDSgcrYHBbzExfOA?=
 =?us-ascii?Q?M1pE0vjbSY1gwjnNX7TJI3T0Bjq76mOZYK/3u0JdL80/x1PRl73sJQNmkaD/?=
 =?us-ascii?Q?B8BRNJ3h1Olr/2SToN3zKxVPOLOUII4uPlBxuds61dGYMP7jnIJTgsSMmD7i?=
 =?us-ascii?Q?0gg2fxNzcmUZNLk2mCad9gL7B4k0f7oKqHpulTDQCYD0GvJyz8aPu1deBhg+?=
 =?us-ascii?Q?6ylbb4akvplZSmBk+G0tSgnvnBrCW+f31Xz0pvlgDFlucdbgzAwOQwHQFWLc?=
 =?us-ascii?Q?4oRxP5kZ1OSQ6+8bUrXHsj0+tSO795uw3mBYK+4yGXqRcqXUmb8wKZKuBg59?=
 =?us-ascii?Q?awhd60nTmcp3i71dfUnDMX/+cTKavE+JosDP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?705Z1sPobxOoPKNLQSnh7inyMkY/KMgiiXsbyR4+IXQ0CAflj3YynN77Lcay?=
 =?us-ascii?Q?vmvRWvZZLE50Bea8LavfzvRTQfwpLEd6qy/glTtiK+4oXL+OGC/CAGNy0nY0?=
 =?us-ascii?Q?XkHAsdf/AHuIbCqVy48eUzbNYSDcOzR3LOFDAShArI1651xj/FSzAJtKsiwE?=
 =?us-ascii?Q?dNYhLzsZqny06Pjo6zvGTXeW/oYt1KEkmIofqUkOT0Lbe2YXAXmgIHhvdH48?=
 =?us-ascii?Q?H9QbXIFjBAOwu/fYBiyAuyTXdwQAhz8zbWOspHfOuOywj+Yxlj9fGbrCBIPd?=
 =?us-ascii?Q?p4Ou2tGa3k2uGR4YTtgBs6p3FqFXoxJHg2SYL+XJI53AM+rOLWYEVwRObjKO?=
 =?us-ascii?Q?INUxw4UMAs5lxUhSQBeb8Qu8H7gUkxZGZPpEZOespZuTpJ78fzLMMVGdb3e3?=
 =?us-ascii?Q?ttTdzplZoTfttzv4nYUilQELJcIjnLVQfd0E6ZjZrj9VrTpi/qe3sGH6y0vO?=
 =?us-ascii?Q?NT6RDHOpVbmGG0qMewOE87tLk10eYK+0E/ytWIhCh04WjBZYBCYwan1ayWae?=
 =?us-ascii?Q?TWnraJmXrXzzMn+0XuYeMFnmh3ivx3x2faRdxXhw5pIJjyAKEEMO43PkASp5?=
 =?us-ascii?Q?/ma+pW9ADZFsd8d6L+uGsbdDuQGf6MbRtOsQv5Cu8tIuPLOZfWagvhajAlGy?=
 =?us-ascii?Q?9rAwdPdL9rrXo5ffE8jqC3ZHsJCOkjQuFefFv3hXvnlqMHHsccCFSdyBaDno?=
 =?us-ascii?Q?r2D9GVRxpZf6l7YIBcQuXLodHWkHxKKycjiLNLCu+rRu6QSdej1cZAAoNwsS?=
 =?us-ascii?Q?wLj6FfkItp4uZDPBIQaMgj1qbqik2hzneQso9Cc1x4bBV02O/o4Q3sspuIMh?=
 =?us-ascii?Q?hFQv4hq5OfWFRehD3Bl8eH4kcADwHoMB1JX1YzoKrNBvJukwU4Vnnj92iaFX?=
 =?us-ascii?Q?FfV6s2LnB5C3zGeaqn5cxhYkPAla/j36Dns0KQDDvb09rT1VLpPbZU48i+sM?=
 =?us-ascii?Q?2JaubJGkL6F0ormTGg0KXNfgy3Gck1XwqvF2Us5+3YuyeSUfc1a/ZXcnaCbF?=
 =?us-ascii?Q?yC9GURy45PYv24/+kG3zboXinClKzOSa/z6gt1i1UdLZbM5tf7+6+b1+rJPb?=
 =?us-ascii?Q?gl4R81aIESf2kRLWyNBuP2v/TaQ+/+vVyHLL0eqQADpy+2Wx589hdmkLAoth?=
 =?us-ascii?Q?ABjXapylKC6cMEGsBitgaIOpJpo7sFdaihJ9WEUXrc9SJmMJPX/QCy6vOXcW?=
 =?us-ascii?Q?9xN+vYxZtqX8oHMi0OddVLkNIQVVl8RndDmelgSO+VC93mXc+Nfyx1Sormp0?=
 =?us-ascii?Q?eI4owVBB2ZIKtN51nLWhtQd3YJULclXAudrR6bEDecu1G1Ln4Tu2e1hZfhL2?=
 =?us-ascii?Q?jgtKRPH1R9S+RsUUHn0xqypmETWpKqpoGBgPlQBSl6oRE8cw/pXbcSW+9tPM?=
 =?us-ascii?Q?X1EkKVz+5BhLnvuwx23TKh2QW+KrMkuRUk3IwOTM7nkW4xzzY9edxdGjGq1v?=
 =?us-ascii?Q?0PV3PKWPBNQtOlegNWI6fBy0/X+vF5ZT2l185/4FbeYU+1gdfFm4ByCJAtUz?=
 =?us-ascii?Q?D5TiSbVQEsEo1oTWLbJ2eB71GBRAFCY07AWA+P7MgUGpMa6goA3SegZ8K9wx?=
 =?us-ascii?Q?YlTpgUiKOItEQiLhzH++3z0SOfz24XxceoVqujjW8BJkXc8BkZLBLv16d6ph?=
 =?us-ascii?Q?6w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abc8194-0868-49ab-b30d-08de07c1c99d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 05:56:42.5279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DsG2tMhxWYZ1Rc4M+OtVgyiLRDdMVWdJfP5VrdOJpTZu2aSkZvfsJ7PdxjZsCjzE2aC4f764vC7MJ0jVsr5fEMHnqEC0JZKXiVPHGeCdBWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5051
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: 15 August 2025 08:40 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Lis, Tomasz
> <tomasz.lis@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> Subject: [PATCH] tests/intel/xe_exec_compute_mode: Remove non-block
> section
>=20
> The non-block will become invalid and hang until the test exhausts all me=
mory
> when LR jobs are tracked in the DRM scheduler.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/intel/xe_exec_compute_mode.c | 113 -----------------------------
>  1 file changed, 113 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_compute_mode.c
> b/tests/intel/xe_exec_compute_mode.c
> index b904dc76b4..316f7322c1 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -320,116 +320,6 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		close(map_fd);
>  }
>=20
> -/**
> - * SUBTEST: non-blocking
> - * Description: Fill the ring and check we get expected errors.
> - * Test category: functionality test
> - */
> -#define VM_DATA		0
> -#define SPIN_DATA	1
> -#define EXEC_DATA	2
> -#define DATA_COUNT	3
> -static void non_block(int fd, int expect) -{
> -	uint64_t addr =3D 0x1a0000;
> -	struct drm_xe_sync sync[1] =3D {
> -		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> -		  .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> -		  .timeline_value =3D USER_FENCE_VALUE},
> -	};
> -	struct drm_xe_exec exec =3D {
> -		.num_batch_buffer =3D 1,
> -		.num_syncs =3D 1,
> -		.syncs =3D to_user_pointer(&sync),
> -	};
> -	struct {
> -		struct xe_spin spin;
> -		uint32_t batch[16];
> -		uint64_t vm_sync;
> -		uint32_t data;
> -		uint64_t exec_sync;
> -	} *data =3D NULL;
> -	struct xe_spin_opts spin_opts =3D { .preempt =3D false };
> -	struct drm_xe_engine *engine;
> -	uint64_t batch_offset =3D (char *)&data[EXEC_DATA].batch - (char
> *)data;
> -	uint64_t batch_addr =3D addr + batch_offset;
> -	uint64_t sdi_offset =3D (char *)&data[EXEC_DATA].data - (char *)data;
> -	uint64_t sdi_addr =3D addr + sdi_offset;
> -	size_t bo_size;
> -	uint32_t vm;
> -	uint32_t exec_queue;
> -	int value =3D 0x123456;
> -	uint32_t bo =3D 0;
> -	int b, err;
> -
> -	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> -	bo_size =3D sizeof(*data) * DATA_COUNT;
> -	bo_size =3D xe_bb_size(fd, bo_size);
> -
> -	engine =3D xe_engine(fd, 1);
> -	bo =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine-
> >instance.gt_id),
> -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -
> -	data =3D xe_bo_map(fd, bo, bo_size);
> -	memset(data, 0, bo_size);
> -	exec_queue =3D xe_exec_queue_create(fd, vm, &engine->instance, 0);
> -
> -	sync[0].addr =3D to_user_pointer(&data[VM_DATA].vm_sync);
> -	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0,
> -			       addr, bo_size, sync, 1);
> -	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE,
> 0, NSEC_PER_SEC);
> -	data[VM_DATA].vm_sync =3D 0;
> -
> -	spin_opts.addr =3D addr + (char *)&data[SPIN_DATA].spin - (char *)data;
> -	xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
> -	sync[0].addr =3D addr + (char *)&data[SPIN_DATA].exec_sync - (char
> *)data;
> -	exec.exec_queue_id =3D exec_queue;
> -	exec.address =3D spin_opts.addr;
> -	xe_exec(fd, &exec);
> -	xe_spin_wait_started(&data[SPIN_DATA].spin);
> -
> -	b =3D 0;
> -	data[EXEC_DATA].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> -	data[EXEC_DATA].batch[b++] =3D sdi_addr;
> -	data[EXEC_DATA].batch[b++] =3D sdi_addr >> 32;
> -	data[EXEC_DATA].batch[b++] =3D value;
> -	data[EXEC_DATA].batch[b++] =3D MI_BATCH_BUFFER_END;
> -	igt_assert(b <=3D ARRAY_SIZE(data[EXEC_DATA].batch));
> -
> -	sync[0].addr =3D addr + (char *)&data[EXEC_DATA].exec_sync - (char
> *)data;
> -	exec.num_syncs =3D 0;
> -	exec.exec_queue_id =3D exec_queue;
> -	exec.address =3D batch_addr;
> -
> -	while (1) {
> -
> -		err =3D ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
> -
> -		if (err =3D=3D -1 && errno =3D=3D EWOULDBLOCK)
> -			break;
> -
> -		igt_assert_eq(err, 0);
> -	}
> -	igt_assert_eq(errno, expect);
> -
> -	xe_spin_end(&data[SPIN_DATA].spin);
> -	xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync,
> USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> -	usleep(50000);
> -
> -	exec.num_syncs =3D 1;
> -	xe_exec(fd, &exec);
> -	xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync,
> USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> -
> -	sync[0].addr =3D to_user_pointer(&data[VM_DATA].vm_sync);
> -	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> -	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE,
> 0, NSEC_PER_SEC);
> -	munmap(data, bo_size);
> -	gem_close(fd, bo);
> -
> -	xe_exec_queue_destroy(fd, exec_queue);
> -	xe_vm_destroy(fd, vm);
> -}
> -
>  #define LR_SPINNER_TIME 30
>  /**
>   * SUBTEST: lr-mode-workload
> @@ -570,9 +460,6 @@ igt_main
>  					  s->flags);
>  	}
>=20
LGTM
> -	igt_subtest("non-blocking")
> -		non_block(fd, EWOULDBLOCK);
> -
>  	igt_subtest("lr-mode-workload")
>  		lr_mode_workload(fd);
>=20
> --
> 2.34.1


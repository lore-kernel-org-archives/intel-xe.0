Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A1CFC617F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 20:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2160610ED8D;
	Fri, 13 Sep 2024 20:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJs76xRk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C513610ED8C
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 20:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726259957; x=1757795957;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8Jo4ywSbr3BN+WjgfufAOB6hxJMmcwnDAeVE/lrsJ90=;
 b=ZJs76xRkPAH7RiAQ3jqiGiQ84ao1LI86s2bWpSRRzQfyB0LSaCh93+p1
 tA/M3iTq8uXU8tDBQcB6C26hwz871BqrCXVNK2cqWxl49xWgYPohejqdj
 URZDvLMLiGvEl/NjjFzYmNG10uihrRGgD9gSZ7dqQoQ3WbSNptJApZi2y
 Jtd6YSvEklz9C5/zRhdYb4/oXJWpxryUmd/gRnzn3BGBncM6HiCTiDRlC
 NpryzGt8xK53kpVRIWVRs8yJ4FW7ppzoOEVfODXFbC82RthZcidaN0VjG
 YxVEk66rsiBQudqOivklLhpZcqWi99O1ALmfci/yWmrrmeO+YF0iBixMc w==;
X-CSE-ConnectionGUID: kTBYVtWFTcmOQ5K5WRbpHw==
X-CSE-MsgGUID: asE396D5SieObFt9Xq5G+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="36523477"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="36523477"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 13:39:17 -0700
X-CSE-ConnectionGUID: cFVKLAb2QRyhxrLkvAK+pQ==
X-CSE-MsgGUID: dxT7ZIT6T5ia+SixorZd6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="99041735"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 13:39:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 13:39:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 13:39:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 13:39:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 13:39:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UL2KjOGrO5ehGvuQnvJ2hER+jxppwZC18IEaXDVq5k9p9I/gM+BUgywW4a8zJsZkzDkJRF6igcA2Qd3RQCG2vgggsXeubw5TeyW5hO8hHomlPJKAS8RUW9J7OIBjO6dTw9Q7i3DqBYIcbE8EKYKuqMvJZ4VyiSf+gm9KiXmHLtyrq7qwIpYF8/rfwxK2aKZjXJeNYs1uSmSUTYAEWHxIfDFEtOehuegPMaA1/ADprGC0yNRKFZD4d7QMTOIeQjZ1A2uS/wNJAl3iDp+v4bqfS6v516X+rtAS/cl5ianfw9U1OZ6CAxREsCCDw6PyCf9ZXkVvdn6WB2XkKFAU2feSpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLftELD/pWfxAHWJFYYKMMc6GCUd++Vtz4/M5F/55DY=;
 b=v/vX2dndxTciM+HwS3ZbrIUqUaKSdBQ5BuMeYzGeKsQDhQ1YwAOrsX0gmjqWzdSzz3LkCexQpfv9VPpw0jgHUjeBbkxpib+IXdJl+JzGvSy4mstBVENdSD7iAnU1v4WWaholPQAcmeTSTSHPWx5bagF6Xlc4NlXOOVbY6aui+YzdxAKGIPVAZ7HAcGg/29Ak0zxsdlniiYTNXSi+NuS4R82JglIJsaJ00P0moLoTZ4Rs62KT/pSd4LHzueYWE5LLcxsKMCp2kzbHBfhXPJONoSHLSKIRQ6ynd2ZiRMaeopkbdZroGrYuHwaCtb6psxyPG6HrLBT5msiHoZwrqd1eHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 DS0PR11MB8069.namprd11.prod.outlook.com (2603:10b6:8:12c::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.20; Fri, 13 Sep 2024 20:39:08 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%7]) with mapi id 15.20.7939.022; Fri, 13 Sep 2024
 20:39:08 +0000
Date: Fri, 13 Sep 2024 16:38:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/display: Do not suspend resume dp mst during
 runtime
Message-ID: <ZuSi4sR6hWtBc-ez@intel.com>
References: <20240912012545.702032-1-suraj.kandpal@intel.com>
 <20240912012545.702032-2-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240912012545.702032-2-suraj.kandpal@intel.com>
X-ClientProxiedBy: MW4PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:303:b8::17) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|DS0PR11MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: ffb67a7d-ce64-4cdd-3612-08dcd43419e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KheOUCQC/syx+MSZzF+kvxaOX5BJ83QnDtyq8o2b1XYKbx88yat4UgCRs878?=
 =?us-ascii?Q?bkR6aOEjxGidfCHGRPwfD05k7UCqVIyXqyjsNkHuC7kK25nWfmzmVjRWs8x6?=
 =?us-ascii?Q?IW+MGVMvONFqR64LDJVUP5VYR6+ea50dtxb7szJGXUlhaPuzUPyqb5QEZhu4?=
 =?us-ascii?Q?46TRKYuOfS0naJ2NGaiCc3lDbXR1x7R83+xM6I9BWFDl06Tj2zUMMBl0m+En?=
 =?us-ascii?Q?1BWP5lhhmYc8IIf/gXcHXX/dcOab0lyqeEoWO4jeboZIsVkB5XGzjvD0+ZP3?=
 =?us-ascii?Q?0l2EloO2XQLfdysR06Ksmjh8Mr9V1zZuxqXThD/cY7MLnLiiQiT6pmlH48bF?=
 =?us-ascii?Q?Ssrxy5vdA5nQ0hMtVI2IKmNm6FirjyRdUC7p149EzXnDO4bwZx4dtH0rdPVS?=
 =?us-ascii?Q?EUYmOtUdbPKg6lcuQvnU0kUitkHeCGiYsTQBIe5QtpArfcE5/X5N+VaQWPlL?=
 =?us-ascii?Q?IdPaBinDyO12tN1RHZcm2Jv390apmLca0pg4umO7iHzQ5Mev2vvV88ZfNhga?=
 =?us-ascii?Q?7vNF8BpSLFM8+mtc+hjXmd7QkCxAussHFW2JSi4vPFCIF3FNJ2oIjQq6WZL4?=
 =?us-ascii?Q?HV2cwmW2ESd5x3zFikfHyZxO62h9YQ4TLf2jgW0vzETbL7D4LZ3PBAOEiZJJ?=
 =?us-ascii?Q?BFZVyVmVEK2SLENv/80r0zRiq9vluUlx0SESxZI5Y2zAXr78XhDmV2CQnYWL?=
 =?us-ascii?Q?QC371k69/1fZYmAnLMxzfVaA2vrI0llLack83vcRwxb7DJ0iKkCq9ZiFIiUE?=
 =?us-ascii?Q?jjnHk2zfCFHMXdC/PV6NFZckAy8q4orLECZET/XJfzEM3IWNA9cc47+XAEQf?=
 =?us-ascii?Q?2e6js6ecdFWLWRcKWvy2Ku2O7JkYesr6GZ1da/pHzcdTAp0HL4A+0yeDqoc5?=
 =?us-ascii?Q?Tw/qeNFDnUkE82TyqhKWybRmuKH0Cfiixi+veTswujj6HBQBksmWz0rfgo03?=
 =?us-ascii?Q?6fCZORjY9CgR7KK8HXlmLq11Wunzfx0yqhR0rixSoaDuOwH76MoaZwTCJHYz?=
 =?us-ascii?Q?cmxObU4sAscpaoy788OnweDZYSga0RbX8RSX/pEDPSaFX+7t4LIzWXR2b1Wk?=
 =?us-ascii?Q?t5nxM+OcFIlIKrdW0lFI3CaPI0fWC2rrKuqRjWU0PgWpoYb0y0eSlqRSbpn8?=
 =?us-ascii?Q?05TarE06/7wQOfJeLMqIddmp8cda+mztb6h4MJfMjHibNBxeu8aPtD6AYQFD?=
 =?us-ascii?Q?DtLrvrdPYljbzz5vghSjnyKDgPndj3hrh2Mn8cKTQ359HdQhZ/Wigob69UCh?=
 =?us-ascii?Q?qeAhg3jbWbZ06onSJaMtwvT6P5QHwXXi6rkBPh5a51KgHcPyCwVx2+ZmBa8u?=
 =?us-ascii?Q?ejZihLYOz1kkJoYu1LKxxeeH6XgN8yg+qwTD+BtYEw2F4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lsuqk+IjjpxZVTqPkIGPYa0nuJZBMGWEWtD8Kq3xDkqPhinUZQvw2IkWiH1E?=
 =?us-ascii?Q?t76BJdehZKvcx689Z1p1AGvyBpjgY+/u57HgX7eLISkpNrX//5cpI9c4DyL2?=
 =?us-ascii?Q?1fELw/gIiNgcOlzA3sEodWYFe+JOwQmAPGGIrwbPw18ClSkT+YdlIyDYpQ1m?=
 =?us-ascii?Q?7/9j1/WI9l6zDu7yjtZBtu8/i9Qn5M7roc+pVnmMoEQnNXoqhsJVfqvjFdXv?=
 =?us-ascii?Q?BiFm5nzVhu/HgTVF7Z85Uu9ua063JdNmcr2wAJ1zOsgRCHZmARdkuUs4o0MR?=
 =?us-ascii?Q?AwWXerBBUe6svxfv56fcAFIV74FyHzDsFC3ZbCfzIDHSJo+FEEoZGN0lvowB?=
 =?us-ascii?Q?FeI3hC3lJfVC8LmYGizBPgP/1vQ9GdhUe9jyrnbP1JJBgxTjvud1ExA+/aI3?=
 =?us-ascii?Q?S8/70lShrcgOo6jfPYPFmcLT0muQkalQjQrNfuHYh810Cc/ulBTu+D0G1CG1?=
 =?us-ascii?Q?ao8ugsiRVHOzioo+JDtXMmbDaSAt+STgXJyPfSoVxb+R3nShEVi7n+FVXlxd?=
 =?us-ascii?Q?MHabhxRJDaSvULsxtsVmeJnUStdgeuLpVGsukDJcMfJcBBgktIL0eEmkrflO?=
 =?us-ascii?Q?kjyiVOziydGrXPKnTNu6uD9da4pIKv6EsiM+qZTUgLX+Vv/p9SohJDLMobO3?=
 =?us-ascii?Q?VmVBLBkrS2b2Wmz49J9urxdR6JTK2ZkxQNAN3dVT7FhYeq2Ky9uing61Kn6Y?=
 =?us-ascii?Q?vYLPFNOcWno+c1HEFhbsf5aPNQLq9MysmS0p9oyvg4kV6+BGmQsYx9sAzxJc?=
 =?us-ascii?Q?xBHrJJRjtQUfKT/Tm0fUGc3ZnLpZ/5vBYd477NTXoHFQKik+UX7C0ePjG1+O?=
 =?us-ascii?Q?MUVD6vzANdYt3hxW12Xnw1r14gRv6Nmo6W822PEjgYfHurzEciJpzeJNnPPz?=
 =?us-ascii?Q?TIYB/CnM+nqhR31cmlwNOkYr0N/3vRaMLDcTuhrGkHsq+Fogkz7Yd99cEIDI?=
 =?us-ascii?Q?ybnWMLQVgSr4CkhfiFq+jbZ6+DJXlsRPeFN6AbYcYJ9RfQrJGy4Y/kYiTpeK?=
 =?us-ascii?Q?LVdzF5ntxmDSoYdGcfY5qvBT2y0hMx+Rhygt3MTRFaSC3TXgDjYbaEyL8KJR?=
 =?us-ascii?Q?gbMXPpgJK4tdB0bzJ77OrMEW+6tFkuBLd8mxzyEaYMJkqeH5zcU0wfFOlQgE?=
 =?us-ascii?Q?Zi5HvmKJN4wx6Uu73FYexlRKd/yfq8ioxGXKONUO5SvAkVDLkyfIF5gt6mV8?=
 =?us-ascii?Q?t9lsBw0NrcFxvkBjoRtJ6NZCxpg+eYo99HyNIdlQtA2/bBnXUKAfRsRY1Ly9?=
 =?us-ascii?Q?gwfQGlhgB7LWHRKzvD7zY+BmHyXo+Vay39XolwA5+toEHphySBWRxMi+5zO3?=
 =?us-ascii?Q?ArniN5kFVaH4clFGdKwuBHDNg85XjRX/5CqEOrDDzgYQgNa7Xxi+LiOG6veV?=
 =?us-ascii?Q?YvH9Io43uth2QrzU7cHeDFd3PWzGf3RJhr3gQAK646HufPc29ZMuRSvHm8YD?=
 =?us-ascii?Q?1igYU6gVHFZfowtIYQNBa0UubC1Rtwuf91WBc3meDipcTelBqaB4URIK7fH5?=
 =?us-ascii?Q?iEnCgJyluI3HzvauQSvjRK2zFsJLc8tSuBYmWUUoWtD+6OAvG/p0GjoUQoYW?=
 =?us-ascii?Q?cNxtLxNSwCKhjOy+TXcBkgHWYDsvKY1HH09Pk9VAjEYVKykKTq4AXT7iAtT2?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb67a7d-ce64-4cdd-3612-08dcd43419e0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 20:39:08.3812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: je55lUgUE+6PWkCE0WV8VXjLdUgXN1FcYwd0NtXm7FtOiU3ueuCxuzunrgYixu0bhZ37uiQRAA0I+Y6pcQmQ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8069
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

On Thu, Sep 12, 2024 at 06:55:44AM +0530, Suraj Kandpal wrote:
> Remove intel_dp_mst_suspend/resume from runtime suspend resume
> sequences. It is incorrect as it depends on AUX transfers which
> itself depend on the device being runtime resumed. This is
> also why we see a lock_dep splat here.
> 
> <4> [76.011119] kworker/4:2/192 is trying to acquire lock:
> <4> [76.011122] ffff8881120b3210 (&mgr->lock#2){+.+.}-{3:3}, at:
> drm_dp_mst_topology_mgr_suspend+0x33/0xd0 [drm_display_helper]
> <4> [76.011142]
> but task is already holding lock:
> <4> [76.011144] ffffffffa0bc3420
> (xe_pm_runtime_lockdep_map){+.+.}-{0:0}, at:
> xe_pm_runtime_suspend+0x51/0x3f0 [xe]
> <4> [76.011223]
> which lock already depends on the new lock.
> <4> [76.011226]
> the existing dependency chain (in reverse order) is:
> <4> [76.011229]
> -> #2 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}:
> <4> [76.011233]        pm_runtime_lockdep_prime+0x2f/0x50 [xe]
> <4> [76.011306]        xe_pm_runtime_resume_and_get+0x29/0x90 [xe]
> <4> [76.011377]        intel_display_power_get+0x24/0x70 [xe]
> <4> [76.011466]        intel_digital_port_connected_locked+0x4c/0xf0
> [xe]
> <4> [76.011551]        intel_dp_aux_xfer+0xb8/0x7c0 [xe]
> <4> [76.011633]        intel_dp_aux_transfer+0x166/0x2e0 [xe]
> <4> [76.011715]        drm_dp_dpcd_access+0x87/0x150
> [drm_display_helper]
> <4> [76.011726]        drm_dp_dpcd_probe+0x3d/0xf0 [drm_display_helper]
> <4> [76.011737]        drm_dp_dpcd_read+0xdd/0x130 [drm_display_helper]
> <4> [76.011747]        intel_dp_get_colorimetry_status+0x3a/0x70 [xe]
> <4> [76.011886]        intel_dp_init_connector+0x4ff/0x1030 [xe]
> <4> [76.011969]        intel_ddi_init+0xc5b/0x1030 [xe]
> <4> [76.012058]        intel_bios_for_each_encoder+0x36/0x60 [xe]
> <4> [76.012145]        intel_setup_outputs+0x201/0x460 [xe]
> <4> [76.012233]        intel_display_driver_probe_nogem+0x155/0x1e0 [xe]
> <4> [76.012320]        xe_display_init_noaccel+0x27/0x70 [xe]

could you please share the full in a link with me?
I believe we can improve this. This seems incomplete...

> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index e65e7d70f989..39da79069b5a 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -331,7 +331,8 @@ static void __xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>  
>  	xe_display_flush_cleanup_work(xe);
>  
> -	intel_dp_mst_suspend(xe);
> +	if (!runtime)
> +		intel_dp_mst_suspend(xe);
>  
>  	intel_hpd_cancel_work(xe);
>  
> @@ -444,7 +445,9 @@ static void __xe_display_pm_resume(struct xe_device *xe, bool runtime)
>  		intel_display_driver_resume_access(xe);
>  
>  	/* MST sideband requires HPD interrupts enabled */
> -	intel_dp_mst_resume(xe);
> +	if (!runtime)
> +		intel_dp_mst_resume(xe);
> +
>  	if (!runtime && has_display(xe)) {
>  		intel_display_driver_resume(xe);
>  		drm_kms_helper_poll_enable(&xe->drm);
> -- 
> 2.43.2
> 

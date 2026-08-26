Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6A9C61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 21:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D405310EBC4;
	Wed, 26 Aug 2026 21:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z0fn0WZJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC7B10EBC4
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 21:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787779846; x=1819315846;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2+n9vd4Fm2Cj6569PBWVn7nW8zjRx/uM3MD1cCr2QcY=;
 b=Z0fn0WZJfRT2Er985mjbLTffqOFvHdsRHECH/t5F2pAupzknnVO8Fwfd
 Cr9SE7vRwvIu3A2nQyRcuYssr4/UMConn9NZNWehMPc926NAZsnI8i3vK
 kDOuFJapCd6rQQ1eGKLXH67aPGemy3i0zMX3/lTH1zFo3eaCtYSIWBSL5
 i8g3ZdftoTj3qkx8t5/gnvz//fIWGfi1U8HF9HVXP6t1WHC2kzws08od7
 SXqqyghh32cAeyI2QC6N5gj38F+1zWAo8O1nFJR5oPyFY9a1/cxYljBsM
 GnJwlZrvpK7TJ9XIp4HecbCMm0lvWXHYndelpvfUm0P2wvUin+IWuh/G6 g==;
X-CSE-ConnectionGUID: KDmicrSzTZ6aQ0B5yE7FdA==
X-CSE-MsgGUID: Mih3udmaQjOjuFN6bTlUkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="99621797"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="99621797"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 14:30:45 -0700
X-CSE-ConnectionGUID: FkmDsqHHTouuzOWnEejm1A==
X-CSE-MsgGUID: 2X8SuIVGSd6vuEmPJP55QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="266374120"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 14:30:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 14:30:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 14:30:44 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 14:30:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3Q5GZziWyR8TLp9NLLJ0ksy3wILlLei06paDKqgJ0aYsMGk5trrr3g7Zfi02fBlRishZJNvhYPlxKWqhNnwWQlx0ml55EvbHEe8PRXBwNT6z2jXSnHj1uxG5fKQ+bGz3cvJAhbCajKlf8UsCB9cgRRiskBzgkThANWLxbX7x98Htm34hQFCNSH3A5ImNtsQh9ZkW/VRd191XjjLUL9ZUIgFLRbh/zJn6XC1N5GKY18jV2LnoeqRNi02WsE1PNLe9rph3Zo2O2Mzn+qt0i68NcPE/Ur7j8OThBlO1TxYnbFQGmSnEOy8MZqntJ0/C/3yLQQ6XOzzpJI2/6AcL1eH8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YheGru1Rt+8IQbSBVLGGehJIOefe/tcecS2yoxP5p34=;
 b=t51UxLuShTNpBp1HoLraCouHKAyMk8r+wXBc0XtBUjFzhXNYhZ1OxsXDr3B0crUUHSelvu6cn04onJ5zq8Cl6E/mMtFYY5BVVmv2Iv+hh5zKl1+6GuO16h2cICHhapcSIeN4P0QiPC2o3a+p33NkCua68ktArj6JURgO4WtUUV0aIsHHSywi0tdwzWznzZ75hBEdoeNlMRpQEfkaL01DEnkPBF+Z5JBQ2zOGXgR18HzR+APNLVGpC6PdkwdA7iaZLZUSmhZiStsarCqA5gh/Aeu33JrxPSDEiYsffuAYojr40irEIBaTDZKLmKaFDJGZR42CO2RyUsOsPB8enIu2xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by SN7PR11MB7667.namprd11.prod.outlook.com (2603:10b6:806:32a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 21:30:38 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 21:30:38 +0000
Date: Wed, 26 Aug 2026 17:30:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Anoop Vijay <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v7 1/2] drm/xe/sysctrl: Add helper to query application
 status
Message-ID: <ao9a-vzyvdvMxPp2@intel.com>
References: <20260814095306.2482289-4-anoop.c.vijay@intel.com>
 <20260814095306.2482289-5-anoop.c.vijay@intel.com>
 <an+G21kQjK+AUI9K@soc-5CG1426VCC.clients.intel.com>
 <026e7bf1-080f-4d95-965b-83c2afaf6660@intel.com>
 <aoYZY8fMaqT8NNFk@soc-5CG1426VCC.clients.intel.com>
 <aoctQ2m314GQeaih@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aoctQ2m314GQeaih@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: BY5PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::34) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|SN7PR11MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cdf695e-7b19-4c8b-cb8b-08df03b945c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: Xh+5Mv7nlkCEYHeVlJ53xVlpfGvAjeKoteQ3UGc4J+Gd36tqRkhuRAGGV4pFEDJxS2Foe5WSAonVG3nbrrEZXeEglr1Xn/lBsJTQkflhCNNORHNMJ2i7+qET+aahMsrEDEBUO2oqZphNV6k9hutWnCVdPHTqYWgEqcBVpmlbBW3RQ2niT2Om/3pLjjueQ8Oqf6neb65fQxR0xGWKi3Hhcad8XQIYOZiQ46CQD7Ez6n6e0CjXWPvwSYcsXsRTtsMD+CglbY19kwUYpPxSLdiM/pFMiqGwzANCZwY9+8YS7rqZ9be2eKgg6NsYZtsJYW8tZH71HUeUPAqjRK0jkCFfDF60cSL2YV0/8U36tGf5/PVf72IClQZfrX/Ev0Uu3vZ4xGqMl4mXWDOd+iuJZ96IY+7H3t+Iw/oiXV/QDZ1AOAQ+jeru/N2GNmeKjIZ/nKXS4kUUhZgkFACwnjvzLE4XJoGX6zx19t3lBeyDkI+KnxlrxrPW8vxB3JG2HzuRjbsmfJkkQvxrkRK4o5wfENB+ciBbaFPjNzdOnZJNmPvJAZ5v3K3hYtnXsEP7FCojAcveKrAcQ+UjUsrPRSzTCL4bOBjJBmK/GJF14LMP7oPKVyWrR85tm87vbpio5fLEpHSb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0qxVqgjRJSYVxZ/z1KXWxu66/X+urU/t+kwIBRhcnBbQcnbYWOO7J1SvkZh8?=
 =?us-ascii?Q?+Pbos/UcqrgiTilWy9ow4Gm1itNgblK6bqrDmVURpoIaE+zyIQU70QJ5aPvy?=
 =?us-ascii?Q?9cNSHlTWbYoSQ/5PEqzW8XdQITyLDgKYPAMU9+iYPmFf06W5BvQiDX+hSc1U?=
 =?us-ascii?Q?TC3QDnRutHHSpmLELY5dG4JBaIz/JPfr7EVi4Fux0V7usgQ5DLO/B33faeAf?=
 =?us-ascii?Q?IP3kRN0mK9ZthM8IEKPchEOHiwxeeupVSjDnkqIxYc3uglPkmIwEeHiudE79?=
 =?us-ascii?Q?ABe6f65UAJ2m+LjUaJYPJMSG1aRBheaGOvDMyXIsEkg3l5XJQ/V4KV26345G?=
 =?us-ascii?Q?iCWHksNlH34jkWx4wdHWZsVuazZUdDiPdbx0/qVELEs3WhKHP3G14YEEV/B7?=
 =?us-ascii?Q?8+c2p/FlSok/+N7/6YW3VZuIsLpVVic3oJwlZPCIsEuO+TRN9K/7bS5ez0cV?=
 =?us-ascii?Q?1eNvdRI6avxm5B5/5/xpKNibYg7GU62BEb2WYcIiHTOQ7pSg6QHvDe/WmbTQ?=
 =?us-ascii?Q?6bpgXcJvYcXPH0DDpWoXRp/tQZ6Oy/PjXBGmFnKOqvXBOjbimsV2RLoXaRVw?=
 =?us-ascii?Q?7C8iZ1xIZePYn6UB/n/PbioRwo9pEhN3m9qdSRtjQjqgZl6rJiW39KAgrbKE?=
 =?us-ascii?Q?qwUDCOX+QeEeqGsKEl+exu6uFye7XIXjzD2RshmL3VoL4noocG4Z45VLpGvi?=
 =?us-ascii?Q?df7flFHAtVl29psWqdvtILNcb/xRtvbqmjm9l5AJFbAAVzUG7Tx+Fty47o+c?=
 =?us-ascii?Q?FEuYTPc/PNegwT5M2cM8p6QiG36CSZYiViKZIOJeBc8Km0vHh/Q+e1do0GRE?=
 =?us-ascii?Q?hCWHWFyE0RIPFvrMYxvXW0RDhCDzVyKpwXEdWS+sGMvSX4MzG4w69JrTyXcN?=
 =?us-ascii?Q?G/gE3Dh4fSEMcRURRx9jTp4py2i8iDla2vKsEJhj13pw4VHSg8kBT5OssCWq?=
 =?us-ascii?Q?RK5Gnpztga+K1duiKeLdLE6dmhsKLpzcjIqIfO56yncXetI3DDnV4NuU6Wld?=
 =?us-ascii?Q?wWWWH9gWwTvbY97O872LRmVlRuTBB1T1Zaow9IFa/0656LVedV0diabP08vx?=
 =?us-ascii?Q?2iY60PHcrlaldHcIN06ptCDOBJHNa22Dw8tPXWb/6cBadJOne5ZbqNWZ3jlE?=
 =?us-ascii?Q?P4ZsNYQlVNz16ehZ7DXFFkIK2YeO0pgCCOmtjmP374olAyrpUbyZpmdN1JFI?=
 =?us-ascii?Q?EcbAAZR1Kn61l8qiH+ZM3ENEqcHoKBzJSBTRwcg7H5dWE8PxF7G1EoW8d1ci?=
 =?us-ascii?Q?jl8cUUGoq7hppP6oEVAf2Z8hE7ClpfhWYB+ji1ze4LP+bFIPxmMsVhXv4w53?=
 =?us-ascii?Q?t1MAuOrb/ccYnPvku4dBim1Rf1ip0pUxmYoV5kAjojd0yXIu9gAR1Syn6I6g?=
 =?us-ascii?Q?fZkftxqruMbZ3FByCsI3GcdX50mNU3xrJCAFymR4fAwPP24w0w/EGNDh4Iiq?=
 =?us-ascii?Q?aHVyJWuNVbTZIzHD5lguwRyeZaZ4L4qiuVEahn+4BwoAs4aPcEcoe7zkaXEi?=
 =?us-ascii?Q?zJy0oZRAf2CNwFX3osfIrgWQ/IMM03XMTFatLxWm5KET5uQErR56nTyJ976q?=
 =?us-ascii?Q?XMRpNKH87qsIW/Xnk2zIcSSjiqWhz0/ev09v/1/nNaHcQa3ga/2yEcBip3Qu?=
 =?us-ascii?Q?aaabv6tJtY0TyEWHpgfLUnyQY1b7KANCj5QDrnsvzOscI+Ri+U9GEf0u8Ckk?=
 =?us-ascii?Q?SaIdwDjGt5fbEYrL5w8vJ3+hbLCMSWdJstryvcMvCpRfTJgglqF36ItEFLUc?=
 =?us-ascii?Q?UJy3CA0mcg=3D=3D?=
X-Exchange-RoutingPolicyChecked: x1aEH5HqOKTB+yd77fjYwv2s71KzDD13hcbwsBXrrviyjbS4zoEPvdYwTRYKzkeEZKsNf+VSESbP4Lazr1wf6zkks0b4E4GGatMpn0J+fOffRPwv3YHFeSQPMm/KsROFTkO6GacXPWOPtFzQcRm1MfFwQ711ddpZvYVniAav1dZbO4g6BsVrpKgYhVyyCjfCzPTRDWwNtT7gkDJE/VuH2wjl67HOfEvDHARZJNL23l9HvHw7Kx/z3e8G2PX3zwpKFdzFVkMSJYnHOabZVXP0jqGOE8hBn2SEqL6epF8FkfnTLsmlc3sQ0KBb1Cmx0gepRg8lfmnEi+oIUX+eNskmVQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cdf695e-7b19-4c8b-cb8b-08df03b945c8
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:30:38.7217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7xDKfYcbxP+Tpm5gtOkDLGuSrOjtwb/BlIz/HbmMmKp6jIhBocd30hBokpWdtpeoRox9WzZC+n8Co/NI+cIVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7667
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

On Thu, Aug 20, 2026 at 09:37:23AM -0700, Umesh Nerlige Ramappa wrote:
> On Wed, Aug 19, 2026 at 02:00:19PM -0700, Umesh Nerlige Ramappa wrote:
> > On Tue, Aug 18, 2026 at 11:11:13PM +0530, Anoop Vijay wrote:
> > >  On 15-08-2026 02:51, Umesh Nerlige Ramappa wrote:
> > > 
> > >    On Fri, Aug 14, 2026 at 02:53:06AM -0700, Anoop, Vijay wrote:
> > > 
> > >      From: Anoop Vijay <anoop.c.vijay@intel.com>
> > > 
> > >      Add xe_sysctrl_check_app_status() to query the state of a System
> > >      Controller application using get_app_status_by_id mailbox command.
> > > 
> > >      The helper maps xe_sysctrl_app_id values to firmware application
> > >      IDs and returns the reported application state. Add a convenience
> > >      wrapper to check diag firmware application readiness.
> > > 
> > >      Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> > >      ---
> > >      v2: (Badal)
> > >      - Return SysCtrl firmware application states instead of errno for
> > >       application lifecycle conditions
> > > 
> > >      v3: (Riana, Badal)
> > >      - Replace string-based app identifiers with enum xe_sysctrl_app_id
> > >      - Use get_app_status_by_id (opcode 0x05)
> > >      - Move mailbox definitions to xe_sysctrl_mailbox_types.h
> > >      - Return enum xe_sysctrl_fw_status consistently
> > >      - Map communication failures to COMM_FAILURE
> > >      - Add INITIALIZED state and status helpers
> > >      - Fix Diagnostics typo
> > > 
> > >      v4: (Anshuman)
> > >      - Make xe_sysctrl_check_app_status() internal
> > >      - Remove unused app identifier
> > > 
> > >      v5: (Anshuman)
> > >      - Rename OOBMSM status helper to use xe_sysctrl_* prefix
> > >      - Remove xe_is_diag_fw_ready() helper
> > > 
> > >      v6: (Riana)
> > >      - Use xe_sysctrl_create_command() helper instead of manual FIELD_PREP
> > >       header packing
> > >      - Rename xe_sysctrl_get_app_status_by_id_{req,resp} to shorter names
> > >      - Use hex constant for application ID
> > >      - Move oCode application readiness helper to a separate patch
> > >      - Add xe_sysctrl_is_diag_fw_ready() helper.
> > > 
> > >      v7: (Umesh)
> > >      - Clarify xe_sysctrl_is_diag_fw_ready() comment for sysctrl-less
> > >      platforms
> > >      - Move XE_SYSCTRL_APP_RESP_* flags and enum xe_sysctrl_app_id to
> > >      xe_sysctrl.c
> > >      ---
> > >      drivers/gpu/drm/xe/xe_sysctrl.c               | 80 +++++++++++++++++++
> > >      drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
> > >      drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 47 +++++++++++
> > >      3 files changed, 128 insertions(+)
> > > 
> > >      diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c
> > >      b/drivers/gpu/drm/xe/xe_sysctrl.c
> > >      index 1db20be8158b..c53a26af3189 100644
> > >      --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> > >      +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> > >      @@ -13,9 +13,11 @@
> > >      #include "xe_device.h"
> > >      #include "xe_mmio.h"
> > >      #include "xe_pm.h"
> > >      +#include "xe_printk.h"
> > >      #include "xe_soc_remapper.h"
> > >      #include "xe_sysctrl.h"
> > >      #include "xe_sysctrl_mailbox.h"
> > >      +#include "xe_sysctrl_mailbox_types.h"
> > >      #include "xe_sysctrl_types.h"
> > > 
> > >      /**
> > >      @@ -29,6 +31,20 @@
> > >       * This module provides initialization and support code for
> > >      interacting
> > >       * with System Controller through the mailbox interface.
> > >       */
> > >      +
> > >      +/* Application status flags reported in
> > >      xe_sysctrl_app_status_resp.flags */
> > >      +#define XE_SYSCTRL_APP_RESP_VALID    BIT(0)
> > >      +#define XE_SYSCTRL_APP_RESP_BOOTED    BIT(1)
> > >      +#define XE_SYSCTRL_APP_RESP_INITIALIZED    BIT(2)
> > >      +
> > >      +/*
> > >      + * Known System Controller application identifiers, keyed by firmware
> > >      + * application ID.
> > >      + */
> > >      +enum xe_sysctrl_app_id {
> > >      +    XE_SYSCTRL_APP_DIAG    = 0x0D,
> > >      +};
> > >      +
> > >      static void sysctrl_fini(void *arg)
> > >      {
> > >          struct xe_device *xe = arg;
> > >      @@ -130,3 +146,67 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
> > > 
> > >          xe_sysctrl_mailbox_init(sc);
> > >      }
> > >      +
> > >      +static enum xe_sysctrl_fw_status
> > >      +xe_sysctrl_check_app_status(struct xe_device *xe, enum
> > >      xe_sysctrl_app_id app_id)
> > >      +{
> > >      +    struct xe_sysctrl_app_status_req req = {};
> > >      +    struct xe_sysctrl_app_status_resp resp = {};
> > >      +    struct xe_sysctrl_mailbox_command cmd = {};
> > >      +    size_t out_len = 0;
> > >      +    u32 flags;
> > >      +    int ret;
> > >      +
> > >      +    if (!xe->info.has_sysctrl)
> > >      +        return XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
> > >      +
> > >      +    req.app_id = (u8)app_id;
> > >      +
> > >      +    xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE,
> > >      XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID,
> > >      +                  &req, sizeof(req), &resp, sizeof(resp));
> > >      +
> > >      +    ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
> > >      +    if (ret)
> > >      +        return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
> > >      +
> > >      +    if (out_len != sizeof(resp)) {
> > >      +        xe_err(xe, "sysctrl: unexpected get app status response
> > >      length %zu (expected %zu)\n",
> > >      +               out_len, sizeof(resp));
> > >      +        return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
> > >      +    }
> > >      +
> > >      +    flags = resp.flags;
> > >      +
> > >      +    if (!(flags & XE_SYSCTRL_APP_RESP_VALID))
> > >      +        return XE_SYSCTRL_FIRMWARE_APP_INVALID;
> > >      +
> > >      +    if (!(flags & XE_SYSCTRL_APP_RESP_BOOTED))
> > >      +        return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
> > >      +
> > >      +    if (!(flags & XE_SYSCTRL_APP_RESP_INITIALIZED))
> > >      +        return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
> > >      +
> > >      +    return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
> > >      +}
> > >      +
> > >      +/**
> > >      + * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is fully
> > >      initialized
> > >      + * @xe: xe device instance
> > >      + *
> > >      + * Returns true if diag firmware has reached the initialized state,
> > >      indicating
> > >      + * it is ready to handle requests. On platforms without System
> > >      Controller
> > >      + * support there is no System Controller mailbox to gate on, so diag
> > >      firmware
> > >      + * readiness is not tracked through this path; the function
> > >      unconditionally
> > >      + * returns true so callers are not blocked by this check on such
> > >      platforms.
> > > 
> > >    I am still not clear how the caller will handle the 2 scenarios - (1) SC
> > >    is present, but diag app is not initialized vs (2) SC and mailbox are
> > >    not available and hence Diag App is not supported. The caller will just
> > >    see true in both cases.
> > > 
> > >    Instead I would see this as 2 helpers:
> > > 
> > >    xe_sysctrl_is_diag_fw_supported() that returns
> > >    status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
> > > 
> > >    and
> > > 
> > >    xe_sysctrl_is_diag_fw_ready() that returns
> > >    status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
> > > 
> > >    That would be clearer to the caller.
> > > 
> > >    Thanks,
> > >    Umesh
> > > 
> > >  All current/planned callers of xe_sysctrl_is_oobmsm_fw_ready() /
> > >  xe_sysctrl_is_diag_fw_ready() (xe_vsec.c retry/gate logic,
> > >  xe_sysctrl_debugfs.c RAS injection gate, xe_sysctrl_fwctl.c capability
> > >  gate) only need a yes/no answer to "Can this functionality be used now?"
> > >   and treat NOTSUPP and 'not yet initialized' the same way.
> > 
> > Looking at all these callers in [1] and [2], I don't see a need for
> > NOTSUPP. Both fwctl and debugfs callers seem to gate init/registration
> > using has_sysctrl already.
> > 
> > I dont' know about xe_vsec, but looking at the code, it has specific
> > implementation for different platforms, so it will not call the _ready
> > helper on unsupported platforms. @Michael for comments.
> > 
> > We can just drop the XE_SYSCTRL_FIRMWARE_APP_NOTSUPP check in the ready
> > helpers.
> 
> Based on the xe_vsec patch - https://patchwork.freedesktop.org/patch/746022/
> 
> even xe_vsec has a platform specific implementation, so it would not result
> in the NOTSUPP case. We should be able to drop that in the helper.

Anoop, I'm with Umesh here, this NOTSUPP is really confusing as is.
You might know now the case that you need for it, but we cannot understand
it ourselves and even future developers that pick this code in the future
won't understand it. So, please let's split this case and absorb this
change in whatever user space tool you might already have using this.

Thanks,
Rodrigo.

> 
> > 
> > Thanks,
> > Umesh
> > 
> > [1] https://patchwork.freedesktop.org/series/171728/
> > [2] https://patchwork.freedesktop.org/series/161655/
> > > 
> > >  Folding NOTSUPP into 'ready' is intentional. It lets sysctrl-less
> > >  platforms skip straight through.
> > > 
> > >  Splitting into is_supported() + is_ready() wouldn't change any caller's
> > >  behavior, but would require every caller to do '!supported() || ready()'
> > >  check. This risks a caller checking only is_ready(), resulting in
> > >  unnecessary retries or failures on a NOTSUPP platform.
> > > 
> > >  Given the current usage, I'd prefer to keep the combined helper and add a
> > >  more granular status/support helper in the future if a real consumer
> > >  requires that distinction.
> > > 
> > >  Thanks,
> > >  Anoop
> > > 
> > >      + *
> > >      + * Return: true if diag firmware is initialized, or if System
> > >      Controller is
> > >      + * not present on this platform; false otherwise
> > >      + */
> > >      +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
> > >      +{
> > >      +    enum xe_sysctrl_fw_status status =
> > >      +        xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG);
> > >      +
> > >      +    return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
> > >      +           status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
> > >      +}
> > >      diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h
> > >      b/drivers/gpu/drm/xe/xe_sysctrl.h
> > >      index 090dffb6d55f..8dc576796890 100644
> > >      --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> > >      +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> > >      @@ -20,5 +20,6 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
> > >      int xe_sysctrl_init(struct xe_device *xe);
> > >      void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
> > >      void xe_sysctrl_pm_resume(struct xe_device *xe);
> > >      +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
> > > 
> > >      #endif
> > >      diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > >      b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > >      index d0341538ad05..f1e4253fda4b 100644
> > >      --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > >      +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > >      @@ -14,9 +14,11 @@
> > >       * enum xe_sysctrl_group - System Controller command groups
> > >       *
> > >       * @XE_SYSCTRL_GROUP_GFSP: GFSP group
> > >      + * @XE_SYSCTRL_GROUP_CORE: Core group
> > >       */
> > >      enum xe_sysctrl_group {
> > >          XE_SYSCTRL_GROUP_GFSP            = 0x01,
> > >      +    XE_SYSCTRL_GROUP_CORE            = 0xFF,
> > >      };
> > > 
> > >      /**
> > >      @@ -38,6 +40,51 @@ enum xe_sysctrl_gfsp_cmd {
> > >          XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
> > >      };
> > > 
> > >      +/**
> > >      + * enum xe_sysctrl_core_cmd - Commands supported by Core group
> > >      + *
> > >      + * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status
> > >      by ID
> > >      + */
> > >      +enum xe_sysctrl_core_cmd {
> > >      +    XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID        = 0x05,
> > >      +};
> > >      +
> > >      +/**
> > >      + * struct xe_sysctrl_app_status_req - Get application status request
> > >      + *
> > >      + * @app_id: Application ID for which to retrieve status
> > >      + */
> > >      +struct xe_sysctrl_app_status_req {
> > >      +    u8 app_id;
> > >      +} __packed;
> > >      +
> > >      +/**
> > >      + * struct xe_sysctrl_app_status_resp - Get application status
> > >      response
> > >      + * @flags: Application status flags interpreted by
> > >      xe_sysctrl_check_app_status()
> > >      + */
> > >      +struct xe_sysctrl_app_status_resp {
> > >      +    u32 flags;
> > >      +} __packed;
> > >      +
> > >      +/**
> > >      + * enum xe_sysctrl_fw_status - System Controller firmware application
> > >      lifecycle states
> > >      + *
> > >      + * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not recognized by
> > >      firmware
> > >      + * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is known but has
> > >      not yet booted
> > >      + * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence completed,
> > >      post-boot init pending
> > >      + * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application fully
> > >      operational
> > >      + * @XE_SYSCTRL_FIRMWARE_APP_NOTSUPP: System Controller not available
> > >      on this device
> > >      + * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication with System
> > >      Controller firmware failed
> > >      + */
> > >      +enum xe_sysctrl_fw_status {
> > >      +    XE_SYSCTRL_FIRMWARE_APP_INVALID,
> > >      +    XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED,
> > >      +    XE_SYSCTRL_FIRMWARE_APP_BOOTED,
> > >      +    XE_SYSCTRL_FIRMWARE_APP_INITIALIZED,
> > >      +    XE_SYSCTRL_FIRMWARE_APP_NOTSUPP,
> > >      +    XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
> > >      +};
> > >      +
> > >      /**
> > >       * struct xe_sysctrl_mailbox_command - System Controller mailbox
> > >      command
> > >       */
> > >      --       2.43.0

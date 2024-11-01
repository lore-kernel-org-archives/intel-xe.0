Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1706E6B255
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 12:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7822910E19E;
	Fri,  1 Nov 2024 12:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c6PVC+bF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BC810E2C0
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 12:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730465085; x=1762001085;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H2iUdttVyxq5xJwaiSNHVXglAoAb9UufZtS+MZ2ZpNE=;
 b=c6PVC+bF4cwh5XjW+ueeeLjWwfS/y9eTC6WnDeRPQAg2xohr1xN93Ics
 MazGAVJ4BgXu2+1fGJYL1IsHI7pnvDWsfBA28zO9PoQWhkvvUe0e/GIuf
 +Blpwv/Dwd2iqv2NpqUIMUpNx+r6GbD6sNSpZY/lxJo6mqH5OaE6M6ULU
 BssTNHOtzp8KpvH6v0A58bgqwKEzseI/SFtrestlxmnVhJaCUfjRCvprX
 d7umtY+OSFqL2iRdtUkYMCMRgKzGSBja+Wbp2Wm85F25kkefZV22et6Qq
 98bIem06/U7ON68ZwgITorBItZpU7HoKGn4ndZwG/Hs+Q0GfBbD/j9orZ A==;
X-CSE-ConnectionGUID: D0I8RBIbQySxNGU+AAZBvw==
X-CSE-MsgGUID: WsuWTTTbRWKin+U4kvkWEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30342417"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; d="scan'208";a="30342417"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 05:44:44 -0700
X-CSE-ConnectionGUID: 3BnGLoxKRJe6yhYwkPiuGA==
X-CSE-MsgGUID: /BiECPJNSJmFoEFd/37SyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; d="scan'208";a="82833535"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 05:44:43 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 05:44:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 05:44:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 05:44:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hw40p3GzYnTK+YRFrKipeYNkaXzcNMrGKx07bIiUyrk9IBMEpq7yqEqSVbd0y77n0eg3754PIUPFmQJ5tJoBmixKshct0HcrnItvYwnI2zwTdjqwX6MobkHZpN6k5vtFS4czZObMe7E8IECdATyu6hMO70+pMOmgQJOSShh+xJeof/GNmu2oX31I+11pxg7YdRIwBlgvA8T31/jZImfoc8FBxAeCyJVvFsMkOqhU2KNq0LDm6ce9tHayYRvyrqwLanit2K3fUVpGR91pzUEabBuxT3nfIOlh6N2e8rLkE0w/xNxQ7YDE9/0Yu/tTwtz5Qqk8IajSwMaPXcnCGXH0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GvLFFyBX7k51nfqxXvLptNHynYnvQL3s1ids7X2dMw=;
 b=prTDrTi6TK+mMr/Ct3yp78o6qS8xpPJAbWeB6fSPjbLo9f/SobqDBYubYnN5IeVyMeJ3u2wvNETbZ6JvAu15A8EtlxBvvCJGsHUKNRzzNvpksuWh/exs/jk1AWf6vZtXCvf/ExmlbhueUYsJ0p4uqhP/MGr24wod+mQyUDG5b6Mjua4HpaikOoZ3SNwbWrHP04xoxQv/KpUGmdqwkyh2QcMODFNqxlNta54nBMFoMADYzO85xzjkA+fXZASgsIrTb/X5Zx93oYiMf6+zPtELFdzNv4OqGcmrNPu/Q5aA5ZvmqCjdheUlU70ijUXptBO4Ba+ETWw3ND1ngxQEPg3rZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5955.namprd11.prod.outlook.com (2603:10b6:208:386::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 12:44:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 12:44:40 +0000
Date: Fri, 1 Nov 2024 07:44:37 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison
 <John.C.Harrison@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Improve devcoredump documentation
Message-ID: <4kw2zzb76m42zbisvsy2fu52q2litchy6dfl4hyrmvze5u5dvk@hjs2pdynjemd>
References: <20241031182916.1441987-1-lucas.demarchi@intel.com>
 <20241031182916.1441987-2-lucas.demarchi@intel.com>
 <ZyRrisQfc_59rrK-@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZyRrisQfc_59rrK-@black.fi.intel.com>
X-ClientProxiedBy: MW4PR04CA0040.namprd04.prod.outlook.com
 (2603:10b6:303:6a::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e9e3b9-6432-4c68-1ac2-08dcfa72f3b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r0/J/Rw9N8gydfHjMganG9GwFiJ5T1Jpsy3NiiBtr/IGDK9OrMY7QuGRYDQ5?=
 =?us-ascii?Q?YJkxjcg73hmum9Tcx9E11ub/2MR9MUbfSExH64E/W9N900hBpd86OpCZbNRk?=
 =?us-ascii?Q?DLAx9f/Vs/7agBwFDKv39M3GfSuSRzkQx/lEBmfEAZ56xrRsXhEURZ8eJZPj?=
 =?us-ascii?Q?4DK3y0mEBwGaI/tV3NFUP52835KO6A3Tiks1lHS/MJCUp4Gv8jnZ0oz0eiAt?=
 =?us-ascii?Q?e1dsK4ubfTnoC1zIHYbVyTOUyhVUNrHteauPExFJbqJI/K9FeA0X3PNDb4Ol?=
 =?us-ascii?Q?A/L+DBsCf+2WCV27+icJjRDzeWb9NqHpbXpwDpUfmwnwpCeXxhuegqftueKq?=
 =?us-ascii?Q?BPUJwn1NXNCVxFyF5SE2ViGu04963dUdVW4p9dla8fOwdDIht5r5AC6/GuCq?=
 =?us-ascii?Q?6FE6ajgFP5CDPFyhWSfkNVl6TVxQe6LuTxv8HNZf8ItCUMzminQ1OQ4qi0P0?=
 =?us-ascii?Q?b1s5NNAR79W+jlGHV6DiZB4OIVeEP6gRv8VYVZItRlInf8kBxldUh9k0lLrg?=
 =?us-ascii?Q?JYvcncPRkZbHfXen/pzi+sTrAFizMSopWM1zHzb3GZsQhi0bKg3D5yge42ms?=
 =?us-ascii?Q?6AVUnn+apxjfPBIQf6tIhVgrizsZeowhtIaiE7R0Z0ozVzh1+OSOX8xAFa67?=
 =?us-ascii?Q?5xXK2aYHWpZaUZ9hG/TatQmnmn6poXHTIuCKsvrt7A7C1fR35fNjYnETKQqA?=
 =?us-ascii?Q?Okgs/seIuX6rpEt6E8Ssx2huxYlIktEt52cjXKtdnJ/IPKmcwVvWoUbh4hBH?=
 =?us-ascii?Q?xPajnYme9U/6kVehRlmToDsx9K3/1iC9gi/rtd83a2JOqYskD3UrkZcWoTyp?=
 =?us-ascii?Q?gSzQFzj1F70KJQ9SpOZcReIsQcoQNcdW93aEpOO7GL0gZtovMZQWPbuCuyi0?=
 =?us-ascii?Q?O9yBKxU9c0Yh4qriGqXFjPTGiYnH1f9W/7fe8FHbmE6ETQItp5FoLFrLUCvC?=
 =?us-ascii?Q?JFS/B0dOvADH3ughl4kde7E7OHgdKp/XzaOFmEZAb+IFmMc8ct3PCvmc5I9d?=
 =?us-ascii?Q?BIBuTGQI+eRtQES/jtdupi1vY75MhaHeNn3Rlt0dLA+Z1clqIzo6MPkmWwVm?=
 =?us-ascii?Q?5PZlPdPnQbewdSRTt9VtbFvQy2nGORizkG5O6LuGkTIP5dchrzi8y/ZEfbAq?=
 =?us-ascii?Q?S92XunvRpfQrXIsfveoblQcHdI9NR9fUWvPSdC8Vvmgb72PFVjbi1kggl1av?=
 =?us-ascii?Q?dYLEdJ0wtP1LLcyADvLAPXY1Ldxfe3Xu0bfU3vrRxe5DZHMAwFu4P4LmjVeV?=
 =?us-ascii?Q?OdF4mKoLIhEAHnn7bhWTEUFFt0mnu1RqQnr+V83I1S5yCWnkCCO51tWZMDHU?=
 =?us-ascii?Q?+VQImiCDFzVe36q1FwTVEe1y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2iy0LRboHuuqP2Duy+dHj8pgzjVsQh2KIQqSKaddEobbnJ+BAl+GVYZWp4Rx?=
 =?us-ascii?Q?biFHdMHoLVEKsXhk1WYxKDGXn4TMh69bzPf6BBgquCFoabWKGSTUbD5vd0OT?=
 =?us-ascii?Q?EeF367SzWm9SBPG4h5UyGBHkWoo3xY7+X/VRUJacGBJACTRnBoPMri6PdoeV?=
 =?us-ascii?Q?mVnaYZN0pPMSthwqPiYQh4d0881VTxdnjFd86uQCEoIMMMHqafeKjShTkPZ3?=
 =?us-ascii?Q?7QSSqKCpxpiIx7t9UdcHh7Yua+Fpg0iQtKS2/aDoeuQTRxXrA2OkeQuNGfH6?=
 =?us-ascii?Q?ZJJXuo5RJueSRcClQpowtGv46xSSa8GAOj4PVNzHebXIYT+sGuYT8r1v2EOp?=
 =?us-ascii?Q?63Z6wyQMKobzPF193Z+Y4ckuPZQjDCz5zyxEZfIogGyXp9rQmjBiEmKMy5gA?=
 =?us-ascii?Q?cZTHhSPx+Ccr4Ua1BqiB0oOw6LBzCxYgDZ5kZzJZboHrvOlrh62tx0QqYxwE?=
 =?us-ascii?Q?VswELppBg5T3nSCDu6R/dNyO7jK66XVCl3PByxkCaCcRjc/8/Q4MN5oSzoIR?=
 =?us-ascii?Q?2EYYT1Bz9SCICuzfkSP9Up1HZ0OzhQMyUGHodzPDCbkBoTAw2O7/eU+rxDKH?=
 =?us-ascii?Q?vChfHvq6R/Jj848AEXyB1m8XMLh75oGqhxauc2yFAa8zA67LBtTIuxO2Gu7e?=
 =?us-ascii?Q?Qc7lPCjI5T5bf0/Zi6eGhRvXEcu1+z51eUk7+h7H75biXVN/lV3NMfV+LCjZ?=
 =?us-ascii?Q?xlUZUMBCaf7b0KnelHUXOlxNG2St6K03NoAYAYlO9Ia/cFjpK2GkBuITf/LW?=
 =?us-ascii?Q?/+dmG3ioNOOCxc+8ZESDZQf1FSE2r345qhnpl9YU1g92Ugp1Gh9qV4HzH5+Q?=
 =?us-ascii?Q?SYanniPJvIs99gTPrywq6woS6tpVco21z2dDrMggJVD3JCcvGRwdKBCKuKnO?=
 =?us-ascii?Q?OSLZJ/Rl18WiIQWWCCqwK204BTqRisLACdJNsB5alLT6fX275FLA3ji6NQyU?=
 =?us-ascii?Q?rKVnUBJvSUsKTgZgpTd3Y2DFpSVClz/gGssl8kKHdQCJeFwrN492r5U94qGp?=
 =?us-ascii?Q?Qx2tJsD9lPGyQee6thrwMzGEFcEEQem1+X7A/69L30VpltxlUzAzoFhqH4Gp?=
 =?us-ascii?Q?0JcedvQlwOEo75ZTyPmYwuk74OQ6H9xSnjVYrOy3bxYNCe4EHRedjIypviVO?=
 =?us-ascii?Q?j86qIuxp1tJybeYSsfFvL/QJRG9XcfZi0qyuTUMTIIhcLje3xyIAnveOntSS?=
 =?us-ascii?Q?uEH5ChRcXl8HvIBpiJqaqz/7DtT6PSCD6oB+XX7108vOmQbtZQYd/FIw8xG+?=
 =?us-ascii?Q?ydN6SXVjDRfPzYtyF8h6jJxvJVC645PqXQoHjK9aw/e8i7WlRgkTIGO81kIz?=
 =?us-ascii?Q?CXr8i+mGAFqb3XLpnTvAOUqgw9qKI5/eVSt5cHATlxZgYzv22Vihq/a6knei?=
 =?us-ascii?Q?p4QyU1iWhKOSxfQ52sJ9WWxd5XrXaStY46sLpBc8msP6s5iPLWBqEvZbi/zp?=
 =?us-ascii?Q?gZKv2mxMRykLkafmQMhJA86FzihvugFFw+7BOlzM8bCmpKEZyk55XDM/vDo0?=
 =?us-ascii?Q?b4v89xf3MIlwD3LxRpYe9Eamc7+QPWt4ieEV8i/pcjC59sN9YI7EFHElLqVG?=
 =?us-ascii?Q?H514u9HMDXT8Bles5bGDeQA2QW1dC9Er46fN3vs8cxeqbXdMu4NrkFfP0io6?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e9e3b9-6432-4c68-1ac2-08dcfa72f3b0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 12:44:40.3114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4B2PMGeGyp169Y13PzhEItIr69crvF5NBM+sQN+k+f6Asun7+A9ft6vtwl9cvrTK5MyPS2N9GaM5fj41vlyp3995rTWFsDb/CKty8TivP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5955
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

On Fri, Nov 01, 2024 at 07:47:54AM +0200, Raag Jadav wrote:
>On Thu, Oct 31, 2024 at 11:29:15AM -0700, Lucas De Marchi wrote:
>
>...
>
>> - * Snapshot at hang:
>> - * The 'data' file is printed with a drm_printer pointer at devcoredump read
>> - * time. For this reason, we need to take snapshots from when the hang has
>> - * happened, and not only when the user is reading the file. Otherwise the
>> - * information is outdated since the resets might have happened in between.
>> + * The following characteristics are observed by xe when creating a device
>> + * coredump:
>>   *
>> - * 'First' failure snapshot:
>> - * In general, the first hang is the most critical one since the following hangs
>> - * can be a consequence of the initial hang. For this reason we only take the
>> - * snapshot of the 'first' failure and ignore subsequent calls of this function,
>> - * at least while the coredump device is alive. Dev_coredump has a delayed work
>> - * queue that will eventually delete the device and free all the dump
>> - * information.
>> + * **Snapshot at hang**:
>> + *   The 'data' file contains a snapshot of the HW state at the time the hang
>> + *   happened. Due to the driver recovering from resets/crashes, it may not
>> + *   correspond to the state of when the file is read by userspace.
>
>Does that mean the devcoredump will be present even after a successful recovery?

yes.... if it's not succesful then it's moved to the wedged state. Easy
way to test is running this:

	xe_exec_threads --r threads-hang-basic

You should see something like this in your dmesg:

	[IGT] xe_exec_threads: starting subtest threads-hang-basic
	xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=rcs, logical_mask: 0x1, guc_id=34
	xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=bcs, logical_mask: 0x1, guc_id=32
	xe 0000:00:02.0: [drm] GT1: Engine reset: engine_class=vcs, logical_mask: 0x1, guc_id=18
	xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=34, flags=0x0 in xe_exec_threads [2636]
	xe 0000:00:02.0: [drm] GT1: Engine reset: engine_class=vecs, logical_mask: 0x1, guc_id=17
	xe 0000:00:02.0: [drm] GT1: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=18, flags=0x0 in xe_exec_threads [2636]
	xe 0000:00:02.0: [drm] Xe device coredump has been created
-->	xe 0000:00:02.0: [drm] Check your /sys/class/drm/card0/device/devcoredump/data
	xe 0000:00:02.0: [drm] GT1: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=17, flags=0x0 in xe_exec_threads [2636]
	xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=32, flags=0x0 in xe_exec_threads [2636]
	xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=ccs, logical_mask: 0x1, guc_id=27
	xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=27, flags=0x0 in xe_exec_threads [2636]
	[IGT] xe_exec_threads: finished subtest threads-hang-basic, SUCCESS


If you run it again, it won't overwrite the previous dump, until user
cleans the previous dump or the timeout on the kernel side fires to
release it.

 From a distro-integration pov, I think it should have a udev rule that
fires when a devcoredump is created so the dump is copied to persistent
storage. Just like it happens with cpu coredump (see systemd-coredump)

Lucas De Marchi

>Perhaps moving the 'release' part to above paragraph will add required context.

not sure I follow. Are you suggesting to swap the order of "First
failure only" and "Snapshot at hang" ?

thanks
Lucas De Marchi

>
>> + * **First failure only**:
>> + *   In general, the first hang is the most critical one since the following
>> + *   hangs can be a consequence of the initial hang. For this reason a snapshot
>> + *   is taken only for the first failure. Until the devcoredump is released by
>> + *   userspace or kernel, all subsequent hangs do not override the snapshot nor
>> + *   create new ones. Devcoredump has a delayed work queue that will eventually
>> + *   delete the file node and free all the dump information.
>
>Raag

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FD8C83F09
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 19:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BEA10E041;
	Tue,  8 Jul 2025 19:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XkNm6EIg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D82A10E041
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 19:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752001845; x=1783537845;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BsS6xu4195dvq1U43tf54wfrMSGULbDgfyxVFiX+6rA=;
 b=XkNm6EIg4klL6tYszV0qtJJUMxlp6RyxUTnyWhiXfvxLU1ObJdBh/CDU
 LA252dOCu62zD+5ylgfV4gpgH9BgT2biVVtgKKvAfBd7HIAOo6dGkyOs8
 nPAA8EJ4orh3dYuu00NZeEBBxd4s5BOE0WLRzp304wBMdukQe2I4SmCiY
 149X71aozyBb5QAf/FYq4bYlbFKbBpIAlFLC51DkLfQavsDFJ4ECW64Wt
 pxXVJ2FVIJEkX76JYki4TyPuJkXIj96Uqa9rMmMql9JTrBJD+cruQXYsi
 2SKOmbUEdkmvnLNi3eLVB9pRd+GUvEkfoW1KX/uxM4ZkqmJY5gDM9H8v3 g==;
X-CSE-ConnectionGUID: 1UbxAzZ6SV6ghfdn53ylKg==
X-CSE-MsgGUID: vU1mBA8VT5yP7hwerSjTeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64947974"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="64947974"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 12:10:45 -0700
X-CSE-ConnectionGUID: tdIqCSL1Q/akkW5whMK3Ww==
X-CSE-MsgGUID: hg82XjlVRjmy6Gm1CpGydQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="159609001"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 12:10:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 12:10:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 12:10:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.60)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 12:10:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQ5J4K95QIi//5dRFAZFPCRT/jMT7vx008dj9LWb0UE+EW9iNNOw1gB0P5OHPSwfw25HngGEHQXWkAxbiXrg05Q30ilotc/qaloeIk0jbekievnGcXuv9aHQ4lXtvnCQfgAa9kEg11Gj/NwKtsQYvrDeqLBSfQu4USqsDw0zW0TpCf+aZ3K0xuiqh6ZvpGymKQQTzGMIpHLpdUp5dtIgq3axAZ27O+h0Gg0UVnQDCvVfkbpWizV0WtaBJBo9KcLkWu0ILeT4WZDhAtCcjA3s/UM7U84P3mTsdB8mXnZu64T7YB/Fm0WPGV5bQBcsGtRDKDeTdlq+wdTOnDDr9sCarw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlW0Nq59piEUtewaFVImR3LdJQPNRksYB/hZP98GMAM=;
 b=lBhrp3/FCEg8B6Qisozv8si0We7XjHz5h1CgZ+ZdSrUTBqfU4h8m4vyOQ9ZcvwXRdGFFYOnZTkW86hHSYl8FUnuUVzHFjaRz3GSGUzKhtP4nilC5rffIFf/vOKhSFKxuilkhrisTy2h5TBXh8QE+7hscB5Y+UWVDgXu8TqEP3qp3X41Du+bYkr4mQe584W/FtgVVfWCRsQx3vkaTiCJa/XVrT6ms1cMjGHY9exSZI9ZmYP5dfNDIC3ouNjONBAwBosCMHYCEuidhWZIX7GwrWLvGCijeZkmfre923Zqg3WoECHN+K6JZ4inrl69mZZe9Nm4LZ4fFchnJAFo0yTxHbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB4825.namprd11.prod.outlook.com (2603:10b6:806:111::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 19:10:42 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 19:10:42 +0000
Date: Tue, 8 Jul 2025 15:10:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH v2] drm/xe: Expose fan control and voltage regulator
 information
Message-ID: <aG1tLoXzBKdiy6D3@intel.com>
References: <20250704112305.2479800-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250704112305.2479800-1-raag.jadav@intel.com>
X-ClientProxiedBy: SJ2PR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:a03:505::16) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA2PR11MB4825:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b34eb78-db9b-4fb0-81fe-08ddbe53223c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gDLdhRHApIRZBJ75QC679U/0m+oXhexEnq2QVEw/4C+grGtiVUHoMrWgkjCy?=
 =?us-ascii?Q?DiHkOX1nOQoGBjxCVgj63KDFUYfPDmqclpAgErfxplSKMTNJl4D9/ak18QhE?=
 =?us-ascii?Q?2t/CUQMqA/Cpe7GDG2sANAM3hJ/A26p2MoFHv/bA1pFxFDBXzURyg1FZYmpO?=
 =?us-ascii?Q?GRNK0jex9y2gGE/LauTLnnTHZjMr3hBRSaO4klmRcMfcJ7u2JlWD4TxZnKpa?=
 =?us-ascii?Q?MC254ap68mGw+HP0PCUcxMNqpD67VKJTF4KelIVhZn4dV0AEPzjz6186wbpI?=
 =?us-ascii?Q?DbZ4SY1qujyVSCnGXCNBpsfW7uaGAwPxKDDGgmf9/8J8RW02s4/ZXGWLp59C?=
 =?us-ascii?Q?1ZIJ5uemqW6EODlXHlb6MJrCZHN3jGWR1FT5U9gvNMHRKtbtld/oxeKPxCzj?=
 =?us-ascii?Q?xaTZ45cDiMHu6P7b3fsjEiq53PsmAtDj37pfgquB6erXeTsnmtUGy4iZSXsr?=
 =?us-ascii?Q?Zrhho/FYhK3gyh3T2XJCHwkCec2t3xSJtfoh5sAZB7J9vTGzvfwpiWDA2Wi1?=
 =?us-ascii?Q?zmffOCclERAd8BDPUQt30ZtQF+Wz7Ks8wP15H4DSCHXM5TYssleRJRXEXkp+?=
 =?us-ascii?Q?l4nW6ZdB8oIGEZUjLDZR/aTDgW743Oy1t212GjU1//WAlQdlKRjZ9Cln86hS?=
 =?us-ascii?Q?chlkCI67UENLfhtvVXNEIzDkGXWbDmbJ5itG2H1ky5TzzAjDvEwJZ0QhgNRr?=
 =?us-ascii?Q?FKL/l9jYHsDhZfqGBnL6QxseQLKz2wc+CP9tfKQbTtDdSvV7Emai1e3vsjpx?=
 =?us-ascii?Q?7sZvOiLL6RPuBY4ZftbI76wp9LikFPFQUpVVqOmRv32QNf+OQiG0kqhYAcqU?=
 =?us-ascii?Q?T4SaCdzkyBYo18qwssYlOZGJ8X+PRvQYHW5ql7UoxQlttergdet0T62zDIGy?=
 =?us-ascii?Q?R/jUarYheRUst3yK3PQHxqPsPewJnbIYvabtkZzcpnrt5coaVzRNKlAUhLl+?=
 =?us-ascii?Q?tRCVz1kjqGCVBJhOp8nYasg0kFvcfXefuVxbAjSbqtY6cupFAFs2fWY1Q86L?=
 =?us-ascii?Q?soFOCNU53DaiVs4bdZI74AoNIkVwF0MvkvC5E77NeaIEiN65cLke3ADIfLlw?=
 =?us-ascii?Q?hJkGmfgFXGHbOKXF/InMG7hSLNSzoqXhi1snkqJnlWCpaaelmLazJYmmmx8g?=
 =?us-ascii?Q?BByXQAIsBUPA/UaOHfnjzol9A4mIXJd9oyyz4x/mkXij1iGEX15WsmI8EJFa?=
 =?us-ascii?Q?FuLl7Ngo7xP+A4Iy/T2htOqrWjeEZA+6dtGo6LzkpuA/SbhQYS/DqoshbkdZ?=
 =?us-ascii?Q?z1/cWuEYrOFIcLxxEbLAVs+v3YAt8/OMoBPOFjl8rV+mtCWGC+R/s7dc6ZfC?=
 =?us-ascii?Q?fmjmDiNndezt2rwZcokpD+rauUxYGA2XwqONBHnaWwQbfD7SsMTF7SdsWGW6?=
 =?us-ascii?Q?3rI6PvrlkaXEmVrTyZzp4rvI630lsIanBLn+CIN1joaB2ML+ZNhp6NTTiYhz?=
 =?us-ascii?Q?p7C02fCWfus=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RO3+Cv3ARgib5kmz3uRm9aaW17lGHYTpBKhhem253fswNETkOZ01Hz9BwOMP?=
 =?us-ascii?Q?EwCrkkTZxKbN8hK/Mr3RGpU0ysex9WEaEnco1YxT/3SbUQMs/CuK6Loh/wOe?=
 =?us-ascii?Q?BzDBSDUpHP+UPLDPRVUJCjldvNWeLEKy/r1aWO3yspW9XDvzWl8ZcUhT1Qac?=
 =?us-ascii?Q?GxP7Wytj5B6cj2Zzs3Vic1VfCxVodzqkMkxSp5qwPLnO54umOfgwikSldVRB?=
 =?us-ascii?Q?sbh6h3JFIfSl288OKYi3NIaUdW8sOOu/c6+Uj/2T2heHRa389c2IKissidPx?=
 =?us-ascii?Q?tIIuc8NvzWdpyu+1jiOOu4abjmnMyhHqtX4z8z8xMabCvPUNr2+tZi3qN21S?=
 =?us-ascii?Q?IhxIbV8vOgBsAMdT5cNN9We1vfi1gzxuDCBWe+qHQH1Vq+ADCSDRN+mtvdl3?=
 =?us-ascii?Q?0m3k/0zK8k7Zhy5FRSNFr9xQhcTfUmTZILpoMxEm5V5hwwuIYbrTkwfpupVQ?=
 =?us-ascii?Q?hsvMqhn9U/NYW18c9jgqcZc47dNj+TrofzRduHfYRRvj+23Sbc7wYT6TV2bj?=
 =?us-ascii?Q?/rwx1MuGx59eP8/0uGqKG1nyX4r4rMYTO9gdjSeUAbRDvN7a6u3ghDS+3fgS?=
 =?us-ascii?Q?BV3K9jPsG+O1VH5r/ftNqjqmY1GDhxoNjCNkk1nsrQ/CE4bQe7/PXPLdlU1H?=
 =?us-ascii?Q?ggP4iVj/kTh7Hh9VwdTK5IEjH8W/1CSAPozxgw3HmSQI2eKkOKA6ASH0j1cx?=
 =?us-ascii?Q?RfIfRjfJvuNE9O335fXPfQtSusdobmzpOWs9jI5j5xPkvadwvhwQ74Bc/3L7?=
 =?us-ascii?Q?EYkzGPv6WytrxXuhQEzt7UrSRV7mAtoTCCVyV6LLwlu7CdgxcUhvuLR4hfOj?=
 =?us-ascii?Q?kXUnQxuPiqn5uVc++acrdEXnEOhGGlozi1lrFRu4xryivzzfrP1qr45WgEzR?=
 =?us-ascii?Q?zFhnYTDbrIUrzvLa2i2Cmqunm3C9gKQ27KYRMkXr6HkzcIyMcCU/iynm1eVI?=
 =?us-ascii?Q?aORSNoY7qmpXToHXj5w6/KSI/24lYyXHEsnzkMOPFQ4J7gJ8NGLE1PIvtS+W?=
 =?us-ascii?Q?wHaeVY7btmDgNwUIwC/2w7LV37ytq4yLqAQjXLKDSDcmUSiZr/BuPKAEPCYp?=
 =?us-ascii?Q?kg6zNzO6c8iCstgHooAohAgol3PTLOmcmTcjXWIDpRVD7mkYczfXz1kxLPal?=
 =?us-ascii?Q?UsFwAL8OBVM2e7NK6Ls70c6H7bzG3utuFWksTUhRNCeZIZySlIccCp296GNn?=
 =?us-ascii?Q?q5+++TKN97b8lTCe6mtUfoEQJG7BP8oa9s+nsdb/4oNGuQKi4GlP05EDNNac?=
 =?us-ascii?Q?i5CpbB/y9mAW6IRPkOOpSiIxGIkLLPU3jmccTkcfl82yLTg7HLwv7Q2apMHi?=
 =?us-ascii?Q?yNcp2oh0ZZ/GB32yCkC/C/GTOZlCjpaXaBat6CeWJG80mvzV8SNVe7Fluhli?=
 =?us-ascii?Q?B4m8GOFAmAmAjEHMI0bd5/ApdTB6Fk30K+ci6pgWVNptaKKZkM6kEMBJjtSJ?=
 =?us-ascii?Q?Ei8bVtoCJPpLFPhcpse/+SzzOWCdroaV8MiS2o6LVcSgH2+xZL9yiSvGDwh1?=
 =?us-ascii?Q?q6jN+5QtbhEjGkNtcqRyOPpT2ayxZmXPORaonWKHFGZmWw1aHLxFvHYXuRBK?=
 =?us-ascii?Q?iK9IquZt8BfV1TGEeZW37M0P4G5YgVVW+0JAcLGqcxWonIPChYMrxaes07gn?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b34eb78-db9b-4fb0-81fe-08ddbe53223c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 19:10:42.4839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IvkwoxRlS50rATs5R6sgqAeW4R1D9nFRovNTJk+uFm47X7zJNpDVzn32IQ5FLtCqE3xIf+lfv18QBgX9J8OIVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4825
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

On Fri, Jul 04, 2025 at 04:53:05PM +0530, Raag Jadav wrote:
> Expose sysfs attributes for late binding features which provide information
> about their support, provisioning and bound version to the user.
> 
> v2: s/late_bind_fan_info/lb_fan_control_info (Badal)
>     s/late_bind_vr_info/lb_voltage_regulator_info (Badal)
>     s/LATE_BINDING/PCODE_LATE_BINDING (Badal)
>     Add VERSION_MASK macros (Badal)
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 121 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pcode_api.h    |  15 ++++
>  2 files changed, 135 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index b9440f8c781e..8a1bb2b7c951 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -24,6 +24,15 @@
>   *
>   * vram_d3cold_threshold - Report/change vram used threshold(in MB) below
>   * which vram save/restore is permissible during runtime D3cold entry/exit.
> + *
> + * lb_fan_control_info - Fan control information of the device in comma
> + * separated format as ``<supported>,<provisioned>,<version>`` with optional
> + * ``<version>`` field which is available only if provisioned by late binding.
> + *
> + * lb_voltage_regulator_info - Voltage regulator information of the device in
> + * comma separated format as ``<supported>,<provisioned>,<version>`` with
> + * optional ``<version>`` field which is available only if provisioned by late

Ouch. I have to apologize here. I had overseen this patch, but only with the
version in mind. Only now, while I was going to merge this patch that I noticed
it has fancy format against the written rules:

https://docs.kernel.org/6.15/filesystems/sysfs.html

"Mixing types, expressing multiple lines of data, and doing fancy formatting
of data is heavily frowned upon. Doing these things may get you publicly
humiliated and your code rewritten without notice."

For simplicity we should only do lb_fan_control_version and expose that only
if supported and provisioned.

> + * binding.
>   */
>  
>  static ssize_t
> @@ -65,6 +74,110 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>  
>  static DEVICE_ATTR_RW(vram_d3cold_threshold);
>  
> +static ssize_t
> +lb_fan_control_info_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +	struct xe_tile *root = xe_device_get_root_tile(xe);
> +	u32 cap, ver_low = FAN_TABLE, ver_high = FAN_TABLE;
> +	bool supported, provisioned;
> +	int ret, len = 0;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> +			    &cap, NULL);
> +	if (ret)
> +		goto out;
> +
> +	supported = REG_FIELD_GET(V1_FAN_SUPPORTED, cap);
> +	provisioned = REG_FIELD_GET(V1_FAN_PROVISIONED, cap);
> +
> +	if (provisioned) {
> +		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
> +				    &ver_low, NULL);
> +		if (ret)
> +			goto out;
> +
> +		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
> +				    &ver_high, NULL);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	len += sysfs_emit_at(buf, len, "%u", supported);
> +	len += sysfs_emit_at(buf, len, ",%u", provisioned);
> +
> +	if (provisioned)
> +		len += sysfs_emit_at(buf, len, ",%u.%u.%u.%u",
> +				     REG_FIELD_GET(MAJOR_VERSION_MASK, ver_low),
> +				     REG_FIELD_GET(MINOR_VERSION_MASK, ver_low),
> +				     REG_FIELD_GET(HOTFIX_VERSION_MASK, ver_high),
> +				     REG_FIELD_GET(BUILD_VERSION_MASK, ver_high));
> +
> +	len += sysfs_emit_at(buf, len, "\n");
> +out:
> +	xe_pm_runtime_put(xe);
> +
> +	return ret ?: len;
> +}
> +static DEVICE_ATTR_ADMIN_RO(lb_fan_control_info);
> +
> +static ssize_t
> +lb_voltage_regulator_info_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +	struct xe_tile *root = xe_device_get_root_tile(xe);
> +	u32 cap, ver_low = VR_CONFIG, ver_high = VR_CONFIG;
> +	bool supported, provisioned;
> +	int ret, len = 0;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> +			    &cap, NULL);
> +	if (ret)
> +		goto out;
> +
> +	supported = REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap);
> +	provisioned = REG_FIELD_GET(VR_PARAMS_PROVISIONED, cap);
> +
> +	if (provisioned) {
> +		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
> +				    &ver_low, NULL);
> +		if (ret)
> +			goto out;
> +
> +		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
> +				    &ver_high, NULL);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	len += sysfs_emit_at(buf, len, "%u", supported);
> +	len += sysfs_emit_at(buf, len, ",%u", provisioned);
> +
> +	if (provisioned)
> +		len += sysfs_emit_at(buf, len, ",%u.%u.%u.%u",
> +				     REG_FIELD_GET(MAJOR_VERSION_MASK, ver_low),
> +				     REG_FIELD_GET(MINOR_VERSION_MASK, ver_low),
> +				     REG_FIELD_GET(HOTFIX_VERSION_MASK, ver_high),
> +				     REG_FIELD_GET(BUILD_VERSION_MASK, ver_high));
> +
> +	len += sysfs_emit_at(buf, len, "\n");
> +out:
> +	xe_pm_runtime_put(xe);
> +
> +	return ret ?: len;
> +}
> +static DEVICE_ATTR_ADMIN_RO(lb_voltage_regulator_info);
> +
> +static const struct attribute *late_bind_attrs[] = {
> +	&dev_attr_lb_fan_control_info.attr,
> +	&dev_attr_lb_voltage_regulator_info.attr,
> +	NULL
> +};
> +
>  /**
>   * DOC: PCIe Gen5 Limitations
>   *
> @@ -151,8 +264,10 @@ static void xe_device_sysfs_fini(void *arg)
>  	if (xe->d3cold.capable)
>  		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
>  
> -	if (xe->info.platform == XE_BATTLEMAGE)
> +	if (xe->info.platform == XE_BATTLEMAGE) {
>  		sysfs_remove_files(&xe->drm.dev->kobj, auto_link_downgrade_attrs);
> +		sysfs_remove_files(&xe->drm.dev->kobj, late_bind_attrs);
> +	}
>  }
>  
>  int xe_device_sysfs_init(struct xe_device *xe)
> @@ -170,6 +285,10 @@ int xe_device_sysfs_init(struct xe_device *xe)
>  		ret = sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
>  		if (ret)
>  			return ret;
> +
> +		ret = sysfs_create_files(&dev->kobj, late_bind_attrs);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 0befdea77db1..92bfcba51e19 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -50,6 +50,21 @@
>  #define	READ_PL_FROM_FW				0x1
>  #define	READ_PL_FROM_PCODE			0x0
>  
> +#define   PCODE_LATE_BINDING			0x5C
> +#define     GET_CAPABILITY_STATUS		0x0
> +#define       V1_FAN_SUPPORTED			REG_BIT(0)
> +#define       VR_PARAMS_SUPPORTED		REG_BIT(3)
> +#define       V1_FAN_PROVISIONED		REG_BIT(16)
> +#define       VR_PARAMS_PROVISIONED		REG_BIT(19)
> +#define     GET_VERSION_LOW			0x1
> +#define     GET_VERSION_HIGH			0x2
> +#define       MAJOR_VERSION_MASK		REG_GENMASK(31, 16)
> +#define       MINOR_VERSION_MASK		REG_GENMASK(15, 0)
> +#define       HOTFIX_VERSION_MASK		REG_GENMASK(31, 16)
> +#define       BUILD_VERSION_MASK		REG_GENMASK(15, 0)
> +#define       FAN_TABLE				1
> +#define       VR_CONFIG				2
> +
>  #define   PCODE_FREQUENCY_CONFIG		0x6e
>  /* Frequency Config Sub Commands (param1) */
>  #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
> -- 
> 2.34.1
> 

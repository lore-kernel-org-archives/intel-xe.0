Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416D2CCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 17:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23B210E31A;
	Thu, 30 Oct 2025 17:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fuAu5edc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD76510E31A
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 17:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761845137; x=1793381137;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L9xilc+bj5yUD1Ma++GRyU0ukjkJ0IiCtl4lKQEf/MQ=;
 b=fuAu5edcnlvMsmUItuokkWQuI81sgF7PrmCkX3Tu/23tMJwzKJZamTQ2
 oP3BWqKf3oJC9BvIak+TunIE1b3iCtSHlqofl3Iq9Qj7DB2dP78JHlhnm
 bylYUxjjdWcOIznoSbsGBm8+sQeIG754ri5+5vwYL86FhGKdbwvpSkD2v
 CURt2MelD5HECjBS+yLnXLw/RaZzjJ11rsFCzs7mGQs+U0qRQSlh1RPfC
 CBxVOwxCvceRxJqae3Jq2WFL3hBhxJUGeS36vKiVorVljdSXauFLv3WRR
 HmrWjvBloUuFpv+fmJYqGo/+qli1YoDVocOIaqaIQfcgo5g2KoOlUyjGw Q==;
X-CSE-ConnectionGUID: QA/TvgVuSy6GvGpd5Xfusg==
X-CSE-MsgGUID: P5r8aiPGQeei62G4NTatfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="89462400"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="89462400"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 10:25:36 -0700
X-CSE-ConnectionGUID: g1RoT5RgTqy0GTxHuqV1yw==
X-CSE-MsgGUID: CyXhQ+1rQvaUifvbfPinMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="191166915"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 10:25:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 10:25:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 10:25:36 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 10:25:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRIVvHuUjO+hFYDcJVZtspRQ6Y5WlFCS8JAVcK1XQ8pNCddpK0/3CPj2KNOS+PqsKV/MOAFuK/noJzlN1iwN6x6moAxlk2Y7io2tsFM3PHfpltjaeG6okExpORhW8Lp8FAjW4fA8jTJLWTbodDGpeLFM1HyP/0LC7vktnybxqFKI9ySaHA9g54Ss3doeLrQE3gB6r/NtefvmMdUXtZ6ZoUq4HtmWgb5iNkuXxMjejL6kKsEf/sO2DL0FWq9tXTnSN+TisNlXOapdGg4WhoC65Fi7FrF7+sWPCPJ4DFSBzNqUiofDYSqUe0kjrtDdjjA8/CNfw0iXUJUGVvm1w0PpgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWqKqbxTllRglFkjfMXAGcCp2I9f6HjnxcglyytEie0=;
 b=CEyLcDmiuvjGOlZHiRabFeYEl4V45NfWfCy0t3QzxWwXweXBcjJwRrhPn2V2L2T+FSHQ6fomWwaLK/f7b1GlzC96cvttKcOqYmZV0P3uDrHuq9QYc4O9yLv6JzZmphoKuAlPUY3/8fi1pEmnhGSLcuOBaNcxTu54havsg117UeeMxS5m8BftHtGlmbvrUer+JSTTFCRqLB2uGb2StAYyL/WcPVk1EAzpXVe6LNYTjqmuOwnjFV2Vkoc+YPpMql3GoUuIuwbVTF9Dut2CfthDMFeXg0kGZBaPAbXGssThx+3SRFRCrJjB5Nl+gW66GwPZuuqWIIvBmL/6oo96rSgiyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6436.namprd11.prod.outlook.com (2603:10b6:208:3bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 17:25:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 17:25:30 +0000
Date: Thu, 30 Oct 2025 12:25:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 17/17] drm/xe/pf: Add documentation for sriov_admin
 attributes
Message-ID: <om52bqvbzzsw53bkrxyan5l3jribcbxg3sedwesw2exgsnyx3g@xqiy7tgg6w2z>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-18-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251028175832.184534-18-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: bc9443f0-7671-44b9-97e8-08de17d95300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Nc1UUC0IKUtqPfVxlh7DgHQNtsws3aOuZBsRWg5E7A5ueOcytTPZUJf25bBz?=
 =?us-ascii?Q?ohMtr4P+csWF1dX/stUxsczNTedh2Nqi5Ym6+1ZelWvDwrl+VOA7SnYiBjVM?=
 =?us-ascii?Q?E2tvxfn8hGdzZbIJpT6rPDOg5Aa77Cxvhb37yFHvcTp0uMKx1QkdNShv7K0s?=
 =?us-ascii?Q?PN3jVGKR49JI+/UZu2l33zuIfqb4HFnQ7S8jM5Lt+ZelxfhNvdrrnGuTBEXl?=
 =?us-ascii?Q?ePBY7TxD9BtGO9KD89gRN7uJZgMbtVHaCugyc0sEruG0pAdQwRrY0d+i2l8z?=
 =?us-ascii?Q?ST90GDbRzlYOJxpCl/Sww1HHdUAAO8kA107xLwsTCs8iJSpurZF2Ur+vpqlY?=
 =?us-ascii?Q?om/0sfylHj7XVsNM4qIE3SaPf5Dqe8Y+J933QvEeGhFqj3ztJascdUxXUwux?=
 =?us-ascii?Q?FlY98lzC16ohRJjyL270/KecRFXxFEcVSuIWWGtFuu44WswHhFUD9+8Ohbml?=
 =?us-ascii?Q?yr1F79PWujygAo1SRJXt9vA9LfrE1e+HC1YjETdliRiTZPgVTn2YPcqN/M4y?=
 =?us-ascii?Q?1JXiEOvYH20RUlaVet7fUAm61NG1jpi0Z0t/RdTROZl9XfKPaEtvj6HlvvAj?=
 =?us-ascii?Q?zqSq2jQGpjVRunAN4rLVdz2lgiSV+sV54ch5bKYpWs9VdWBKMDJQxj2PdmuO?=
 =?us-ascii?Q?5UPfIYGjPfv49ZCdfffcx4YMzQWHuIfthp9smIL2qCRphcCBxZtRMWBmboxc?=
 =?us-ascii?Q?sqVZwS1Bp5a3yfCvulqDKjOmdbvjxMRSHj5v3twEYBEukLh1o4egTQvphwbH?=
 =?us-ascii?Q?6Jdo6LUhlL0XuH/vwb0dzgC+uTd/nz2e26DVIJcMw/sId6F8pTn3EB8CgGRh?=
 =?us-ascii?Q?6e9wbGmj1nREfy3JYdsiH2+MZ9wUrkTab0M3qBsj0nLJ9qARKA8dQZKDcHW1?=
 =?us-ascii?Q?2ZHFio8goM/MwMO8cs3QzvMvL6DmsBSK4RuCZi+ibDfSm0idFWYaKWzYmr8b?=
 =?us-ascii?Q?wGA+EzGCyfmi9NrzVjCDpmTUB2HkC+2J2IyV6+Cwt1XCh6hLxpDluikpuHuv?=
 =?us-ascii?Q?anIlx8yqjUBZjK07ts1/2CvUy8ZEx+eVn+LI06sKtOEIZDeObqdMNXMJzgb4?=
 =?us-ascii?Q?ziqJg6Sa6CeFId6vp7QGfdEX4KjZr8qflFHQHqzXqY9vXlqDdQ6s4zaZTHfe?=
 =?us-ascii?Q?mbkblfgfsvdyypUEtZmCgQ62vaA/XBJbr/0r51VOBbH/dUFk7SQP0CNP5zxm?=
 =?us-ascii?Q?wFUwNEQVjHIgT5tOUpC/rkoYo0/5ZQLQmyqfPlkbptJD4nJbYuclgYayOnrX?=
 =?us-ascii?Q?ZrrMh55y/n1GF6BEH56fqn7016K4HzSUgOEgY+KoFyhiuk0AeS+Mj4ZLdAOB?=
 =?us-ascii?Q?7tMmcgdPUWo8u7BWg4ye/Qemkx6yUYHTLqhv1FuFa5uI0hK0c/mO5/Y79ae1?=
 =?us-ascii?Q?Bl9pt00feEgUUP7UnmrpIhYMm8Bv7i/wQ9esxCHYQ6geYjM1QYGxl0r40H/7?=
 =?us-ascii?Q?7yh5hX+FY1vhGDO6QGcIKy5C6OeFQaVk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TCtuwgAUVw9nGZEqUIrk36INdHQyjUH+aUEvk8DKi7cTtjcR7B+07rA2cTf4?=
 =?us-ascii?Q?g8sdVpxyq+33mwUgql1fIyvgFp4qMErbZAhIVbj55/VmaYE6FoTfr2XFw52I?=
 =?us-ascii?Q?KIS+wItdOQx4iopzoGPQbMM+J8Au9m8aD0HT0RfvLFrhMFvZQYkKSU02IgJo?=
 =?us-ascii?Q?txy2jjpAoyVTQl4SnZ1iA3kgTrkTqJECxP5tzrKu4tokaUFdnA2mVUkT8rdj?=
 =?us-ascii?Q?tG+EDgDnnbj1fvk1Jfyyz8k6MYYnBpPQfMrmf1HGFmGijaP6uI3gFykMDzn3?=
 =?us-ascii?Q?+D4rJysj0UYJrg52i2sW6usMPNzsm3swTYEzCNgiJx7HpmuAAW7gR+JTn1HH?=
 =?us-ascii?Q?PzPDBxjXqF4nPig3aYRoMJEYRCcDU4RrcgvQP16n6/XW5aaWIovzI9gc5OKx?=
 =?us-ascii?Q?hO73FDw8lHPd4vt++DC7xJLyAr3yh3eohltbxB1QfCl2ZSxP5CJX5cm9dUkR?=
 =?us-ascii?Q?EyzXb1ofGyDiB8dnjSkYwwNxvsx7XVZnv4WL+RpPF3HxLmwCzAGk+xk5RD8a?=
 =?us-ascii?Q?cpXl8NoDbl8jg8bGtCkpJyIcM7QwTsnqq8LVV6cbJUT+FFu1hitv5C+5h8yG?=
 =?us-ascii?Q?zhIJqHrbjBUJK3PQ8shlwQlI8ydTN+QChze3XH/Hp5QcYmZqkbKn992E6aAE?=
 =?us-ascii?Q?41IG8a7nSucG5v9Z4QX8DwlF/KyYpN7Dli/nB1OgKy2sToqwA16oh3gYBkVz?=
 =?us-ascii?Q?h3X/CUaHPS+ygo4PJO/vFITboeql7x7G8KmLyKu/997qfcQGGuK+UH57e+nQ?=
 =?us-ascii?Q?qW1uF9CpX9uQ3g1tFS8aJW2XEbeMRKtZvEp7ACUKMGpbLJZLZMEKK7gylnDt?=
 =?us-ascii?Q?t1oIQt1Ic74E1FDfXluwktgzI4k0NRsBrY3Fgz2U5o9iTg8b7P3emYhA96Hj?=
 =?us-ascii?Q?m0ZsWtwUHTVCAJ+vidxkWDpK2dkjc9xzrVyn3ZUZPbTtyeu9SiFubieD7fcH?=
 =?us-ascii?Q?rJ2ZK63Dl7l9Q4Z+kO8abMqgetbdCobw3e2KrDnUDYFgbK0SEFcRwAnoQLG6?=
 =?us-ascii?Q?D2cUmoMh7ZTPWBa79Alo+0ujIvgFR4mWJWao8pi51J+Z7RmCbxR8eS4eKkh5?=
 =?us-ascii?Q?ilpDU8l9YEy53EVWtItU0bJdbSkSuq17xw6BrJfAEQG2UtBJuRWJIQCQggO9?=
 =?us-ascii?Q?uwnDjcUBuIOh/jSBva3Lr6s+kPQDHiqiaJ6klJcRGhY+RveHaN5i7QG+GtN9?=
 =?us-ascii?Q?9gL8hsdNoVGyzDJsLIQ5VBqtaQavt1MM6Yyzx22yG0gxTjQXUL4THqqICSWm?=
 =?us-ascii?Q?PKTeUyj7nY9MSNZThYSIDVhkyEty8GR9fObv7KwByVLBatwjHA1zdtyHLYfa?=
 =?us-ascii?Q?yqGUliNrEjjXd5kozKwxzdrJjKghwlMoQQKkEFmuOkakCBIAmyk02Hn79Fz3?=
 =?us-ascii?Q?FY2zqgDPnjW4UoPsvVY3iUR82oQm+CV63OC/SLsJUz496xH20IRp0GB4132C?=
 =?us-ascii?Q?b63LLKcNUnYBqTTaKhErOjLAN4NiWCoxj2+ktrBJsX+CcOZGbYihernSbTrl?=
 =?us-ascii?Q?1gbnYm0tzEn8+BK+9x1zs5t827LzfXDUBT+OdMugFjT/UWteDH+OyQTRTD+J?=
 =?us-ascii?Q?eVXGegXy9EFGtu2Yz0wXRqcUC4JWYAVHgQL7WSChLli/u6MofWoLM7fa16s6?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9443f0-7671-44b9-97e8-08de17d95300
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 17:25:30.3226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UikVm9ItBR4601SH2uTYEQ8PEt/vYj5XMIS0rvz/iw65n6HRGryPriuYg4rfWyYXhSUYK2dRU4poUQoWSHzEkKs97dn5gDloYULS7uVWVSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6436
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

On Tue, Oct 28, 2025 at 06:58:31PM +0100, Michal Wajdeczko wrote:
>Add initial documentation for all recently added Xe driver
>specific SR-IOV sysfs files located under device/sriov_admin.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
>v2: update version (Rodrigo)
>---
> .../ABI/testing/sysfs-driver-intel-xe-sriov   | 160 ++++++++++++++++++
> 1 file changed, 160 insertions(+)
> create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
>
>diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
>new file mode 100644
>index 000000000000..ac688a66bf36
>--- /dev/null
>+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
>@@ -0,0 +1,160 @@
>+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/
>+Date:		October 2025
>+KernelVersion:	6.19
>+Contact:	intel-xe@lists.freedesktop.org
>+Description:
>+		This directory appears for the particular Intel Xe device when:
>+
>+		 - device supports SR-IOV, and
>+		 - device is a Physical Function (PF), and
>+		 - driver support for the SR-IOV PF is enabled on given device.
>+
>+		This directory is used as a root for all attributes required to
>+		manage both Physical Function (PF) and Virtual Functions (VFs).
>+
>+
>+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/pf/
>+Date:		October 2025
>+KernelVersion:	6.19
>+Contact:	intel-xe@lists.freedesktop.org
>+Description:
>+		This directory holds attributes related to the SR-IOV Physical
>+		Function (PF).
>+
>+
>+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf1/
>+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf2/
>+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<N>/
>+Date:		October 2025
>+KernelVersion:	6.19
>+Contact:	intel-xe@lists.freedesktop.org
>+Description:
>+		These directories hold attributes related to the SR-IOV Virtual
>+		Functions (VFs).
>+
>+		Note that the VF number <N> is 1-based as described in PCI SR-IOV
>+		specification as the Xe driver follows that naming schema.
>+
>+		There could be "vf1", "vf2" and so on, up to "vf<N>", where <N>
>+		matches value of the "sriov_totalvfs" attribute.

matches the

>+
>+
>+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/pf/profile/exec_quantum_ms
>+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/pf/profile/preempt_timeout_us
>+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/pf/profile/sched_priority
>+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/profile/exec_quantum_ms
>+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/profile/preempt_timeout_us
>+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/profile/sched_priority
>+Date:		October 2025
>+KernelVersion:	6.19
>+Contact:	intel-xe@lists.freedesktop.org
>+Description:
>+		These files represent scheduling parameters of the PF or VFs and
>+		are available only for Intel Xe platforms with GPU sharing based
>+		on the time-slice basis. These scheduling parameters can be changed

I didn't like how the "based ... basis" was, so tried to improve it.
Suggestion:

These files expose scheduling parameters for the PF and its VFs, and are
visible only on Intel Xe platforms that use time-sliced GPU sharing.
They can be changed even if VFs are enabled and running and reflect the
settings of all tiles/GTs assigned to the given function.

>+		settings of all tiles/GTs assigned to the given function.
>+		even if VFs are enabled and running. Those parameters reflects
>+		settings of all tiles/GTs assigned to the given function.
>+
>+		exec_quantum_ms: (RW) unsigned integer
>+			The GT execution quantum (EQ) in [ms] of the given function.

s/of/for/

>+			Actual quantum value might be aligned per HW/FW requirements.

Is the aligned value returned on read so user can know the actual value?

Does this need to be expanded to mention what is a GT execution quantum?
I don't think we have it documented elsewhere. How does a 0 in one of
the functions interact with the others not being 0?

In the scenario below, I was expecting the functions to get 1/3, 1/3, 1/6, and 1/6
of the GPU, but I'm not entirely sure:

	cat sriov_admin/*/profile/exec_quantum_ms
	100
	100
	50
	50

>+
>+			Default is 0 (unlimited).
>+
>+		preempt_timeout_us: (RW) unsigned integer
>+			The GT preemption timeout in [us] of the given function.
>+			Actual timeout value might be aligned per HW/FW requirements.
>+
>+			Default is 0 (unlimited).
>+
>+		sched_priority: (RW/RO) string
>+			The GT scheduling priority of the given function.
>+
>+			"low" - function will be scheduled on the GPU for its EQ/PT
>+				only if function has any work already submitted.
>+
>+			"normal" - functions will be scheduled on the GPU for its EQ/PT
>+				irrespective of whether it has submitted a work or not.
>+
>+			"high" - function will be scheduled on the GPU for its EQ/PT
>+				in the next time-slice after the current one completes
>+				and function has a work submitted.
>+
>+			Default is "low".
>+
>+			When read, this file will display the current and available
>+			scheduling priorities. The currently active priority level will
>+			be enclosed in square brackets, like:
>+
>+				[low] normal high
>+
>+			This file can be read-only if changing is currently not supported

This file can be read-only if changing the priority is not supported


rest looks good.

thanks
Lucas De Marchi


>+			for given function due to any known HW/FW limitations.
>+
>+		Writes to these attributes may fail with errors like:
>+			-EINVAL if provided input is malformed or not recognized,
>+			-EPERM if change is not applicable on given HW/FW,
>+			-EIO if FW refuses to change the provisioning.
>+
>+		Reads from these attributes may fail with:
>+			-EUCLEAN if value is not consistent across all tiles/GTs.
>+
>+
>+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/.bulk_profile/exec_quantum_ms
>+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/.bulk_profile/preempt_timeout_us
>+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/.bulk_profile/sched_priority
>+Date:		October 2025
>+KernelVersion:	6.19
>+Contact:	intel-xe@lists.freedesktop.org
>+Description:
>+		These files allows bulk reconfiguration of the scheduling parameters
>+		of the PF or VFs and are available only for Intel Xe platforms with
>+		GPU sharing based on the time-slice basis. These scheduling parameters
>+		can be changed even if VFs are enabled and running.
>+
>+		exec_quantum_ms: (WO) unsigned integer
>+			The GT execution quantum (EQ) in [ms] to be applied to all functions.
>+			See sriov_admin/{pf,vf<N>}/profile/exec_quantum_ms for more details.
>+
>+		preempt_timeout_us: (WO) unsigned integer
>+			The GT preemption timeout (PT) in [us] to be applied to all functions.
>+			See sriov_admin/{pf,vf<N>}/profile/preempt_timeout_us for more details.
>+
>+		sched_priority: (RW/RO) string
>+			The GT scheduling priority to be applied for all functions.
>+			See sriov_admin/{pf,vf<N>}/profile/sched_priority for more details.
>+
>+		Writes to these attributes may fail with errors like:
>+			-EINVAL if provided input is malformed or not recognized,
>+			-EPERM if change is not applicable on given HW/FW,
>+			-EIO if FW refuses to change the provisioning.
>+
>+
>+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/stop
>+Date:		October 2025
>+KernelVersion:	6.19
>+Contact:	intel-xe@lists.freedesktop.org
>+Description:
>+		This file allows to control scheduling of the VF on the Intel Xe GPU
>+		platforms. It allows to implement custom policy mechanism in case VFs
>+		are misbehaving or triggering adverse events above defined thresholds.
>+
>+		stop: (WO) bool
>+			All GT executions of given function shall be immediately stopped.
>+			To allow scheduling this VF again, the VF FLR must be triggered.
>+
>+		Writes to this attribute may fail with errors like:
>+			-EINVAL if provided input is malformed or not recognized,
>+			-EPERM if change is not applicable on given HW/FW,
>+			-EIO if FW refuses to change the scheduling.
>+
>+
>+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/pf/device
>+What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/device
>+Date:		October 2025
>+KernelVersion:	6.19
>+Contact:	intel-xe@lists.freedesktop.org
>+Description:
>+		These are symlinks to the underlying PCI device entry representing
>+		given Xe SR-IOV function. For the PF, this link is always present.
>+		For VFs, this link is present only for currently enabled VFs.
>-- 
>2.47.1
>

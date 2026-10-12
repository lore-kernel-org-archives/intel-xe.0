Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3971CA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 08:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599F810E53E;
	Mon, 12 Oct 2026 08:29:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F1610E53E
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 08:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791793767; x=1823329767;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QnKwDqsiEAUmx9wpcZkdUo1gI0l/tpkaJxKtAOVCWq4=;
 b=mdND1kV2n4u3CEMsBBbUVuEz2tWlTavG57DD7sKyhYpXNUhtvaeCh2Sb
 EbyzYNcIFfzpnJ2JcI4av7QMk0nvF1QO9S7qaWCd3NbFbe8WyUTdiuMmf
 ARcxzSkg1pitvX8Ku3uTFf/4uprV1SHwbvEx6L7+PVU8eZG3q/ZGtYRK+
 /yAULLFnog8Or23V9yOUR/nXsCtCCizwcCByOb6t8CoRXwpX9mXocpFfx
 62NIflV8kqwoMIRyT3QVu1kFldXjT29Oo5c3rUIt27LjBwY809c2JkKIk
 2gMlUsWbGF5H1ZatOEZ14r8oIKkVKVNOdk64Lg9l8Ys/u/OzGajvt+9pq Q==;
X-CSE-ConnectionGUID: Xj+yGdkoQS67SB6uJ3mvrA==
X-CSE-MsgGUID: y0hjEBgiRv6Z9SUEvlL9nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="370627"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="370627"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 01:29:27 -0700
X-CSE-ConnectionGUID: RE/sVF6uTTCbfJaALuwq8w==
X-CSE-MsgGUID: whKgGA3pRzuNBgZv4aFe/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="826871"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 01:29:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 01:29:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 01:29:25 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.40)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 01:29:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vovHYF9DUjgxcEiSs00htUtXKxcLylXgHm5YSKRS00W1+BxtQcK+JokRmh5olbjX/YTvlqEaJOUNSxNUL4EFsW54Vo4vef9R3uNy9JVWqq49DLiWWSS4tDAYC1zrU3T2XWM5vzo3PFvHmtKlP9xbzXPA6xcboMRA5H/IlCID2RbFoBSmTuSz8YGwEC+96qRvZXsyqhUM71Uunjumcr/E6gupZiobcYLa45RIPPXOdrNqC720/7whr7oLPqNTerRGViLVwTFW9hYLmv4HvJQRnzq7rYgFIW0K3BGkdJ8k6dvJsLkfqtC3UuF3PjQ5mS9HUSW2rtZeeVu2gAChWMAkkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUy66Uc6gF2wjdJFAOPKOCWgn4s24y0ZK3Amva6oDCM=;
 b=RMV5H6iJBU6uvl+ZRo78NCxOuShE0e8erC0M8wVFf/l9750t0eSTAHBlwGhK/a7Loa1XIhMjqqkZPt2DW86OU9Ozh2G5yfXErlHhBAOUl2X7gMWUqa9QvSnEfDTHkVz+1twatxuY2x9MNZB25+wdX4NrvQ8UhhEMSzfF4cWEnI2EzRU2W8YJi82UDy654eBZ5V4QijsNvzkkWGAgnMblRYjzWrdeNGMATpQM2EeDN7M86CAZxv9zOjufYosawsHuYMDXJeIXwgnMIGLR25oZg9StSMEp2i+Nnx42c9h/zHl9FdMfWZbQtkJauk4Lclq86Gx4GzMx/PXJumUmaHc5LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA3PR11MB013943.namprd11.prod.outlook.com (2603:10b6:208:548::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 08:29:24 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0496.015; Mon, 12 Oct 2026
 08:29:23 +0000
Date: Mon, 12 Oct 2026 10:29:18 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v5 1/3] drm/xe: Prevent VF memory IRQ from accessing a
 torn-down engine
Message-ID: <20261012082918.4lslyg5llghdl5dq@intel.com>
References: <20261012055053.964468-5-satyanarayana.k.v.p@intel.com>
 <20261012055053.964468-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261012055053.964468-6-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA3PR11MB013943:EE_
X-MS-Office365-Filtering-Correlation-Id: 946298d4-1863-46b8-377b-08df283aeb76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|4143699003|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bCDay1tV9bpMiHUlyW4tzm8Cj+kzCmkHzCGcpK2DbdTGVHtHo+EFQS0W7vNKjULfRLT9iqmHh5vjLscVLMifDbKrpoy0XUrtvv67ogHyQY9PZhSZNdMm97KqanOT1siRFPQWDy+m61p7qdjFgi9nppoh0MFMs4wIO0ptxmJP+AA+umqe7AriaIyYOYRmDVDWMdiiMLYEExUwtc4OFjmgCb6GNPi42co3C+FNUR2C075z9/O+MZ8TFDTiP1d0m/Zoc/+tAXHX322i0KoFv3HsmtBRCpJzwBXMq1EK6NfMx0dyhlrggRAhkWJBL08QjHSCh6yFXPOqUeQKjHc8lRuoolCpFw3so6RigY8usUsJu4a5iqt0E3UJBj9qHindCQsgQU/neXrrBpuu8+7ZMNslOiegXF8udQYZLJm0NF4bk94XbKltYQfhvCCwwnjvCbjh7JyaRSKnbk26nn69UxHO3as0HdugJJKMuzkRPrjxcj5+V5xPjL2hl2QzOqVUr5qwyXNhdJ+rQImyzoNZXY7IoD6AurFkp3KhmE6VhJ51dpGSYjbi6Q8VAN46+JIbTIcz3gmOnUTLWTjAFa+ALSL3DIyBIxpHKaeDLKMyqWeR9XQttIa8dXV2VL11zX5t9zu3qTI+eHaDu4uOGpFh4V8CvmRHqIZtz/gInUcyoG1B8wg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUNlMUplU0gyOTZWMVcvbEQrdWEwQmNjSzdna0RBS0lrWTNmK2VrWlpNZDVu?=
 =?utf-8?B?Z3o0S2NlR2piNk1vODNpUG5vQjJnSS9rbU96UFlOSjdYaTFqSjNYcEVyK0ls?=
 =?utf-8?B?d1BZTEQ5U1RKK1RkVWNoZkM2MHAzK0ZvWHJIUFBYRW9pNnUzaUhyNjZsOUlN?=
 =?utf-8?B?Nmh1bE54R1BJd2ZNMllLK01OUDc0NGdTT2E2V3ZVbU81dFZYMmRSUFNkdEYr?=
 =?utf-8?B?UU5nay9VOFRaNGZySGZFVWlrSHZxT3N0ZTJtNXNRZnVPR0R3OVZXZ2lVVzk5?=
 =?utf-8?B?ejduMlR2RllYRUFLWWJCc1JSekd5NmFCWmhBUGRqRG8rOEMvSWp4aFdhcDl5?=
 =?utf-8?B?RmgvREdSaitYVUxvcDBJZVp4S2JoenFQN1QwTHEvZDJwcUt1RkYxNzU5Z0dP?=
 =?utf-8?B?U085cHo5YjlOUnB5T2JSMFRlWXdoTXNkZXZaYUlpcmtnRmRocGR4M1BLUGtq?=
 =?utf-8?B?bDJpWkd2ZFdlSVdoYmRRVFdMcjhDWDMxOHVvVmtYUnNUR1RaNy9OWGJpTGdJ?=
 =?utf-8?B?YU11WjFmcXBFeWN4SGVRcHNpQUgrWWN5WVNES09OUTJnNndFbkJ5cHV3QVVk?=
 =?utf-8?B?cWkrWWp2bWdMUUwzQ3ZFcUpRZFl3V29WdlI0d29EVTltb05ETFFiMUh4Q2FR?=
 =?utf-8?B?NGlaNyt3QnBzM0toMU9ycjgxUTFZc0xKaUt3ejY3ZDdTMHJlLzhldHRWcUM5?=
 =?utf-8?B?K3l0aVRrQTM2R2FsRDlvSi9EcCsvUmhmd3M2QTc3VUtIM2p3a3RGZ3FGd1B6?=
 =?utf-8?B?ajd2ZlVxSWtXNEZXYVM4bUp6emc2NnNMalZYVGZSTU5pbVBwQkhyNDBqdG02?=
 =?utf-8?B?V2RSZnFUeTZYbE9GVlNiOC8yZG5COHZSNDY3YlNTZjFadGptaU81TlcyS2wv?=
 =?utf-8?B?SlVQYTRZb2RUdVBVYkpYWTZWRENCbWVEMFZJTS9HV0cweldJK0lpWVBmSGNi?=
 =?utf-8?B?L20xSjBuaXBwTHQxY0NYcG9FOVZpZkFtT05VOGxlNzZrc2pXS2g4bmhPcXRh?=
 =?utf-8?B?dldtSytkUUF6dnhKTFFWRU8rRE01RlVxSlFDcW5BQm1QSlA3TlNGU2QyT3NC?=
 =?utf-8?B?RUtIREF6bWVuVjVoTUo4RDk3NnRRb0NvdERiaE5TVURONFFRaGszYiswTlFx?=
 =?utf-8?B?QmVrcDNlb0dJU3J3MVFCVVBGL05LeFUya0k4NTFxVXoxejA4VEN1bDBTVWdT?=
 =?utf-8?B?UEM5RnFoekpFUjlNZUdsQ1BYck5nTXpBRmxvVklmYUM3NUJ1MStVRXBXejEv?=
 =?utf-8?B?ZjFwVFJwNEE5S3Jsb0x0MHBUeUxIYUZvRExUR0NBRWtPQ3pnOVFGU2VFS0NG?=
 =?utf-8?B?UGc3SktueEZJMi9ocm5qYXhsdE1XSW53Y0srM3RsMFZ6NW4yRnRaeHF1ZHhD?=
 =?utf-8?B?UkNmS013QW8yWG1JcEpMSklLR2RXOVdXMFJVbjNzbUd1MzJIY21HeWMwbWJU?=
 =?utf-8?B?aHlSNHlwUk55OG5YeWxVTi92d0VtN1pQaHQydFlJbnU3cnJZWXQvRVN5YXNk?=
 =?utf-8?B?aWRDSDQyVllwNk5hcFI5ME40eTJFZ0VsUEhUcEFJblBCWGFmdTZ1b3VpUzdX?=
 =?utf-8?B?cXdGaGVSQzA3UUpya1pIVjJIMHdpMjMzVy9sa0NGSG4rdGFwQlZ2OE1oUEl5?=
 =?utf-8?B?MTFVbFpqWE52M2YzMnNseHFONm91S2E3RjhOZWxyQmVnTEhYRUNLRFNZV0Yr?=
 =?utf-8?B?QWR4Y2lwTU9jTFNOWXI5ZTBNTkhUSTZ1TXljUmM0ZzVIaFIyUGpGOFhMMFJ4?=
 =?utf-8?B?N3dhYTNVTG9RQ1ZsQlBIZ1ZBb1FlVHl4cS9XeEJMbjNqaVlOQjIrSmhRRmRG?=
 =?utf-8?B?WnR4MDBZSkthUkcxWkhPdHNZNTVOS3hnZFpReEJqNUx1UHVyS0J1WlZrYnkw?=
 =?utf-8?B?eXYrVWhkT3V4cS9JQU9UcnBFV2J5a1FsNE4rQk01dTZKcGpqYUNWSFdqM1hu?=
 =?utf-8?B?Zk90dGU0YWY3WGs2VXRoWHQxK2JZVjNrWjA5RzJEeGJlZStSWVRhQ3lkdjND?=
 =?utf-8?B?RWxSUXhBMXZnTHhCemc5Mit6TDZUZG1pZjhsUTUrU0ViUkdzemtCczQxZFZ6?=
 =?utf-8?B?UTc5a0NNMXB6VzFVQW5qTERXbXRlWHFUSlRuRDMzTTZuK2xVOTlwVXZyMHhh?=
 =?utf-8?B?OUlVWU5rb3FCajdKTVJHKzZJVmsrOXpENTNZTmpPSnB3c08wb01EeVlHTFI1?=
 =?utf-8?B?ZW8rMlk0MlhIZUlhWnBYb1hxbEtjRFR2ajNscEI1bnpJSUhKVU9BYnZYc213?=
 =?utf-8?B?TVVFeEp0T3VXVVdxUXRkRkwwd3VVTDJMNGl4bHdiUDZITE5CSmpJQSt2dEo0?=
 =?utf-8?B?Ujd5cnZGNWFNUTBmekI4MU1SVzh1Tlh4ZzVoK3BVc0VUazBCd1p1UG4zSHN4?=
 =?utf-8?Q?PT2Iy3fzAFL1/+0g=3D?=
X-Exchange-RoutingPolicyChecked: hYXW/pbBcC62jnjE3WruuigrdpDpw0yRx2lBqyBETLRMndZ8JItpuFzQDJ46tfOSKB+57A9NpNZoFyJletoCB+D6/yKCI6m4H56hjXz2nHLe2reBbkWOfSNWKdg1tt7AKZUmCQUkoGhaxiLaey9JzM1PwPxdWKtF9g8d94J2n0TJtOXdrRekUsFh0uy/CEwaPCcJzLMj5N362lkC5mjVsD3QZCevaUpEcFcbhGRknRoozA0ws6aWIKpKkgs0/LAvnjooj2mEKbBICjGkJtPqXCYrV1ygEaqbPItUIlClJRag+PhNr9ZgazY/NoBv71S6JR11gebVgr0j9A1aWoRGKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 946298d4-1863-46b8-377b-08df283aeb76
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 08:29:23.6474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCndj0QfPq9h+EBn9ZVrf56QreALZShizgUFDmMquHRmPu8mSIGMIb6C00JLeK0x7e+fBbI23XROHYhbmm+/gYjS5zjoW5zbiTx30nxO6eg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB013943
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

Satyanarayana K V P <satyanarayana.k.v.p@intel.com> wrote on pon [2026-paź-12 05:50:55 +0000]:
> The VF memory IRQ handler iterates over HW engines whose names are set.
> Engine teardown clears hwe->gt but leaves hwe->name set, so the handler
> can select an engine whose GT has already been invalidated. This can
> cause a NULL pointer dereference in xe_hw_engine_handle_irq().
> 
> Invalidate the engine name during teardown so subsequent engine scans
> skip it.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Fixes: 6eb2aad402cc ("drm/xe: Move hw_engine_fini to devm managed")
> ---
> V3 -> V4:
> - Fix issue with xe_execlist_port_destroy() with V3 version (Sashiko).
> 
> V2 -> V3:
> - Updated spin_lock_irq() to spin_lock_irqsave().
> 
> V1 -> V2:
> - Fix race with xe_memirq_handler() and hw_engine_fini() (Sashiko & Piotr).
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 17 ++++++++++++++---
>  drivers/gpu/drm/xe/xe_irq.c       |  3 +++
>  drivers/gpu/drm/xe/xe_memirq.c    |  3 +++
>  3 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 265f95c0c899..55ee0c892c1e 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -275,11 +275,22 @@ static const struct engine_info engine_infos[] = {
>  static void hw_engine_fini(void *arg)
>  {
>  	struct xe_hw_engine *hwe = arg;
> +	struct xe_gt *gt = hwe->gt;
> +
> +	if (gt) {
> +		struct xe_device *xe = gt_to_xe(gt);
> +		unsigned long flags;
>  
> -	if (hwe->exl_port)
> -		xe_execlist_port_destroy(hwe->exl_port);
> +		if (hwe->exl_port)
> +			xe_execlist_port_destroy(hwe->exl_port);
>  
> -	hwe->gt = NULL;
> +		spin_lock_irqsave(&xe->irq.lock, flags);
> +		hwe->name = NULL;
> +		hwe->gt = NULL;
> +		spin_unlock_irqrestore(&xe->irq.lock, flags);
> +	} else {
> +		hwe->name = NULL;
> +	}

NIT: I don't think the !gt branch can ever be taken. hwe->gt is set in
hw_engine_init_early(), long before hw_engine_init() registers
hw_engine_fini() via devm_add_action_or_reset(). Both the normal devm
release and the _or_reset error path therefore always see a valid
hwe->gt, and the original code relied on that as well
(xe_execlist_port_destroy() dereferences port->hwe->gt unconditionally).

>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 9e49e2241da4..b394c8edf89c 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -908,6 +908,7 @@ static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
>  	struct xe_hw_engine *hwe;
>  	enum xe_hw_engine_id id;
>  	struct xe_tile *tile;
> +	unsigned long flags;
>  	struct xe_gt *gt;
>  
>  	if (!atomic_read(&xe->irq.enabled))
> @@ -922,8 +923,10 @@ static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
>  			if (gt->tile != tile)
>  				continue;
>  
> +			spin_lock_irqsave(&xe->irq.lock, flags);
>  			for_each_hw_engine(hwe, gt, id)
>  				xe_memirq_hwe_handler(memirq, hwe);
> +			spin_unlock_irqrestore(&xe->irq.lock, flags);
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 9dfe965cb46e..1073132f2ded 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -555,6 +555,7 @@ void xe_memirq_handler(struct xe_memirq *memirq)
>  	struct xe_hw_engine *hwe;
>  	enum xe_hw_engine_id id;
>  	struct iosys_map map;
> +	unsigned long flags;
>  	unsigned int gtid;
>  	struct xe_gt *gt;
>  
> @@ -568,8 +569,10 @@ void xe_memirq_handler(struct xe_memirq *memirq)
>  		if (gt->tile != tile)
>  			continue;
>  
> +		spin_lock_irqsave(&xe->irq.lock, flags);
>  		for_each_hw_engine(hwe, gt, id)
>  			xe_memirq_hwe_handler(memirq, hwe);
> +		spin_unlock_irqrestore(&xe->irq.lock, flags);
>  	}
>  
>  	/* GuC and media GuC (if present) must be checked separately */
> -- 
> 2.43.0
> 

LGTM, one NIT above:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

-- 

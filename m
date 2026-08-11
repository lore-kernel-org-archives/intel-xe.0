Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCEDC5CFCF
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 10:12:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F298410E2EF;
	Tue, 11 Aug 2026 10:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gchv/a0+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC3110E2EF
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 10:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786443142; x=1817979142;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NBEFKORqxPFhf1GpPwJ5wRCqTqtMtblVyqndmtS5D/Q=;
 b=Gchv/a0+Ohkht2MrEGy7uNKS75zGLTA3fPrty4QRKneECRBoUiJiTPgN
 SsRWp1q1Y+LxGmwKEY2evoqKaoX2cI2EVODOEecpc93y4vaSoXtewVtMD
 USU/JU/lVqv5L+JpfaOw4SHobizCEHkrk38wqNF7gYM2AOHco3nnUJhvx
 vOGMk6yDP88MDPft0q15/v8+aR7xTfJgKhXoS9uo72UOZUtxRTXpqr6Lz
 rnddAsLXrDYNlpj94rfhdi06plY58QZBfvbRC3A7ir1cKMmtJ49vh5a0j
 2+v3La7Rg4IjTaE+e2M9FCnjSm+ER3GPM5ggY4SB0BXD6/5MBDtI+LI+A Q==;
X-CSE-ConnectionGUID: TPLp1q1aTGGhSaNwYYd7yg==
X-CSE-MsgGUID: 6NEFwrstT9apucVcG9BQAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="90784177"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="90784177"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 03:12:21 -0700
X-CSE-ConnectionGUID: n99ToT+0SKSAwU0RYRl7rA==
X-CSE-MsgGUID: GgwfkM08RQ+gYqHPZzmWXw==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 03:12:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 03:12:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 03:12:20 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 03:12:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOEqcotV9Ou4FPvPZiinift3RTNXCWw6OkC8Oz2LwA4UxnQZw0L5oRhxg6iU55mJOIrcrtePt+iIXxiSeZtxSzk1J9gdT0AggcDar6xoq3cRTbgFgeZZfs3Z70c17L3i/uTgvgpRnpmFSW6C00uhqwu0GdrREGS0RhCae114PnIAeka/ncFen5rTwYBrt7GUDCqOZdapsLNsKa9mUikW4zoeHdgLrcmTWVZxp7HAydNFlCNpD7WXWcxHWe2FmLBjy38/6Wmhrv5X8idcSLhVe8n5qsEqRO6RUFcF7fTo9lK8GhcQg076EEfNnlmCtZ3Hza4KymAym6SNW+UpDytRVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q24F3RvLVyNPIQ8+kDbbmQ+x9QEjNrEeYX5em2AR4Eo=;
 b=JdlZ74NN0P5N1UaJQXFOzoKqTOzYQZe/JBmFXNLq7d6drg6fFjBwbtXeEjnoBKt7swdmB6L6lMfugNaNFkLGpeISup2xTcUiHNRWE8E88M/tFbL9PZMpJsGKiaxPmfbVb2R/e09OzspLnozh3wi1XxajIabiYN/zThiFyOwRfX5VkbB00aNW1e3iz0piqjQMbRGYdPq/hrYosDnThg5rEqjUeGUOmocKN/uvSLOMxpMpQ1o2eTK8nU6CGVzrOPqS9St8X/cYkYrXdE9Bw7Oxr2VAinPDhQKfebTluvL9WhgR6WLU7sSMpmsXeGtfxLnFXacBCuTvmawzgJzaZodo6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 10:12:13 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::38ad:3190:bbb2:412b]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::38ad:3190:bbb2:412b%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 10:12:12 +0000
Message-ID: <3a8121d0-3420-4142-9832-1b8dddba2748@intel.com>
Date: Tue, 11 Aug 2026 12:12:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] drm/xe/tests: Add KUnit tests for VF provisioning
 error handling
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
 <20260810101428.1009573-14-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260810101428.1009573-14-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::27) To LV2PR11MB6024.namprd11.prod.outlook.com
 (2603:10b6:408:17a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB6024:EE_|SA3PR11MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ab9cd63-7e9b-4085-f87f-08def79102e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: uKSh7n8LeTGWeH4SV37xBSZpH4KNvcjq5K0jGfOTGKX/UBf0fS65J+NqhSPTH3uVighHSO3zwKtzGgq87twps1+bna0Y9ZAujsnLAEwe6asH2PjOTMHphJR3HgvQPh3vbdjOggDws7B2vku7RnQ9pmzV1Aj/EzJ+kNBd4WQOi0GsVcS83sDPfVTM8vuSFOR06Ot59wpxBfnC2npkLinj4gpaVcTrJBnmhc5lK/YBv/C8Pxxd0ZNZB0p3d1hHPLOlykdomPFGwRWi9koVeYPaK8RWUefvVJnvEO7RDhRdkDBupCp/47BiHxNLBMftCBq/werk8bpD9lsOxkPcx1qUmmjqjgcDC54C9KNi7q6eOUJRUom47oWFOOxIsPzHwlAw3kz8f0UbQmBHCSNXfbB+lZbCUE/SK/aLgknPP7GKlMYczpFeRbhiboDB6SW8zRt+oP1N0d0+DF0hXW8zauAf0lwNEJP92fp4d+BvGHpciNts7tscGaHyQVh3doKj3X0ce0lZ78lCxkdFgnd+phJLyohM+4O43c1rlXwucs0y/11Bng9U7G5b6n5Q/Nwemxg06griFjDTQ5l/yf9dty4b2aidMhhPZFQcVl8Qkd6GKWPOGcQd5Paz0Mjkaaw6ltolOuhkHM0hXt4ZC52we7yv8Sq2nsGKifWTDnfhpjfEBVI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2c3blNCZ3BzQlI0cWUvVUVKTkVKK2c3dkVwTVVBb3dUaXc3VW5DaTFYQngx?=
 =?utf-8?B?VGtHRTNyOXp0TU5hSEZMN1BEZ3RMQU1FcVlrU2xrUDFjb3dGdUQzL1ZadzRX?=
 =?utf-8?B?K0tGelRtNDRJd2tTQjQrVUIzU3lwTGRSZEZYZVNTMWJDcjFIbDlvdklacVRQ?=
 =?utf-8?B?c0c3ZklEaWp1RXJCZjlsQ0VzMDZOS3dISlZZZkxVVkJ0enBic2oxamxzbVZw?=
 =?utf-8?B?UzlxVW94U1NJNlM4dkE0MFkyNXdwakJrSU1tVnJUOXA5Q0ZVb2IzK0RyM05V?=
 =?utf-8?B?Ky9MemlabGtxS0dKb2NtREhNblpWa3BzYVVqTjZLWjlNZUIxRW9sUHFjZkpn?=
 =?utf-8?B?ZWRFaWQ2TFpGS2RPb2thYzFhV3pkSmV2VDlESWlrWm80TDUya3Z1cWpyWU1m?=
 =?utf-8?B?NU1CUHlEdkhwcm1kV2F0YVNwVTFGUkhPTjY4UHpDVVl3SWRoRzQvNmhqOHVp?=
 =?utf-8?B?YlpNa1ltemduMUV0cG1FT0FpcE5RTkN0Zk5PMnh1UVVOSWd0MW95U1ZPOTlh?=
 =?utf-8?B?dU5MMzVRSlYwQWNRU2FlSFdYODVqeVlDNTBzNmZyV3RHTWUzcnJDL3E2OHVV?=
 =?utf-8?B?V1ptWk01eW4vSjBYVk9rVlZ1aWlKVEZZY21EQWFKVCtzNzRrdkJqazc1bGpO?=
 =?utf-8?B?SWJoS1lKdnlpSHplcVdLdFZEM1pnUGVMbjBzVzFDMThDUElZRUtPeGRWcUk1?=
 =?utf-8?B?THJ0ZTljRTl1U0I1ekd0WjVxNVd0NzdvQVBsWFhqZHRsTFZqOGZudUg3SzB5?=
 =?utf-8?B?M0tpU2JhcGFsdFZYNVRVUi9seHZtdkVQYkNhak1vYUd3c045Mks4N3NSVmhY?=
 =?utf-8?B?OHFjQ0pnS1J5Mkk3Z21CVnllYU5Ic0hXaytNT1VDa1g2TkRuZVU0SUhIYUJI?=
 =?utf-8?B?UjU5Njc0OHpCbDdLTXV2bTBwcW9sVDdDeHExV3hBNXN1Q1ZSZlR3YlhIMmtx?=
 =?utf-8?B?Y1NxbFF1aVZGTCsxMERqbEFMWGw1QjNxQTFxUFo2VmlCa25HQjVxcDNpVERu?=
 =?utf-8?B?Z1BVR1JyNTRxSVRRV2NKUUd1V2U3azArKzhHWEp2QnowcVFsb2JRcVA5RXl2?=
 =?utf-8?B?b3ZQcTZoR2ttVEtwZ2VLckZoMkdjSUJNTXVnODZKTTVZNmtIQTg3Yjl1V1Qv?=
 =?utf-8?B?c0lvVkx1NERucDJVVE5CUmZsam1IeVRDMkZRTEVUTGwzbW94Y3k0T0N2ZFNu?=
 =?utf-8?B?Z253RS9IeVcxenhoK08xWTd4eDVYSkR5OENVbEY5MnEydFlYbFdBN29zZzRq?=
 =?utf-8?B?dkNnN2ttYitrMHQ4WGZGZmV0WTlhOHlXaDdZaEl6Q1FrRzlyaE9palVzdEMz?=
 =?utf-8?B?aGUxd0ZyZUZhMTEvQ1ZpalRCM0pJN1h6RnlxUHN2RHUrVmlhRndhRFFFRXo4?=
 =?utf-8?B?N1o3L1A1ank1d0xnbTl3TUVhb3N2bngyR3dZbGtKVGZkTW1sbU9uakFrQkpn?=
 =?utf-8?B?M2tyTXF1VytzTTdnNzdDZCtYQnFsalpJNWVJVEZyMXBwcWZPdDljSkM1RVNp?=
 =?utf-8?B?S2NJQm04MFVGVk5iSGVUaGFpQU91RkxUaHVGd09HNnpyQUhyNlpMdVBOUFBl?=
 =?utf-8?B?WHVkSnBDcnhUb2VERkVoOWE5WC82UlpVMmxOV1RBbDlXTFpvUjVkSGsycVFQ?=
 =?utf-8?B?Y3BraXAyRnFISWkvRVFhU2RJUEVyWU03cmw5WWlpZGwzY2VwMmRRaU9iZG56?=
 =?utf-8?B?TU9VZmFYTHF2V0xhZWlLQ2Irc1VvYXhSaWRvdjBxNXc3bnZIYVUwbm5qdTBl?=
 =?utf-8?B?OW96VGh5TTVaYStkTUd3TWc5RDBUNzFGWmx3ZFlESjgwVmdtTXg3QWErRnlR?=
 =?utf-8?B?V05EQUxFQitGdnRBS2N3bzN1ZVlWa3Bhb29RRXlLaFVVWk9HZFdKV0hYZ1Fz?=
 =?utf-8?B?dDA3U3JwbnlndzdDY0pkN3pPaFdCTGhDaDJQTVJFZERla1dWQWVmTktGS21z?=
 =?utf-8?B?L3FDcDZjdEJaWDVDNFZvUk5DeDZhY1NuTFV5dExhb3p1TGdTVlRpN29nT0lJ?=
 =?utf-8?B?eldyMTdHQmg2TmZBeUhTeHBWS0RMbnR5Sm9sRGo2WDRCMFlCcXdHa1lYTytN?=
 =?utf-8?B?c2l4cS9YRHB3OUFPb1N3OVZaTnYxcnUzUS8rVUp3RzRoOWJwZ3RFRzZNcE5a?=
 =?utf-8?B?alg1KzQ1UkVIR2pXeVBuVjRCYVR4Y0ZJY1krZ0NwOUtYUytLKytGQTVWNmRl?=
 =?utf-8?B?djgwN2lWM1crMmFLeGFuNlZCSGhWNzMzdENRVFdCUGpCWGtqbitKLzQvazBK?=
 =?utf-8?B?dUZCTTN5TnN3SVRKOVYzd3dranRnbXdKYkE2bUNQeHlZU0ZpdTVBS0hZUldz?=
 =?utf-8?B?ckRXdHdIRlFjYzBaaGMySVZ3d0FZeE9WOHJPTXRKMkZ4ZFBCbWdJM1lmak5W?=
 =?utf-8?Q?XNXil86siKaMlSLY=3D?=
X-Exchange-RoutingPolicyChecked: UFmZel5BGblbZK7fPNO1eeC970gkP6W7r8qDVAumeTWjBI0Nxnr+yrXzzTBDLzNgg/Iu3baQAHkxO+PRErBfOYzQ+LiYIcKo/Y+7OYYGfzb/RfM4nVXn3CZx6PuDLF7ZkhPp7b7iBxlmZjM5AthGQoucVgF61/NJgIBXA9RVdqCkW4OtXdpYYGUmteEayxc2zFee1LxeR1XAPAnqKZx9xmt0tiIrkHY+K/VSc5/4roZnraEjObpDxjEWue1++l0YOzg6kps3eka6uok+9m4ceMhjuGLt2HDJbGMnUEfeC22KJ9K3yIsq309euttD4vj/rellJJqc79XCHntUFQGSaw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab9cd63-7e9b-4085-f87f-08def79102e1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 10:12:12.7804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: al394Cz8EVKdoHbK9n6pyQLerk/n2aFUjDUVm6poEL3tHhVaQVUemYNa0IhQNsgOJydmyj+wM1T24Ec2wicGt0cDafgY7+oQSnAoArR98xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7554
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



On 8/10/2026 12:14 PM, Satyanarayana K V P wrote:
> VF relies on the PF to provide a valid hardware configuration via GuC
> KLV responses. In unlikely event of PF malfunction or misconfiguration,
> a VF may receive incomplete, zero, or out-of-range values for its
> submission contexts, doorbells, VRAM or GGTT assignment.
> 
> Add KUnit test cases that use the xe_guc_mmio_send_recv() stub to inject
> bad KLV responses and verify that VF can survive without crashing for
> the invalid configuration data received.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> V4 -> V5:
> - Added alignment tests for vram, GGTT base and size (Michal W).
> - Separated stubs for ctx, db, vram and GGTT (Michal W).
> - Added new test cases for xe_guc_mmio_send_recv() (Michal W).
> 
> V3 -> V4:
> - Changed stub function from guc_action_query_single_klv32() and
> guc_action_query_single_klv64() to xe_guc_mmio_send_recv() (Michal W).
> - Fixed review comments (Michal W).
> 
> V2 -> V3:
> - Renamed the test names. (Michal W).
> - Fixed review comments (Michal W).
> 
> V1 -> V2:
> - Renamed the test file (Michal W).
> - Fixed review comments (Michal W).
> ---
>  .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 322 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |   4 +
>  2 files changed, 326 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> new file mode 100644
> index 000000000000..9756c069fbc6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> @@ -0,0 +1,322 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <kunit/static_stub.h>
> +#include <kunit/test.h>
> +
> +#include "regs/xe_guc_regs.h"
> +#include "xe_device.h"
> +#include "xe_kunit_helpers.h"
> +#include "xe_pci_test.h"
> +#include "xe_guc.h"
> +
> +#define TEST_VRAM		SZ_8G
> +#define TEST_GGTT_SIZE		SZ_2G
> +#define TEST_CTXS		1024
> +#define TEST_DBS		128
> +#define TEST_GGTT_START	0xa0a0a000ull
> +
> +struct config {
> +	u32 orig;
> +	u32 query;
> +	int expected_ret;
> +	const char *name;
> +} vf_ctx_testcase[] = {
> +	{TEST_CTXS,	TEST_CTXS,		0,		"same",		},
> +	{0,		0,			-ENODATA,	"none",		},
> +	{0,		GUC_ID_MAX + 1,		-EPROTO,	"overflow",	},
> +	{TEST_CTXS,	0,			-EREMCHG,	"lost",		},
> +	{TEST_CTXS,	TEST_CTXS / 2,		-EREMCHG,	"reduced",	},
> +	{TEST_CTXS,	TEST_CTXS * 2,		-EREMCHG,	"increased",	},
> +}, vf_db_testcase[] = {
> +	{TEST_DBS,	TEST_DBS,		0,		"same",		},
> +	{0,		0,			0,		"none",		},
> +	{0,		GUC_NUM_DOORBELLS + 1,	-EPROTO,	"overflow",	},
> +	{TEST_DBS,	0,			-EREMCHG,	"lost",		},
> +	{TEST_DBS,	TEST_DBS / 2,		-EREMCHG,	"reduced",	},
> +	{TEST_DBS,	GUC_NUM_DOORBELLS - 1,	-EREMCHG,	"increased",	},
> +};
> +
> +struct config_vram {
> +	u64 orig;
> +	u64 query;
> +	int expected_ret;
> +	const char *name;
> +} vf_vram_testcase[] = {
> +	{TEST_VRAM,		TEST_VRAM,		0,		"same",		},
> +	{0,			0,			-ENODATA,	"none",		},
> +	{TEST_VRAM / 2,		TEST_VRAM + SZ_1G,	-EREMCHG,	"overflow",	},
> +	{TEST_VRAM / 2,		0,			-EREMCHG,	"lost",		},
> +	{TEST_VRAM / 2,		TEST_VRAM / 4,		-EREMCHG,	"reduced",	},
> +	{TEST_VRAM / 2,		TEST_VRAM,		-EREMCHG,	"increased",	},
> +	{TEST_VRAM - SZ_1M,	TEST_VRAM - SZ_1M,	-EREMCHG,	"unaligned",	},

bad error code for unaligned

> +};
> +
> +struct config_ggtt {
> +	u64 start_orig;
> +	u64 start_query;
> +	u64 size_orig;
> +	u64 size_query;
> +	int expected_ret;
> +	const char *name;
> +} vf_ggtt_testcase[] = {
> +	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
> +		TEST_GGTT_SIZE,		0,		"same",		},
> +	{0,			0,			0,
> +		0,			-ENODATA,	"none",		},
> +	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
> +		TEST_GGTT_SIZE + SZ_1G, -EREMCHG,	"overflow",	},
> +	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
> +		0,			-ENODATA,	"lost",		},
> +	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
> +		TEST_GGTT_SIZE - SZ_1M,	-EREMCHG,	"reduced",	},
> +	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE,
> +		TEST_GGTT_SIZE + SZ_1M,	-EREMCHG,	"increased",	},
> +	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE - SZ_2K,
> +		TEST_GGTT_SIZE - SZ_2K,	-EREMCHG,	"unaligned_size_4K",	},
> +	{TEST_GGTT_START,	TEST_GGTT_START,	TEST_GGTT_SIZE - SZ_8K,
> +		TEST_GGTT_SIZE - SZ_8K,	-EREMCHG,	"unaligned_size_64K",},
> +	{TEST_GGTT_START - SZ_2K,	TEST_GGTT_START - SZ_2K,	TEST_GGTT_SIZE,
> +		TEST_GGTT_SIZE,		-EREMCHG,	"unaligned_base_4k",	},
> +	{TEST_GGTT_START - SZ_8K,	TEST_GGTT_START - SZ_8K,	TEST_GGTT_SIZE,
> +		TEST_GGTT_SIZE,		-EREMCHG,	"unaligned_base_64k",	},

bad error codes for 'unaligned' cases

> +};
> +
> +struct config_mmio {
> +	int expected_ret;
> +	const char *name;
> +} guc_mmio_resp_testcase[] = {
> +	{0,		"same",		},
> +	{-ENODATA,	"none",		},
> +	{-EOVERFLOW,	"overflow",	},
> +	{-EREMCHG,	"lost",		},
> +	{-EOVERFLOW,	"invalid",	},

???

> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(ctx_testcase, vf_ctx_testcase, name);
> +KUNIT_ARRAY_PARAM_DESC(db_testcase, vf_db_testcase, name);
> +KUNIT_ARRAY_PARAM_DESC(vram_testcase, vf_vram_testcase, name);
> +KUNIT_ARRAY_PARAM_DESC(ggtt_testcase, vf_ggtt_testcase, name);
> +KUNIT_ARRAY_PARAM_DESC(guc_mmio_resp, guc_mmio_resp_testcase, name);
> +
> +static int xe_guc_mmio_send_recv_stub_ctx(struct xe_guc *guc, const u32 *request,
> +					  u32 len, u32  *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config *c = test->param_value;
> +
> +	if ((request[0] & 0xffff) != GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV)
> +		return -EINVAL;

are you sure that original xe_guc_mmio_send_recv() returns -EINVAL
for such case? it doesn't make any sense to write test code against
the stub that behaves differently than original function

maybe just add

	KUNIT_ASSERT_EQ(test, GUC_HXG_TYPE_REQUEST,
		FIELD_GET(GUC_HXG_MSG_0_TYPE, request[0]);
	KUNIT_ASSERT_EQ(test, GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV,
		FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]);

> +
> +	if (request[1] != GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY)
> +		return -EINVAL;
> +
> +	response_buf[0] = sizeof(u32) / sizeof(u32);
> +	response_buf[1] = c->query;
> +
> +	return 0;
> +}
> +
> +static int xe_guc_mmio_send_recv_stub_db(struct xe_guc *guc, const u32 *request,
> +					 u32 len, u32  *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config *c = test->param_value;
> +
> +	if ((request[0] & 0xffff) != GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV)
> +		return -EINVAL;
> +
> +	if (request[1] != GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY)
> +		return -EINVAL;
> +
> +	response_buf[0] = sizeof(u32) / sizeof(u32);
> +	response_buf[1] = c->query;
> +
> +	return 0;
> +}
> +
> +static int xe_guc_mmio_send_recv_stub_vram(struct xe_guc *guc, const u32 *request,
> +					   u32 len, u32  *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config_vram *c = test->param_value;
> +
> +	if ((request[0] & 0xffff) != GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV)
> +		return -EINVAL;
> +
> +	if (request[1] != GUC_KLV_VF_CFG_LMEM_SIZE_KEY)
> +		return -EINVAL;
> +
> +	response_buf[0] = sizeof(u64) / sizeof(u32);
> +	response_buf[1] = c->query & 0xffffffff;
> +	response_buf[2] = (c->query >> 32) & 0xffffffff;

use upper_32_bits / lower_32_bits 

> +
> +	return 0;
> +}
> +
> +static int xe_guc_mmio_send_recv_stub_ggtt(struct xe_guc *guc, const u32 *request,
> +					   u32 len, u32  *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config_ggtt *c = test->param_value;
> +
> +	if ((request[0] & 0xffff) != GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV)
> +		return -EINVAL;
> +
> +	if (request[1] != GUC_KLV_VF_CFG_GGTT_START_KEY &&
> +	    request[1] != GUC_KLV_VF_CFG_GGTT_SIZE_KEY)
> +		return -EINVAL;
> +
> +	if (request[1] == GUC_KLV_VF_CFG_GGTT_START_KEY) {
> +		response_buf[0] = sizeof(u64) / sizeof(u32);
> +		response_buf[1] = c->start_query & 0xffffffff;
> +		response_buf[2] = (c->start_query >> 32) & 0xffffffff;
> +	} else {
> +		response_buf[0] = sizeof(u64) / sizeof(u32);
> +		response_buf[1] = c->size_query & 0xffffffff;
> +		response_buf[2] = (c->size_query >> 32) & 0xffffffff;

ditto

> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_guc_mmio_send_recv_stub(struct xe_guc *guc, const u32 *request,
> +				      u32 len, u32  *response_buf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct config_mmio *c = test->param_value;
> +
> +	if ((request[0] & 0xffff) != GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV)
> +		return -EINVAL;
> +	/**
> +	 *  Let us take help of vf_get_ctxs_cfg() function to test responses
> +	 *  from Guc.
> +	 */
> +	if (request[1] != GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY)
> +		return -EINVAL;
> +
> +	if (!strcmp(c->name, "same")) {
> +		response_buf[0] = sizeof(u32) / sizeof(u32);
> +		response_buf[1] = TEST_CTXS;
> +	} else if (!strcmp(c->name, "none")) {
> +		response_buf[0] = 0;
> +		response_buf[1] = 0;
> +	} else if (!strcmp(c->name, "overflow")) {
> +		response_buf[0] = sizeof(u64) / sizeof(u32);
> +		response_buf[1] = TEST_CTXS;
> +	} else if (!strcmp(c->name, "lost")) {
> +		response_buf[0] = sizeof(u32) / sizeof(u32);
> +		response_buf[1] = 0;
> +	} else if (!strcmp(c->name, "invalid")) {
> +		response_buf[0] = 0xffff;
> +		response_buf[1] = 0xffff;
> +	}

something is wrong here

we shouldn't really generate new test code per test name
all these values should be already part of the "param" struct

and IIRC the goal was to add test cases to make sure that
VF code can deal also with communication errors (not just
malformed values in the response)

maybe the simplest way is to add to the "param" new field:

	int ret;

which would be 0 by default, and it would be used by all stubs:

int xe_guc_mmio_send_recv_stub_vram(...)
{
	if (param->ret)
		return param->ret;
	...
	return 0;
}

and in the test case definition:

	{ .ret = -EIO, .expected_ret = -EIO, ... }

> +
> +	return 0;
> +}
> +
> +static void test_ctxs(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	const struct config *c = test->param_value;
> +
> +	gt->sriov.vf.self_config.num_ctxs = c->orig;
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub_ctx);
> +	KUNIT_EXPECT_EQ(test, vf_get_ctxs_cfg(gt), c->expected_ret);
> +}
> +
> +static void test_dbs(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	const struct config *c = test->param_value;
> +
> +	gt->sriov.vf.self_config.num_dbs = c->orig;
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub_db);
> +	KUNIT_EXPECT_EQ(test, vf_get_dbs_cfg(gt), c->expected_ret);
> +}
> +
> +static void test_vram(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	const struct config_vram *c = test->param_value;
> +
> +	gt->tile->sriov.vf.self_config.lmem_size = c->orig;
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub_vram);
> +	KUNIT_EXPECT_EQ(test, vf_get_lmem_info(gt), c->expected_ret);
> +}
> +
> +static void test_ggtt_size(struct kunit *test)
> +{
> +	const struct config_ggtt *c = test->param_value;
> +	struct xe_gt *gt = test->priv;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	gt->tile->sriov.vf.self_config.ggtt_base = c->start_orig;
> +	gt->tile->sriov.vf.self_config.ggtt_size = c->size_orig;
> +
> +	if (!strcmp(c->name, "unaligned_size_64K") ||
> +	    !strcmp(c->name, "unaligned_base_64k"))

using param name as condition is fragile, maybe just add .flag to the config? 

> +		xe->info.vram_flags = XE_VRAM_FLAGS_NEED64K;
> +
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub_ggtt);
> +	KUNIT_EXPECT_EQ(test, vf_get_ggtt_info(gt), c->expected_ret);
> +}
> +
> +static void test_guc_mmio(struct kunit *test)
> +{
> +	const struct config_mmio *c = test->param_value;
> +	struct xe_gt *gt = test->priv;
> +
> +	gt->sriov.vf.self_config.num_ctxs = TEST_CTXS;
> +	kunit_activate_static_stub(test, xe_guc_mmio_send_recv,
> +				   xe_guc_mmio_send_recv_stub);
> +	KUNIT_EXPECT_EQ(test, vf_get_ctxs_cfg(gt), c->expected_ret);
> +}
> +
> +static int vf_gt_config_test_init(struct kunit *test)
> +{
> +	struct xe_pci_fake_data fake = {
> +		.sriov_mode = XE_SRIOV_MODE_VF,
> +		.platform = XE_BATTLEMAGE, /* any random DGFX platform with SR-IOV */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +		.graphics_verx100 = 2001,
> +	};
> +	struct xe_device *xe;
> +	struct xe_gt *gt;
> +
> +	test->priv = &fake;
> +	xe_kunit_helper_xe_device_test_init(test);
> +
> +	xe = test->priv;
> +	KUNIT_ASSERT_TRUE(test, IS_SRIOV_VF(xe));
> +	KUNIT_ASSERT_TRUE(test, IS_DGFX(xe));
> +
> +	gt = xe_root_mmio_gt(xe);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
> +	test->priv = gt;
> +
> +	return 0;
> +}
> +
> +static struct kunit_case vf_gt_config_test_cases[] = {
> +	KUNIT_CASE_PARAM(test_ctxs, ctx_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_dbs, db_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_vram, vram_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_ggtt_size, ggtt_testcase_gen_params),
> +	KUNIT_CASE_PARAM(test_guc_mmio, guc_mmio_resp_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite vf_gt_config_suite = {
> +	.name = "vf_gt_config",
> +	.test_cases = vf_gt_config_test_cases,
> +	.init = vf_gt_config_test_init,
> +};
> +
> +kunit_test_suite(vf_gt_config_suite);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 6c1878e4b1b2..05a6ad3348be 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1685,3 +1685,7 @@ int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>  
>  	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);
>  }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_gt_sriov_vf_kunit.c"
> +#endif


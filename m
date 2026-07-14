Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B22C44508
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 15:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE1B10EDCF;
	Tue, 14 Jul 2026 15:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IvxdFhBM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947AB10EDCE
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 15:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784043120; x=1815579120;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4WSrlnZjCM5qi3lYWGoM/L2YosHGGcpFAitoDqrWp8Y=;
 b=IvxdFhBM43/woWCIcv/IfZdETra4j+taE7OJgABva2pB5cwyM5w8iEO4
 cPzqQSxc589ofWiVzx3nqFQjCjle80DlaSC9MIx6PjnyLVuqg3NmNRffF
 /pqA1xpsre2/Z3tkZxsZ/KxFxng9jYcRyRtPZL/jPtm5SEq2qgFoY9TE7
 QQHSxGu19WS/N5M4uPykYXvIcfsStjqe1Ed36MIrl+mfTC331mQvlhbDl
 1WxNHRLpaFEIEok029AqWJwzyvBTOoYtzgniSNMf3y4Vy5FArMvKDpimi
 xxZ/ehG+LMj0jYq+LWwwrmACpobcs31LcxwpmJOKCxKI8Q3b8MlMQRhlh w==;
X-CSE-ConnectionGUID: 2ulHCdMTSl6FxpPK/sF4/w==
X-CSE-MsgGUID: psaRLtkmSgeMrAM5VI7jrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="95313636"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="95313636"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 08:31:59 -0700
X-CSE-ConnectionGUID: TWYFqQ3wTj+Zy+IS5QYBSQ==
X-CSE-MsgGUID: dVYciwQfSdW132AsiTR2BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="260196294"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 08:31:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 08:31:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 08:31:58 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 08:31:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LuihRKHo2/xO1s3kt7iAuJIZ4gOmJ1GRAcRez0dm9xcUnifk4XOXnN4tgJmlMwXqTSJGiel22FrveYjEgkyeyBuFIDWpwBIEU80ANJOq1t9jWWZd6KJ89zqcv6fnP5Q9WaaxCd1WwO7gOvgVMLPkwNbCoY23/mlQhutKysplvj5eBEqiz6xaPmnJEsKSp45v61+Ide9R4JqcwD1lb4isQ/+I27aI8o8ieau9LmfTIDn2nqwyYtnm6lWw5sCsgaS+BOziXA9NqQtIU2WfCuiDp2I3+7u/mh5YNAxZekSSLpQ1f6t5ESRbJ7H0w6o5bMXtMsRdgO4iJ+fNtrzJFr4Urw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzQzMZtgKh68M0szo9VdVlFAf2WNyP4vwSS9rQeCxYw=;
 b=VLsHzytOZh3HwCqtL/74ygue3UKDQNPrBsZ1oUmxow2egg5x6IUwa9koHgwGkG9C+bJmfZUMWv45DkaDkuWHxIg2MNuk0NQkZVvAOWqDLh8xYnCr9t31Sad0T5Uy8gcRb7uLHn9/rUJCEow7Cg3gFixsihKMkwi+f2Zr8Y90MnzwtBVBHUSWrxD8R/zdyw7ATufGnSsKUaAnd6YvlYpLPKCXlIyRgHqdaPmP44fS+M388WT/MBwxHnOyYpceOuCfRqHauKTaODG5HlVsDm/ifla0GAuN93O4o8CLZ5T/AlRUjCU2ZS1I9TmxMqWO7LoWue/yrEgoGKIW+cTzBPgigg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by MN2PR11MB4613.namprd11.prod.outlook.com (2603:10b6:208:26d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 15:31:56 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 15:31:55 +0000
Date: Tue, 14 Jul 2026 11:31:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH V12 06/11] drm/xe/cri: Add debugfs to inject faulty vram
 address
Message-ID: <alZWZ_ecMslJ8PaP@intel.com>
References: <20260714134900.1283308-13-tejas.upadhyay@intel.com>
 <20260714134900.1283308-19-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714134900.1283308-19-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0258.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::23) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|MN2PR11MB4613:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f91dbb6-def9-465f-648e-08dee1bd0885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|4143699003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: s/uw2QkYwitA1KfUGPXwaw0r+th19ablt3rIlRAskLDXDDoQmGz6PT3PKb2UiBqK1iDDy8oHgsG673K7KwDGZcy2MhDc/itqRqkZ213/LNSpBnekwMiplpv1b7W9O1CNCYFwRcg4p2R0CCiQpqwBbinrrP5gomlQXzg+Ez95W5Zzflnl1zLXhWAXFjBigNbOkPk7PJGkB5msO3OnKILBASB3JrdoVJaS2hyV3Jx3D5FtUkxTi0wW1/tFGz78Qj4Rb8BPwvVWzA6FeznyJ5vrrdFp6vV3mmKMiISM8sUFsV6KpBOyPvYdOyjHfFmj0zw+UI5RurAcIy7rBvg8zINugvMRcGDO6cFRSmzPCpizZvNVP1C7GqxEEnc1DGrXifrRsqLV+bYKO2ZBDFQ4qR+IqyiUk0tSrGdrVPvAPhSjVrdY5ENfG09p1egWdHco+x7I8C7L8Ld9ZNpnv7nje3OMpLT0A2QTDZRY4wzssdF3wnoWqSZqrFP4VmFi8RzeWY2XtgI1UtEVwdj511mtrxv5p+k7oxPdRSoYiXK35dRpDSQTCylNvJTTefS557Wlq+akw6h6H8NzhovvvBl7qJ+oQ58SZCoKfBEXVlzJNIzRp5hpYt5t1ebsblFhdYmDIhBd6K7vPNb3KrHPsVCbmk9y9KPi4KSrWrAn27gkibeRVHs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(4143699003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXpoNERpYXJXRHlPdGxlcHo3L2xNSEdJYTliZUpub3ZETHdqajhaU0hsWGVZ?=
 =?utf-8?B?ZjZiTW9QeklSYmppWnpkV3loTnYwajJRNlB2WFNGcE9SdGp3SHB1bmxjTDJL?=
 =?utf-8?B?clRIMjlYeHV1MEZ6S2ZvalUzQTFXN2pRc21lVFBqZ1o5Zy81UkFOaVlZZmk2?=
 =?utf-8?B?R1NGc1RZUDZZOTd3VzI1d3B0MmNycHUvK2FNS0ZWNU1va1ZTb0tKVXRqam80?=
 =?utf-8?B?b2c3V3V6SWpvQlZYRkNZSlNacTYwSUJ3U2dxYk5pSTg0K3k4dFVzWUNEZXBx?=
 =?utf-8?B?N0ZCQ3g3YUtDdjNOT1R0WXdHWU5DVEd5UEExem8rTEZTcTFEUEZZWUppaFpJ?=
 =?utf-8?B?cDJMQXVmY1NtQnBmMkdCeTA3VGJ6T0Y5UTJaVUIxWjBVc1pyNXUxVFpoZkp5?=
 =?utf-8?B?TnlYMFNSdWNJcmdFVUhodlpDOWlkZldSZlRNUHUyOTlkSEN1SzQ5bDlJV1Jl?=
 =?utf-8?B?dWxrUTQydzhwL0hJTFF6d29OcFJYb0hwNTEvMzYxanQvbHpHcG9XNFJ4Tmkz?=
 =?utf-8?B?YVBPL1plZVhnQlQ4T3kyaHlRQ201UzA2OTVrRmYrZmtvTCtiNkVXNEs5VkNC?=
 =?utf-8?B?UE9HdEtsQjV4dDFKVDV6ZnRTN0FqVWFPMDdtM3QvYi9XZVc3d3pYMUk3ZlJy?=
 =?utf-8?B?SjlFYTNkdGVhVzRFWlluNzdlNHJNUTRhWktzNk5rd095STN0TEQvLzViMFFo?=
 =?utf-8?B?NTRRZm4waVhxUUw0SmdSRUhNdUtLcy93SktiTEpreU02SDVtVUJCSm52RUdM?=
 =?utf-8?B?dVNJWTJBK3RXVk5HdHI4V2JvOEZPeHpLalZhOEQzMTZwV2ZxM2Qyc1gxTlFN?=
 =?utf-8?B?TytMMmVuTmlHalRTa09rWHdzWks0aUxrS1doMEVuTzdsVzVhcnpIRTEzWC90?=
 =?utf-8?B?aUZuQzlrMG85VWhGb1NJU0RSa1FRQjRHa1NoQk9BS0xoNUswc1ptVFZHeEZY?=
 =?utf-8?B?N0pQSVpnbGJrRW4ySnpHT2p2TUtnaG5XMWVOeUdlMzg1by9QZUpVRnNXK3NL?=
 =?utf-8?B?ZUFZODQvVVpXUWRGYzB6Mk5IK01PelBTNG54dFZ1aHBaYUFwRFZxU0xpWXdD?=
 =?utf-8?B?Ry9MZmRQVVdDclJGRFhIWWZvY2lGTTZCeE5YOVFLRG5yOWpqZUhnOGhJWmRr?=
 =?utf-8?B?cGVCaEo0dkVyTURrUDJiUHcraGJ2eDc5WFhwUHp6OWl2eTE2RG1vSUF6MUJ1?=
 =?utf-8?B?SmJVWnJFRU5MdzBzRG0yUnp2RHI2RUFqMEU2UFVmcHdqNFFNSnNyODNNWE5O?=
 =?utf-8?B?Y2psbURPOTlKVzk5QTRMK2d0Nm5JZTR6SFRFRTJNS2RSQmV1WWlPN2RGNlEw?=
 =?utf-8?B?OVBEM0tscENJeitYSTFoc21zNFZkTXNLMXl2UlFlVnNYclM5Tmx4MVhPb1dl?=
 =?utf-8?B?cG9yUjN4anI1dk93d3h6U1VZTDBtRkFKZWVsNEhrMzF5aWtJQUMyaGo2SUZx?=
 =?utf-8?B?ZGtpMnV6NTZjc1FNd1FWUjVUR3R1RzIzMU9ZTGUzMzlnZ09rbFZQZS8yWnZQ?=
 =?utf-8?B?QWZEaTYzcTAxenNvMDNBRlpyZEExQU5hVittMjhPMnRBTk83ejh1NDU1c0Nu?=
 =?utf-8?B?R3dyNXlYU0c1U0hQRUl5aDJEWldqVy9SV3hUMGlsTjA0TmM0L2RZbDJodklz?=
 =?utf-8?B?cS96TFR4bWNCZFRzeXpBRkIyNjA5NHBvdTJzcTJHT1pFc0pvTWVLQS9QbE83?=
 =?utf-8?B?ZTREUVdvVGtsNituOGpoK2crRlBiZ0hDdG8zeFJoemtXa1dtTGNYaXRwZTRB?=
 =?utf-8?B?Y0lPbXA0SEVWNisrOGhycXgyVHF1SElZVTJvMk4rSzFVQS82TzhoTUpHWTl0?=
 =?utf-8?B?YXlPaVNYbzQ3TDBjbk54RlNaL3RUa0dpQUZmVWFQUzZEak5OWWh2QlZVMkJ0?=
 =?utf-8?B?dlJPSUZlWnlmNVRiNG5hckpjTEdDZzFaRzhDOVRIZENtbFZrV2diZHlNcXYy?=
 =?utf-8?B?Uk5HbTlHRVlLMkVsajNNb2V4SkE4UXVEcUgrVDBSOGl5WHpnTjlCcU93NU5z?=
 =?utf-8?B?ODlVVWhJaFVERkYxV1RwbHc0ck4rbllocThaWEgxYmQ0L0pONFEvOFNycU10?=
 =?utf-8?B?RzFRYlZIYlpVTXU1QzQ0NldycnhOL0Q5SkpEQmZoYVBSUlA3U2ltZkV0MXpq?=
 =?utf-8?B?WUJHYjB1Tjl6Wk5TQ0M2bUxvZXhDY05PU0hYM2I1QitybXhxUmVOdjNKNWpG?=
 =?utf-8?B?RjUxUlBDWjF3YXYyVkIwekpFWXBDL3FGQnR0bTlOWGhvMUlSY21vSWNNQ05R?=
 =?utf-8?B?bTZZczZJM3lhazVuMVRVN3NYWkEzWGM1Mi8ydXI4amkwV0ZCbjVxMjB3VHF3?=
 =?utf-8?B?aHFzb0ZVZUdMUUFKeWVJWWpqSzlySE9rVmFVYVJFVHVsWWxVZGovUT09?=
X-Exchange-RoutingPolicyChecked: RviGvzPe31Uf6X2S2sioq9tHbMYF/O8Le/8SW1aTvjv5wS4Vw2wVa1cMe6ESUZCU/1zbgDflnbYeNcCpQwm87MGzq+YbmOm59nbXTAxKWWzso3XwJvVcEU8zLqnJMt0QuvhdlI5sAraDp3gQrqh7TtvLUsE2vGePZ4+vLNsH6U2RiQhJ/TyXKJJH9jIT/4LUbwnR5PD2i6Vel09KFR+WixnFQS/SV1vxSlIw2r7IPjRuOTbToQG/Sqgi1ZUNnTLSNTV1pObw6QnaDRL2S6XEW/QS6XiLnPXl7sH0c/4fmDADf5/4/g0LmR3B8UkSnm9Lx+rrdbMtOa3xYmsm8q7BTA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f91dbb6-def9-465f-648e-08dee1bd0885
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 15:31:55.0744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1ika+5/AGvcobvzVLWXSiVO9ariHcxXUIP1dR6TVJRGmX98buTanqFDMe4pr/w5eSXt6Y/9hmT+QKYVtMe1JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4613
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

On Tue, Jul 14, 2026 at 07:19:05PM +0530, Tejas Upadhyay wrote:
> Add debugfs which can help testing feature with manual error injection.
> Adding a debugfs interface to the drm/xe driver allows manual injection
> of faulty VRAM addresses, facilitating the testing of the CRI memory
> page offline feature before it is fully functional. The implementation
> involves creating a debugfs entry, likely under
> /sys/kernel/debug/dri/bdf/invalid_addr_vram0,
> to accept specific faulty addresses for validation.
> 
> For example,
> echo 0 > /sys/kernel/debug/dri/bdf/invalid_addr_vram0

Why are we creating a new standalone debugfs instead of using
standard fault-inject?

> where 0 is below address types to be tested,
> enum mempage_offline_mode {
>         MEMPAGE_OFFLINE_UNALLOCATED = 0,
>         MEMPAGE_OFFLINE_USER_ALLOCATED = 1,
>         MEMPAGE_OFFLINE_KERNEL_USER_GGTT_ALLOCATED = 2,
>         MEMPAGE_OFFLINE_KERNEL_USER_PPGTT_ALLOCATED = 3,
>         MEMPAGE_OFFLINE_KERNEL_CRITICAL_ALLOCATED = 4,
>         MEMPAGE_OFFLINE_RESERVED = 5
> };
> 
> v6(Sashiko):
> - Fix off-by-one in address loop boundary (<= vs <)
> - Use relative offset for buddy lookup, convert to DPA for
>   handle_addr_fault
> - Fix continue inside scoped_guard targeting wrong loop; use break
>   instead
> - Use READ_ONCE for bo->q access without resv lock
> - Wrap case MEMPAGE_OFFLINE_RESERVED in braces for variable
>   declaration
> - Add NULL check for xe_ttm_stolen_gpu_offset
> v5:
> - Remove redundant code
> v4:
> - Use scope_guard around lock, adapt bo->q and enhance warn messages
> - %s/gpu_buddy_addr_to_block/gpu_buddy_allocated_addr_to_block
> v3:
> - Add more specific noncritical bo tests
> v2:
> - Add mode based automated test vs manual address feed
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c            | 169 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |   2 +
>  2 files changed, 171 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 8c391c7b017a..6a21511d3521 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -14,6 +14,7 @@
>  #include "regs/xe_pmt.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_exec_queue_types.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_gt_debugfs.h"
> @@ -21,6 +22,7 @@
>  #include "xe_guc_ads.h"
>  #include "xe_hw_engine.h"
>  #include "xe_mmio.h"
> +#include "xe_migrate.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
>  #include "xe_psmi.h"
> @@ -30,6 +32,8 @@
>  #include "xe_sriov_vf.h"
>  #include "xe_step.h"
>  #include "xe_tile_debugfs.h"
> +#include "xe_ttm_stolen_mgr.h"
> +#include "xe_ttm_vram_mgr.h"
>  #include "xe_vsec.h"
>  #include "xe_wa.h"
>  
> @@ -41,6 +45,14 @@
>  
>  DECLARE_FAULT_ATTR(gt_reset_failure);
>  DECLARE_FAULT_ATTR(inject_csc_hw_error);
> +enum mempage_offline_mode {
> +	MEMPAGE_OFFLINE_UNALLOCATED = 0,
> +	MEMPAGE_OFFLINE_USER_ALLOCATED = 1,
> +	MEMPAGE_OFFLINE_KERNEL_USER_GGTT_ALLOCATED = 2,
> +	MEMPAGE_OFFLINE_KERNEL_USER_PPGTT_ALLOCATED = 3,
> +	MEMPAGE_OFFLINE_KERNEL_CRITICAL_ALLOCATED = 4,
> +	MEMPAGE_OFFLINE_RESERVED = 5,
> +};
>  
>  static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
>  				   u32 offset, const char *name, struct drm_printer *p)
> @@ -564,6 +576,152 @@ static const struct file_operations disable_late_binding_fops = {
>  	.write = disable_late_binding_set,
>  };
>  
> +static ssize_t addr_fault_reporting_show(struct file *f, char __user *ubuf,
> +					 size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	char buf[32];
> +	int len;
> +
> +	len = scnprintf(buf, sizeof(buf), "%lld\n", xe->mem.vram->ttm.offline_mode);
> +
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static int mempage_exec_offline(struct xe_device *xe, u64 mode)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_vram_region *vr = tile->mem.vram;
> +	struct ttm_buffer_object *tbo = NULL;
> +	struct xe_ttm_vram_mgr *vram_mgr;
> +	struct gpu_buddy_block *block;
> +	bool do_offline = false;
> +	struct gpu_buddy *mm;
> +	struct xe_bo *bo;
> +	u64 addr = 0x0;
> +	int ret = 0;
> +
> +	vram_mgr = &vr->ttm;
> +	mm = &vram_mgr->mm;
> +	while (addr < vr->actual_physical_size) {
> +		do_offline = false;
> +		scoped_guard(mutex, &vram_mgr->lock) {
> +			block = gpu_buddy_allocated_addr_to_block(mm, addr);
> +			if (!block && mode == MEMPAGE_OFFLINE_UNALLOCATED)
> +				do_offline = true;
> +			if (block && PTR_ERR(block) != -ENXIO) {
> +				if (!block->private)
> +					break;
> +				tbo = block->private;
> +				bo = ttm_to_xe_bo(tbo);
> +				if (bo->ttm.type == ttm_bo_type_device &&
> +				    bo->flags & XE_BO_FLAG_USER &&
> +				    bo->flags & XE_BO_FLAG_VRAM_MASK &&
> +				    mode == MEMPAGE_OFFLINE_USER_ALLOCATED) {
> +					do_offline = true;
> +				} else if (READ_ONCE(bo->q) &&
> +					   mode == MEMPAGE_OFFLINE_KERNEL_USER_GGTT_ALLOCATED) {
> +					/* lrc */
> +					struct xe_vm *migrate_vm;
> +
> +					migrate_vm = xe_migrate_get_vm(tile->migrate);
> +					if (migrate_vm != READ_ONCE(bo->q)->vm)
> +						do_offline = true;
> +					xe_vm_put(migrate_vm);
> +				} else if (bo->ttm.type == ttm_bo_type_kernel &&
> +					   bo->flags & XE_BO_FLAG_FORCE_USER_VRAM &&
> +					   bo->flags & XE_BO_FLAG_PAGETABLE &&
> +					   mode == MEMPAGE_OFFLINE_KERNEL_USER_PPGTT_ALLOCATED) {
> +					/* ppgtt */
> +					do_offline = true;
> +				} else if (bo->ttm.type == ttm_bo_type_kernel &&
> +					   !(bo->flags & XE_BO_FLAG_FORCE_USER_VRAM) &&
> +					   mode == MEMPAGE_OFFLINE_KERNEL_CRITICAL_ALLOCATED) {
> +					do_offline = true;
> +				}
> +			}
> +		}
> +		if (do_offline) {
> +			/* Report fault — convert relative to DPA */
> +			ret = xe_ttm_vram_handle_addr_fault(xe, addr + vr->dpa_base);
> +			if (ret) {
> +				if ((ret == -EIO) &&
> +				    mode == MEMPAGE_OFFLINE_KERNEL_USER_GGTT_ALLOCATED) {
> +					addr += SZ_4K;
> +					continue;
> +				}
> +				break;
> +			}
> +			/* Verify page is now reserved */
> +			scoped_guard(mutex, &vram_mgr->lock) {
> +				block = gpu_buddy_allocated_addr_to_block(mm, addr);
> +				if (!block || PTR_ERR(block) == -ENXIO || block->private)
> +					ret = -EBUSY;
> +			}
> +			break;
> +		}
> +		addr += SZ_4K;
> +	}
> +	if (!do_offline)
> +		drm_warn(&xe->drm, "no such object, ret:%d\n", ret);
> +
> +	return ret;
> +}
> +
> +static ssize_t addr_fault_reporting_set(struct file *f, const char __user *ubuf,
> +					size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	int ret = 0;
> +	u64 mode;
> +
> +	ret = kstrtou64_from_user(ubuf, size, 0, &mode);
> +	if (ret)
> +		return ret;
> +
> +	switch (mode) {
> +	case MEMPAGE_OFFLINE_UNALLOCATED:
> +	case MEMPAGE_OFFLINE_USER_ALLOCATED:
> +	case MEMPAGE_OFFLINE_KERNEL_USER_GGTT_ALLOCATED:
> +	case MEMPAGE_OFFLINE_KERNEL_USER_PPGTT_ALLOCATED:
> +	case MEMPAGE_OFFLINE_KERNEL_CRITICAL_ALLOCATED:
> +		ret = mempage_exec_offline(xe, mode);
> +		break;
> +	case MEMPAGE_OFFLINE_RESERVED: {
> +		u64 stolen_base;
> +
> +		stolen_base = xe_ttm_stolen_gpu_offset(xe);
> +		if (!stolen_base) {
> +			ret = -ENODEV;
> +			break;
> +		}
> +		ret = xe_ttm_vram_handle_addr_fault(xe, stolen_base);
> +		break;
> +	}
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	xe->mem.vram->ttm.offline_mode = mode;
> +	if (!ret || (ret == -EIO &&
> +		     (mode == MEMPAGE_OFFLINE_KERNEL_CRITICAL_ALLOCATED ||
> +		      mode == MEMPAGE_OFFLINE_RESERVED))) {
> +		drm_info(&xe->drm, "offline mode %llu passed ret:%d\n", mode, ret);
> +	} else {
> +		drm_warn(&xe->drm, "offline mode %llu failed, ret:%d\n", mode, ret);
> +		return ret;
> +	}
> +
> +	return size;
> +}
> +
> +static const struct file_operations addr_fault_reporting_fops = {
> +	.owner = THIS_MODULE,
> +	.read = addr_fault_reporting_show,
> +	.write = addr_fault_reporting_set,
> +};
> +
>  void xe_debugfs_register(struct xe_device *xe)
>  {
>  	struct ttm_device *bdev = &xe->ttm;
> @@ -632,6 +790,17 @@ void xe_debugfs_register(struct xe_device *xe)
>  	if (man)
>  		ttm_resource_manager_create_debugfs(man, root, "stolen_mm");
>  
> +	if (xe->info.platform == XE_CRESCENTISLAND) {
> +		man = ttm_manager_type(bdev, XE_PL_VRAM0);
> +		if (man) {
> +			char name[20];
> +
> +			snprintf(name, sizeof(name), "invalid_addr_vram%d", 0);
> +			debugfs_create_file(name, 0600, root, xe,
> +					    &addr_fault_reporting_fops);
> +		}
> +	}
> +
>  	for_each_tile(tile, xe, tile_id)
>  		xe_tile_debugfs_register(tile);
>  
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index 3ad7966798eb..07ed88b47e04 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -37,6 +37,8 @@ struct xe_ttm_vram_mgr {
>  	struct mutex lock;
>  	/** @mem_type: The TTM memory type */
>  	u32 mem_type;
> +	/** @offline_mode: debugfs hook for setting page offline mode */
> +	u64 offline_mode;
>  };
>  
>  /**
> -- 
> 2.52.0
> 

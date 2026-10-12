Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6940CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 08:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9877010EF50;
	Mon, 12 Oct 2026 08:40:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6FB10EF50
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 08:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791794416; x=1823330416;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YMi6Etaf/UgAFKm8TbukT0TmIBvTicKFuSglyj51Itc=;
 b=no+TQOqF0SSHLf4vfZOaU+KyqMATDMnFVCoWUms/p6+tDL21/EEirbMQ
 hnlqYwLjmeS09N02n3szYgJXVIT3D0HbEdfDjjlv4trSxeVXAMW8H4Hby
 fIyZUgqPv7C/kciQt4HAqF8gz/wfCt4aj/mwzN1YE/IrJVrDehZ7Q8KOH
 ocLBYkXa/PrpaApcj0CvwWRBHkSSD+XwypDMfEUnRjgwvo6coxxqwsqzn
 ikkikwAjERHb8LsbfOpQJEDJcE9UXDWKz30zIXvfzofVw396+NcAly6ZJ
 I0uPbfB2XQ6aci8JA4rtT44Rl2X4n+iZ2kz9Hgb/sl4ukA0lPW7gQdecZ w==;
X-CSE-ConnectionGUID: V/TuFrkFQ22Yo2Ct+i+uxQ==
X-CSE-MsgGUID: bRYApXJVShO9ilRNkcJYRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="395400"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="395400"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 01:40:16 -0700
X-CSE-ConnectionGUID: uUydZ61KTbqxIY5ic7Hs1w==
X-CSE-MsgGUID: hrlClMaoSje5QXZr9dvqPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="771329"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 01:40:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 01:40:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 01:40:15 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 01:40:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+XkdWKRlL2r1HCzmpdjY1ECzukcXBBpiQewwjC8rjTWjrioqZzMYwlLObSrgcexE6rlJuBb2E7S1IOGQJY9hYadlv9Glfz0RegtvRaEJuSB2Y1wD33abi9QxXWmrbone/gnfTLxmBghV3Jwpd4ktCHSt75ZtwcO7GsWJDFl8GX+JF7QSDsTEfgdA3Ive2NpXdwnqoLpIDhmboSTnIZWvS5+fG6gobUqCnRxeUrtDWObmOJZbukonN8Axg4TnQ8vVkgn8tgzI6y4jblsvOgTVkEqPpeKMuWUqfXPlfI/VGkN2F3Al3lQFpE6sX4DHOJkZINiNF5JYj8Jpz3w6Gz73Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDFulzbD1YbWQgI3a06EAmafMq+1/15aFbHhEMZTuQk=;
 b=DTsrXU+9tPFK1fCaQmrpwsKaThPSx0+68e3e9ZH0aEVFLrBgpSZAHnOTM296yIbNi1IO6x16AQySc/8ugh21X8A+nL2I6nihJZe61BZtzlDpPAjW8HL1WvhJy7zp+T570c+eWf8a7z8iqC2i691Zdfu51mZMRkOvp2/UlWLLmKGk3XnN0auEuY9tVmCNSHb56hl/OvBZzjwaiFQPxQ5IxvcogNH9C3Aw5JHAp0FUc97ueUQxXTWf9vmxcmWQgIJvGG3k7Wtlh7WiWyq6hBO8p4eYNPKXUjufF0ZZWC5MogjsZiB1v0WfjQGZQLve+lNK2TIBl6wDM5tMOe+Hkm8mFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by MW4PR11MB6837.namprd11.prod.outlook.com (2603:10b6:303:221::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 08:40:07 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0496.015; Mon, 12 Oct 2026
 08:40:07 +0000
Date: Mon, 12 Oct 2026 10:40:03 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH v5 3/3] drm/xe/gt: Disable GT reset worker before engine
 teardown
Message-ID: <20261012084003.a7q4wn3hodsf6csd@intel.com>
References: <20261012055053.964468-5-satyanarayana.k.v.p@intel.com>
 <20261012055053.964468-8-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261012055053.964468-8-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: WA1PEPF00005B95.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::632) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|MW4PR11MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: 29e2f7cc-a4d6-46e6-04ee-08df283c6b01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: P35j4y76DjjcD0or4HlyY0RqXW6PI0f2J7J61qYmFGtDB+JcQ9n8WtyOEur1AKG/qhiTb73d2IiFTcEpW8mGvGHzVMswYX7r4GCtC+J5pph3Ccfli2V6ylE1ARJfxpcroDYw+tPHbkzdtc/7YQ7vV8CFM4YDpRk4lES3fXHBUa0kZpaxatnBdy4gGSIG/29mILjnWkWXNonVi7OWeM8CMTlPaAS6d/zfHnkZP7wq9vKXkPuCqoQRqgxkZ9gqYZRL6TfCaIwmzSSNsjScgf/K/LtcsDPaMHvhqOxeIPfsKKHGzbsNVBgEAHHC+OkOXvWyxYSkclYWDGUVeTa0maxO3GR5OV89kmvGumNA1a5NTj70BwSrrNCR4LUfeayEPgwSWJXy7L4zLBYM8CCs/nYtEY7TFNSNwPPDfHByUAzUU4SjF0tlBF3/bZDt1r8B7Pv1ElmJONrszhVZ3tPFgmTDmAahwyNojyZ4SWOPtdY5hqiW3yFfNNSumLmFb715ThPDpo2piSVrvNsZ9PWnc1fBK4rTB/9v5g2QQF57tAKLk+Zn1CI8HWDcfdwUHIObuVhKkProf2dcsugoYDsykOZ/brS/k95TlYGRCVwhgFJzVkAuhpZCxIfDtwO0oXO11qgVEZby/vWstBGjvHLN/X28TsBEPRWbGTf+6tBrj4G14vk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STNPcXZxcEJLbFNZb2JYVnVhNzJINjczaWdXODRSYzdEUGhjTjlCdWxOcmk0?=
 =?utf-8?B?TnVoeHUxZEVSc1Q5RjNEdDk0MTdkL05HUlRxcmJoZXhnYkY0VHBZT29aZ2Mz?=
 =?utf-8?B?cXQ2VzQrdXBWNjBpNVRIREllcDZRU09QQ24rcGhtRkNwU1FTamEvU2R0WGZq?=
 =?utf-8?B?YWRKeTRWRUlnKzR6N2NnYUQzSFQySkFuS0J1QzluYXRPcGFNREFpVU1LM2Js?=
 =?utf-8?B?Um45MHZRTGNra2FweEUvMkRwZS9KQVFtUjM1MC9xVmtQL0grRDlDMDd2UjRX?=
 =?utf-8?B?K3NzVi9wSFFDbkVkS3ZiSmVMbmJ2MUlZd0R2NDRkS3p0TjAwTFNjUDhGUFE0?=
 =?utf-8?B?eVRWSERiVkZ4cG9VSWJWdHg2WnZpTm5zVExvbTJUWE52eXpJWmk1aGZGWXQ3?=
 =?utf-8?B?S04yMlJJTDBVNHdQdzRFbXV1RnNXa3VpSEdGZi9pK3RZcmVvODVPdy9TaVVo?=
 =?utf-8?B?WHpoSWhLajNxR0gvbUhiQUNEd0hGWEVJemxMemdTNnJqcHJvUklGZmkyd0Jy?=
 =?utf-8?B?YTg0aVFuRjFHR0llS3czYUtnMWxUOVExb2xNaklobGlsZGtodzQ4ZW02bUlQ?=
 =?utf-8?B?ZnJaTEJhWjFta3VCNVBTckhZYlR6bzM5Y2tsM0crWnV5eGx6U21GdzNsTkpZ?=
 =?utf-8?B?Y0NkcjRlempEUHMrNS9LcHBNaXRaa0MyMzkvc2NkUHhIMGFNcGJTRnNkSTRY?=
 =?utf-8?B?aEUzSHBPT1ZxdDUzeUs5U05Hc2VxUzVJNHgrN1dtT2FzejBucWhFSGpEeEUy?=
 =?utf-8?B?SWJKTFZGSk5OQ2hPTWxxRndTUlYrTnNicElNc09zTUNkYlR2U2ozWVY0bXZq?=
 =?utf-8?B?cjVxNm5oSWc0dkxIbGdRUlNYeUxES25MQ1ZtbndVV2p6cHpmb1dzV1RuVFRP?=
 =?utf-8?B?WWovWEtId1RDWkpuQUZibmM0NjIyZlNValc0UHRDOUsxS3d4ZHJCRGd3QmZ5?=
 =?utf-8?B?OGg0bHE3SnZhdHA4TG1Wd0FKb1pLSjc2bExHeDFhSmsxTFZRVXMrRys5aVZH?=
 =?utf-8?B?Z3NTb0xMZytGMFhUZ29DcGlLZHE0elVUaHp5SU90UU1pNjVoT1ZRdTBmamZl?=
 =?utf-8?B?Y0IrQzlvb0FlY29pTHd4YTZMZkd6OXlHVHl5MFlQM1p0MGU3eVVkY1kyWlhJ?=
 =?utf-8?B?c3NKd0VwU0QwVXpOSjRYaUlCOWtwdlpzYkVhRWJrRTZrVXVoODhPZGxBMXJ6?=
 =?utf-8?B?d3ZiVVlVa0NBdWRqQUxEcWM4SDB4dFh1Q1V4b3dOQnlYb3gramRjNTB6R25X?=
 =?utf-8?B?ZGNneURCZFFRWWgzM2llUXFBVzJDWUtSQ1orZUZGQk5WaWJRb1VJSHoxSmtY?=
 =?utf-8?B?SnBoTUVLcktLNDhEcUFFTTQwQU92eXdta1h4eEt1cVpxdkZXbHp3Qmw4aFVk?=
 =?utf-8?B?R2VKc1BtbHFkVzJ1NzJORy82aDQzMDkrSm1JRE0xRW1FVlR0MjR1bXRDWjRR?=
 =?utf-8?B?S1hMM2VkYnRsT3VyQitsQVNLejlqelJMZmU1d05Yc3kwUC95WmxSZ0c3VTVM?=
 =?utf-8?B?czAvcWl1bkZqSzJGL2FjRmhWQlVvdVpHY1BDRGhZdnNIZit6dHNuRjM2Y0pE?=
 =?utf-8?B?Z1NxakxEOTIwazNOV2I3OUJXZS9jd2RRZkZ5MTNreDRhMXhqWDBDakxHOXZr?=
 =?utf-8?B?SnVwTVhmZXVHb21mTS9UYUFWZ3BqYkxFWXdHSGdIV3cvZHRIZzdOUkk2eFRO?=
 =?utf-8?B?YjhwczRZWFZCNjJGZldxNDB0T3BnbU5QY3hBV0RWWTBMeCtnc1VLNGt0eVRV?=
 =?utf-8?B?UnZwQ280MW9wRWYyZTl2bEs1WVdWMmtpeU5SU0JZckZOWDlKR0ZlMnVQN2Zk?=
 =?utf-8?B?M25NWG1vazFuMVhmT3doYjMxWHRnL3NPdExWN0xqTHgyd25ackNEYzlHSG10?=
 =?utf-8?B?ZEFta1NZcGlJWjdlbmlJY3o0QVhzOVNQNHJiTElvQnZyMHAxZnFPWjFZZHRK?=
 =?utf-8?B?b29JSHZOdThZLzJwTXJyZG02cnMwemgrc1B3dS9Lb0k2K3BndGlJYzVMRWto?=
 =?utf-8?B?OVZocHU0N3d1c0NOQkliMFdvbVlTSDNrUGExNE5sWVhOcVllR05oOElDc3Vq?=
 =?utf-8?B?YVRGdkJRY0tHb2UwZklFMmdDeGtNMzFmU211OHQ5cXZxY1pvUTRlS1F5RzRW?=
 =?utf-8?B?alcyYXdGV2ExQnRoOXpQSU5uUE1aWmJUSVBZV0UzU21Tc2U4T1RxL2EzT00r?=
 =?utf-8?B?SjBjZUJKQ2h3Q2l0U2l2aDl4R2d3UWpiMmhGekxldTFHN2x2Y21IQUtXOWdW?=
 =?utf-8?B?dTRzVmNJSVhwUXRQREJsTmUyMStjcUhuSVIrd2Q5SVRkNzFZK08rTlNvMENR?=
 =?utf-8?B?bDQvQVF3WGgzTE01OEFmSVNndXMxS0taRFhqYzlJaHZPSjdBSkJVT2UyVVlV?=
 =?utf-8?Q?ENWss5luSGepOhbc=3D?=
X-Exchange-RoutingPolicyChecked: oz2AResasB96ibVa5zbBIqYw5d1R2CbcvGXaiRJ7LA6HqWLAsCxBwzxlyttfKFMG7iN6OEg5hC5nmLEMIJJPcnDPfPC9uAz69uT3coaaDRofh/KA5VtzjyYhK0VK0m1aPvdlrh7FK9ByRzZERUc7RdfoAYeCqilgROr+G1bzhk4nFy772yDoVgHtW9Y8yAZgp/F4Qzo0/E7dh3Un678eI1KJc/HUMP9d8FclZmOL+6UG5SbV+ONIMJyhLdp6O0Sw7WD+vsPfLVbKyQ5CrZf4DVvu8DANL59UDF6KKDrJnYrxT7dXRpAOFreIIeGk/3d4TrESAK/ZFaZtWjAcBNSO7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e2f7cc-a4d6-46e6-04ee-08df283c6b01
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 08:40:06.9953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKRwXTr7tSgQEaTZuG1b8+24iCNsmL6YGFOpfW4Edbc7cRUaUEy2F4r3ZOxDmcEtIuP1cXG3GoInkDy2145YcGebvyUa3owQtp9AjHo0Md4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6837
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

Satyanarayana K V P <satyanarayana.k.v.p@intel.com> wrote on pon [2026-paź-12 05:50:57 +0000]:
> During tear-down process, a reset queued from Guc timeout handler can
> still access hwe after hwe is freed. Register a separate devm
> action that disables and drains the reset worker, so it runs before
> any engine is torn down.
> 
> Fixes: 09c452d1171f ("drm/xe/gt: Synchronize GT reset with device unbind")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Assisted-by: LLM
> ---
> V3 -> V4:
> - Fix race condition reported by LLM (Sashiko).
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 775c826b68b4..bc9bf6f0b5a7 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -630,8 +630,21 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +static void gt_reset_worker_disable(void *arg)
> +{
> +	struct xe_gt *gt = arg;
> +
> +	if (disable_work_sync(&gt->reset.worker))
> +		/*
> +		 * If gt_reset_worker was halted from executing, take care of
> +		 * releasing the rpm reference here.
> +		 */
> +		xe_pm_runtime_put(gt_to_xe(gt));
> +}
> +
>  static int gt_init_with_all_forcewake(struct xe_gt *gt)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> @@ -698,6 +711,11 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
>  	if (IS_SRIOV_PF(gt_to_xe(gt)))
>  		xe_gt_sriov_pf_init_hw(gt);
>  
> +	/* Last action registered here so devres drains resets before teardown */
> +	err = devm_add_action_or_reset(xe->drm.dev, gt_reset_worker_disable, gt);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  
> @@ -706,12 +724,7 @@ static void xe_gt_fini(void *arg)
>  	struct xe_gt *gt = arg;
>  	int i;
>  
> -	if (disable_work_sync(&gt->reset.worker))
> -		/*
> -		 * If gt_reset_worker was halted from executing, take care of
> -		 * releasing the rpm reference here.
> -		 */
> -		xe_pm_runtime_put(gt_to_xe(gt));
> +	gt_reset_worker_disable(gt);
>  
>  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>  		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
> @@ -754,8 +767,10 @@ int xe_gt_init(struct xe_gt *gt)
>  	xe_force_wake_init_engines(gt, gt_to_fw(gt));
>  
>  	err = gt_init_with_all_forcewake(gt);
> -	if (err)
> +	if (err) {
> +		gt_reset_worker_disable(gt);
>  		return err;
> +	}
>  
>  	xe_gt_record_user_engines(gt);
>  

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 

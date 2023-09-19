Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF17CD5BBC
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 13:27:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EB710E273;
	Tue, 19 Sep 2023 13:27:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015DA10E273
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 13:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695130054; x=1726666054;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=LfyejvQd27F0MtdRvvDYuandpUaOkajL7qDRxLRrE+E=;
 b=eK9fIUhL6XU5BLgHAOUOoJMvhwj6LrYsnNPtS382ba4+ONBBe/N+mBOJ
 6hUllxbcf7+bHcqXdbpD2ONpzt3UcEdYffAQHatdKjmQ2+I0y2sZuKUhl
 s1bq/qQPAX4fRdp+32AeoitKOIzDrc6xGrAv1vuUaUqYmtUlAx78AUtZA
 4hDp2N9olwZGE4aE/GxkoY7SPvmHToK36mDKISa1kitpj1hBIhEoJsV8D
 XaU2JAywC4MCUUMxsxVqH40m3K6yli7ao6qDYWhC4NJZ1VDYerqBjVkh7
 leatTnG/XvNdUQIZQftXxxfZy6DkL1NMirAccDTpmZiBL8zHkt/ajJAnx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410870146"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="410870146"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 06:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781303464"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="781303464"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 06:27:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 06:27:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 06:27:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 06:27:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 06:27:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEM2r4ifsbNf+lUt7at3lbM9LzldZs+soj74UiBuUnGvMb96dWPb5z9EpIkwse2RZrcGJfZrTtOJTF9epPRT1Ceve0ke9EucoEOBfma7oD4TSz5GxzLe0rzJJlzKhiGwuGD75bI+1rSyYXlMfUznGJxgQ7LmWgkP601u9pJFmlneWDrjDsdJ26BgyV4C92GYHfgk2u7uhf0VPRt2m2Eo6c5b47p98Xhu8RPNuayhNOtR4AiY2iO85EMshiqT7LZ9B8dLZgS4NcYIf+CpkQN+ZDy+Y1YIwkW0euxO+Iyl3x2rQnjehLT+ARNFXNZM0ok5rlM5dOXsnu/cp9GI5Ji1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKAgCrfzYCR9kXbuSKEBGxhSs/9Gk23A9ZYJr85zBbU=;
 b=eAignUgV7nIBdB/W3XSMuIXvTJAL3dB19zI5Fan4enUZ9W2sOkF/AcQeuibeofsCcfZxPlRFpSREUbdWu3nNCU/I3hbgb5QZScNOfFurtxKK9cUbgGK6F5k7qAPLGeCzHmx4QiDFkgGHBkE6kaXygcLu6eEoCrHJqyb0TjSzUsmintXwTtOI5w0vqZl96BKZSpO9IkMfOGLfjWj/lc9aQ86nq01CRe1ezmtjTGyXgv5YOB3SOCVaj/Nl/crOWQrOuUB353R474Z4p1CvYDUGfhuoBEDdq70FzXn/QUMDgnqip5AoJVFiUNMh54qnoBDJFKBWKTzBQ/5qVB7mOCvORg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by BN0PR11MB5710.namprd11.prod.outlook.com (2603:10b6:408:14a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 13:27:30 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 13:27:30 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230919063611.14236-1-aravind.iddamsetty@linux.intel.com>
References: <20230919063611.14236-1-aravind.iddamsetty@linux.intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:27:18 -0300
Message-ID: <169513003875.2105.6876281126480171944@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR01CA0030.prod.exchangelabs.com (2603:10b6:a02:80::43)
 To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|BN0PR11MB5710:EE_
X-MS-Office365-Filtering-Correlation-Id: c29ac773-016a-44ee-0308-08dbb9142c3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HjVQf70iElg4ij5zICbWAJ9a0z3Tgvij+cGXd735bukscXvxosYz+n1lJtK3sqCmHZBkHQx+zg1vUXag/CiaLnXDJjqrrRl2PAnUD7adG4MXo76RkdB0YvmyzV3tSTIHfeLczEu6tpayQH4GMURJdGB/dD+Mz+phANyZunBw10G0xHjG3m7EoETAQSLA2a3z82WKX7opnNrLiBsJTcAteXs109Ny481jgkOgjKnDVj4tsWMnM7IHZLObbh+AN6Sy5i8ZPvVvYypFxBsSwu361X0HkUkWlD/b+O3iMQVFy/HBHRdtGiITqz3V2hrmT3xPh90StKTfceODnlUsgv1VHGZiv4jQxRhlXeRTirqlx1MuKu3yzUZiKvKEVSujkLFKRLMMsk/BB4KWNPPgqvcvQAo8OyCFLqxGRoIHueGv4kQ0OKNCGLybwgzMCkbdWSUF22bEZYTmTI101qNhQRfTFyGEPoJuu/L8HztVzmhO3WXFV8+akrgKf5pcuaIKMkfsib9xt1tHNfiV2iKw1wUfzj06GLJWRPXKgqM6vFh1PEw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(346002)(396003)(136003)(366004)(186009)(1800799009)(451199024)(82960400001)(41300700001)(38100700002)(4326008)(8676002)(8936002)(6512007)(9686003)(66946007)(33716001)(66556008)(66476007)(2906002)(316002)(83380400001)(5660300002)(44832011)(86362001)(26005)(6666004)(6486002)(6506007)(478600001)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2VnY1F3dEZTdWpKUEZyWGpINmlma3BHNU5YZ09OMm5oem0rcW1NSmliUXUw?=
 =?utf-8?B?Lzl1VURaSnQzdkxsYmFpYjlYTmhkYWRKaHR5cnB6SXBhN1U1Wnk4eFZGUVVJ?=
 =?utf-8?B?OGlROHhNVWRTVCtBOWk1aDcvS1VoSWVaaldvRmhIZ3J2YVExTUw5S2RPYjE4?=
 =?utf-8?B?TytRN0pObVA1THpIU25NVkFtQzk2VDVYNmFicXoyVEpkYTRweDhlTW1WbjJM?=
 =?utf-8?B?WmJNcldtVzE0ZWpZVW5QUlBMMktGUkRIU2wwTFV0V2YrWEhudkRkNUY3U0hH?=
 =?utf-8?B?WUppTDB5OGxrVjBaWmlxSGJkRVcvN2JmSUZpUmo5NXdDTkdmMEM3b2psU1pK?=
 =?utf-8?B?T1E2M1JnQzZPVCtIOEF6bTRpTEhHTXJ1Q28vNWRVVUU3UU5qS3RQRFdnKzZv?=
 =?utf-8?B?dTQ0em9JSHRIYXBSY3BNRkY0akxzVE82eTNGTmZQaGhiaTJtZGtJNEZodlBJ?=
 =?utf-8?B?VTZFYTY2SjZuNFl4RG1rSWdKcmtYMnRsKzJ3MTJkSTY0czB6VFpCbUttaG9w?=
 =?utf-8?B?WGVTbEF6NEVJcEdEbTRFbUZIMXlqYi9JNmxCU1JNMDlzcXVrZE10ckxsVkpa?=
 =?utf-8?B?Z2tNUnZMUGN6VWhId1dxSWdBU1F4M2c4YmZBMVpxUVpWYm9aN05SVnhYdWRq?=
 =?utf-8?B?a0cwSmhla2JmK0tjRStxTytOL2RTRXhUMFI2RWgxTEpuTm5QT3V5ZkJLdEdQ?=
 =?utf-8?B?L0E1T3pCZXpHOGZXYWRlZWI1K1htK24xWGFtV2VVcWhOWjIzcTNqcmR5bVVl?=
 =?utf-8?B?Q09oTEdoL1lEdjRKdnZadFZmbUpvY2JFQmMrejQrMHRPcE9lZkZHNFN0aXB3?=
 =?utf-8?B?WWdQMERCaTA3a0dOUDE4bkU1ZkdTdEpYcHJyNW9Ja1loWlhJTm1JRGxLN1Ur?=
 =?utf-8?B?REpPdWtqWnF0bUFBOTdQS2JHSmdqeU5vcWZqZThNTkFsSHZ3ZWhpZGFCcFlP?=
 =?utf-8?B?RUdFYzBnY2FoV2VIZldwYllST2J0bjlXeFlZbTQvRThQd2tQQVpyWVRpSFpU?=
 =?utf-8?B?N2pGNVNTMG9USkVvdFZ4Q3N6T3hiMEJialRobXJocHp6YVZlYVdLQXlvZDdU?=
 =?utf-8?B?VThDbjZPbmxpOXgvdVdsMXl2c2hjSGt4eWxiWlgyRzN2QXc2bC9vY1JhSUNk?=
 =?utf-8?B?WFcwZ01LNUxURmJoczRjTDF5L3JLQ1Jrc2NVQjVyK01Ydmc2bGU2TnRNcmJK?=
 =?utf-8?B?ckxVd0QwZFZOTk5jeWcvdXZYeEhLYkJXMEE2REdBanMwUHF2SVJ2MzNPNG5s?=
 =?utf-8?B?T1J3a0hGZThLWE5WR25vWTZYd2FwZ3NrUkM0MEEwYUFUQWx1YmZ3Y29HNWtF?=
 =?utf-8?B?SjdWU1d5Q2FzZ1k0ZWFuTVRpb0h0NnNiOHU3Z1o3dlpTOXhmU000ckE2WGw4?=
 =?utf-8?B?NWNuc01SRlcyMThOMC8vKzZ1cVBtWFJaVnZHM0lkdTdEaTF5bFRHTmp4LzJL?=
 =?utf-8?B?TEJoUG1pN1dVTTBEdGhMV01aMHgxWFZYSVk4VS9PU0sxV1d0MXFoRzU1ZFFw?=
 =?utf-8?B?OXhQY1lPNkM4RUVCUlQ3emRjZitSYW53Wll6WFhxUzNqQURaS0pxRmtBOGR2?=
 =?utf-8?B?eGVZZGp1UU5PcGZQdkZyencvb21EM0ZibU9LenBXaS9ocWNaTmhxamtzdjVj?=
 =?utf-8?B?UnNPajRFQzIxL044VVhWY0tBa0ptR2pwdHFXUHVtbjZMVUkrV3R1RTc2bSt2?=
 =?utf-8?B?bGVsVHduS05zcEpVQStreDk0MTg0ZlFvL2RHZlhzOFJEWjMxZEMzcWo0NmJH?=
 =?utf-8?B?b1YxRHN4cGx5VDROcHBmTE52SW1BRTZRU3RYbUUxV1I2dXpKNm1NQ3Y0VjFB?=
 =?utf-8?B?OUdvNmpRdThuUndCWWhzcG5JVm9aUTZ4YnByVUdhN05MaWE1RFMyVHUrVzZI?=
 =?utf-8?B?ZCtDKy9pZllqaW81VUVMcVNUZFEzTytJT3hTSXkvN0RuR1ZOeXlyTDQ1TXVF?=
 =?utf-8?B?M0xibVl4My9oYzdWcmVkMmZMQ1U5RzJyU3FPRE5wMFpIaFk4b0FwcUkrOWpu?=
 =?utf-8?B?V0VnZW1jem1GVUtNUlRJOXphNlBmTTh1KzNpalk4MWtMYU1XcEQxbVZSV09X?=
 =?utf-8?B?SGZneldvdHhxbHVnay9PNmJpeHNQTklHM3UzRml4cjRXVGZIZEtKcmtyZjlh?=
 =?utf-8?B?dHJpcHQrMk5wRlhobjVuZ1lRWDBQQkdsa2RIWTNFZmkxNGhwUFBnMFU1MU5s?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c29ac773-016a-44ee-0308-08dbb9142c3c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 13:27:30.2785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSHFoI4nZAJ/TCIUERNCdE8Rqyw1VBb7dBSOyT7oKBHP7p/T/R2RpTqJ7X33CZnjxVHYlNxGaBtHc/FLLzNnxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5710
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix kernel doc warning for PMU events
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

Quoting Aravind Iddamsetty (2023-09-19 03:36:11-03:00)
>Add DOC keyword to PMU events comment in include/drm/xe_drm.h to make it
>kernel doc format.
>
>Fixes: 4a9681392cec ("drm/xe/pmu: Enable PMU interface")
>
>Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>---
> include/uapi/drm/xe_drm.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 63863eda8355..6ab85c7fed36 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1054,7 +1054,7 @@ struct drm_xe_vm_madvise {
> };
>=20
> /**
>- * XE PMU event config IDs
>+ * DOC: XE PMU event config IDs

That was my first thought when writing [1], but then I realized that the
XE_PMU_*() macros would not show up in the generated documentation.
Not sure if there is a special kernel-doc syntax to make them appear
there. Maybe we should just list them in this kernel-doc?

[1] https://patchwork.freedesktop.org/series/123887/

>  *
>  * Check 'man perf_event_open' to use these ID's in 'struct perf_event_at=
tr'
>  * as part of perf_event_open syscall to read a particular event.
>--=20
>2.25.1
>

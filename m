Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4773CCD1BB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 19:45:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A21D10E187;
	Wed, 22 Oct 2025 19:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pseu8nbF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE1B10E187
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 19:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761162339; x=1792698339;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=c9zNWEw691XlWTLS+i3a/hkXgvaWytbfrmTvxjsZxOA=;
 b=Pseu8nbFjT85QptQWZ4NpIOj/FQ4T5F5X4INEvIfxKZVCC8KvJAP3rLa
 elGLyfGVthrJqQu9yWP3opB5jXAmMZS8ZT4yZCtrEbb13zKBT3F/mR8ic
 4pJI9jcO7Gb5HXo6/VW+o5CgRpPB6rEA0cM9ysE4oK9OHWr2g/RoSTeTF
 6C0m1h0WuQ0RSn36N6aq0maRU7w0Z36/QuEbezvJZI9UWpyiXMG/icSg3
 fqdg5CsBkWlW9M/pLZe7B+2yAhTwt64OuPoFKoMKB/Jo8Kp+e0ACfPrNC
 qCvBaXlDo/L/W1hxb9DEHn2NxDgs0qRuKC+lsOO7y3YgfF8m8oQvITl1u g==;
X-CSE-ConnectionGUID: DEe7Hq1aR/qqJa0ujRCUDA==
X-CSE-MsgGUID: QrhV6lweQ/KEhVsM6f89zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63225930"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63225930"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 12:45:39 -0700
X-CSE-ConnectionGUID: 6li2axoEStmPDEUB1g/hsw==
X-CSE-MsgGUID: rJ/iAE7eTQOORMNnFnyQrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="188003149"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 12:45:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 12:45:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 12:45:37 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 12:45:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+QuWjKKaVy2FpBDbhF9knn/PvTMsW8hT/930mwrDJZ0ecxfNe6zCWWImpvviPxTTn+KVoVHjwoXatRGwYNAnjQ8dIu6m8KRwwceZEi3rVED6/VVOUPbJnOgMHY9fF7G9W/MDrU0KKRYVNyW5m8U8Q/gEP9Kdt1Viie/4/cKaYfZIVWZsbjoT8HzCrlURlH4gs8l06csYxuZ/2yLM3gq5T8PyYcXhvzJW5j6q8t59z3cPr9uHwmrlRL3VY2BRRwoyuUk55m/n5jyhCfm/4vJQFD6WMjex5QFEj6z35SB77JHJeYusyVHNoZTuUNaJhG8zslEVbmW/uQrNbCgsHPF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVF4pjwqt3ZJ0GnkE8PGvmPDVNBu1JzuBn068GUu/30=;
 b=Ph1g1EzlrP4QowGYGbppvhMCuW7N5X3f27e5Z5AzO+aTA4hG7Sla17+pzzkEYmL2JiO3rlxxpGwCunuHcAIJdevIXEgSwWDOcfFDO7ZyKV1cwsYryLRmf9JlF9ZjNCiUcXHvKi+Asc95lkZ+YlgZh2qtUTJyg8On1P4PFmpes5CWcMCdcJ/GMEsXv3DaCcAs9jFcUOFkgV0PJJa7XiGXTfU47eSsDlO6DwoJh6HhpQyeB7RqwlWeLj3MhiykMlxB6tIGie0S+7QbczGfHWqB4oS3YaTU1X4H4wluhTV2v3Cyq33UnOkoHvLrBMlWKM+cx6WkM33D3k6begUN6W9lFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7397.namprd11.prod.outlook.com (2603:10b6:8:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 19:45:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 19:45:35 +0000
Date: Wed, 22 Oct 2025 14:45:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH 01/12] drm/xe/cri: Add CRI platform definition
Message-ID: <imrwxmkq74tgmyngenrwxl3rv3r23t7dqu2b7jsemlb6jdc4i7@l7cf36qdwfgj>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
 <20251021-cri-v1-1-bf11e61d9f49@intel.com>
 <aa7fa70a-b54d-4bc0-8c2a-01d300fa4b1d@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa7fa70a-b54d-4bc0-8c2a-01d300fa4b1d@intel.com>
X-ClientProxiedBy: SJ0PR13CA0208.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a39f92d-afed-400f-dcbb-08de11a391dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?j7a2IxGrAZ7cBDapgY0XgwPlV2xVzuiEucP/0veLcPa9R0WJvCTvY4zKwH?=
 =?iso-8859-1?Q?fHpbv32d43j+Fbb37Vgv39p6fJjB+jdewz9IqoLz+l1T2XCeNRQSiLrwJv?=
 =?iso-8859-1?Q?P1PXRCBDra9NCqFL4Ut7eWg5rFKjNeHycptiRi4uFtqNGp6Qza45KHJsHW?=
 =?iso-8859-1?Q?JPPsjbAAVZr3SojibOOXFxy+1snuQBDhuq9rnrtMcpwPzN/mzVB14sacy5?=
 =?iso-8859-1?Q?Tc+SBwDE0+GssBF6j1Mf4OI0CMV2/KSpu/uAyRgSUSZlYgN1RmNG2GwByg?=
 =?iso-8859-1?Q?CHOeZ9v2yk+hFX+XYCNAOcK4PS9lCoKifIks8a8ZvNOYSl9/k0oX/U6+i8?=
 =?iso-8859-1?Q?f2+Mu4hfwMq7/kX+DkeuT8ij++Efm+R+A4eAITBLVSFd3GRHQIfj5TAQfx?=
 =?iso-8859-1?Q?Wn9xA3TdFrYPwKVqtaIqd4MU2LiuBikDdHpQp0deA2jtOTMdd7KKrWSISL?=
 =?iso-8859-1?Q?P+osSVKCkiNbSTh5mgnxMX6TlSdO+0y6DxP4U77a1hOPedKgy+PRbGAVOg?=
 =?iso-8859-1?Q?MAis/qPdTm/8fm7tDOHSHbr2bvEoW72htjG1615OdjViHWD9pNr5pAwYhV?=
 =?iso-8859-1?Q?6tL38jhOqs1f7aoAwpnbauXFacMLg0oJc+mOHagpEuSxOB0irfmj1wOn32?=
 =?iso-8859-1?Q?zUgp2uKkdp79VahDeec31QL2GRST3LrZZhfhWWdMVDoDeLkUUuteXIT5oO?=
 =?iso-8859-1?Q?2oqUzW+717L/QgrQbUdvvEejZEoJ9XbzD9wYyTyBHuSLQKjiDKTQErMGUe?=
 =?iso-8859-1?Q?/u9TdBn75kA+SZ8y3ACa7SCbVa3ljLWtNQqTramy8Y/o5FQO+Qk1pNL+R6?=
 =?iso-8859-1?Q?H5f5gRsjv7HyA1FTzd98hA+vOKrre6r5zM2pb6iUpR0UzqmExZTKf3TK9v?=
 =?iso-8859-1?Q?+tU5gaGDP13L/RRAoqTuwG6gbT27si49Ef7c9zjWrpVZhGYoNHsvkhJ03G?=
 =?iso-8859-1?Q?jnvbR6WJQTOQQsegdb4ls7tBG0kNFKkCFjjUvsdVpHpf03Y/FOwaxc8M7c?=
 =?iso-8859-1?Q?BeyOWZqVy2+hCvnJtFFtNZqsdmaGJPNtUFYvH3i5eEDxpu1+1PNj0QVflX?=
 =?iso-8859-1?Q?FRHypcH+463Kjl54ExeYMCm9jmnsvLqRNBZjA6jGNBYLn8ZVYLgnJ898VU?=
 =?iso-8859-1?Q?ng+jVo+gPT0ltLSV4rr/XEudbinWlMVEsP7Yk452J7yWy12zwYSmGCucXc?=
 =?iso-8859-1?Q?lt9wTHs25FPvzY95OaWfoeG3xa1M6fLWkGk40EiepGmXLCsMAh4fbYEllo?=
 =?iso-8859-1?Q?CXcfQi2ezNPbwqkzicIijxrdVMM7ht22mjt5xGgQs/zNp1NrpuuvuUkXOY?=
 =?iso-8859-1?Q?YFZwLiQrTa7ntf8v19fHYewjdhpY7fOQO6qQLaYOW7UbWJbULCerpHTlJE?=
 =?iso-8859-1?Q?5GqzEMEhSX5FZA8EhWtmjvjfkGDmAZh3QBC9QuVKUfM75YQYRP7YRt0dzD?=
 =?iso-8859-1?Q?oXvYHfApHfrwO3mZ3KBqkb8vEug4xNzisxUpwFRxnrdhY7ydpdJbPzHdq4?=
 =?iso-8859-1?Q?l+rs1/xwEAi97Ov6Eo3hvt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KsjDQ66TrbW3C2aZZXkHdGAXgrSbgTByipMiYTy2B6zTOMGO0qv3OouhMg?=
 =?iso-8859-1?Q?N7LFHiI23/0THAK7oSIgS+LHQzLoJ7+5CmpsEgDyVB0UGVnOQ8TgzJKGqF?=
 =?iso-8859-1?Q?HYCOxqoAMogpfNUuU1b5g/UPq213W3bfGmTlncPNrDBV/xe3V2zfOnF9vM?=
 =?iso-8859-1?Q?q+XGfwrSdu6Usw6ZZXRH6n0bLtq1j9Up8UoDK6GYnW6Lx81hWThXFrtyLb?=
 =?iso-8859-1?Q?SVKJutA/2e/DC0VcYTqs+AZU3Rwr6XE80zas1EhhF7NEZbRgwGj13p67LM?=
 =?iso-8859-1?Q?jLozFFvuAg+KPaPzGd6TsIJk6eB1s1yTFYNj+JlvIfLkxdPnjizlohMHTW?=
 =?iso-8859-1?Q?NtpHWdna3036FOq/LP3wBcL6siZ2fA93LF++2uD3pm2cyDbc+O0gUIzEjh?=
 =?iso-8859-1?Q?23LHytgt/q41Y3vCcARUDZBw+W2wHjCdEmvyXe+oVR/WnOx9rUWde5N06k?=
 =?iso-8859-1?Q?2g8dWjFFlgY4jFwt92/9iKYhsYRyURasdm8XvelZoxDhoGjV4yg1r7KVuY?=
 =?iso-8859-1?Q?SrQJMPXJ7yn107nb3LoS50yuw8w9rQZW0qY7LsmzQqBjPmgVqeYl4kC1wB?=
 =?iso-8859-1?Q?3ihIDu/6I7+dLaT79+fZ4zjskVgXKPuKjclOq7deV0HZexWG4kOZw5jx53?=
 =?iso-8859-1?Q?MTtgCmFnArmYD6GEjFmiFBZP+r+ULICGQxN3/y0XkhiFfh1/dbYGlqTgrP?=
 =?iso-8859-1?Q?iAVDAI9QdhEmzDaHa9aB3yh/mxgzBN6WW2Yog1ZrSeug3IYJ9WYreKfrOy?=
 =?iso-8859-1?Q?WpuX359bb8WaTXlKWstYEyn3XxEeHyHOo1AftctfBB/32tsibizEdr+SpG?=
 =?iso-8859-1?Q?UVg6tuLNaAAFn3MRyFyw5C599KNg8DNF1kaNL7zs0iWY1YpA61b/WQZEA6?=
 =?iso-8859-1?Q?YxO8HbJPoQogiaDuPwBhwkd+t5ZszqDur0FX61ITFvCmWRXdeG5nzyqH2C?=
 =?iso-8859-1?Q?fGx8aAvXN9UqGO1wI+Gaie9dz51KTCF6E6A2nSEFzEDOx/QhEzJUYM9pTR?=
 =?iso-8859-1?Q?Cj7Rm0HH/upJ6A0JBdBD+mSSQAH9Uhgoch9CXN4ZnUkTPjgD9eMbBoRTTC?=
 =?iso-8859-1?Q?3usNqQpw2PnKekDs2ZkyS2zah6mpehuzSdzPBU72mKExzhXPRSX8JQ13vS?=
 =?iso-8859-1?Q?7rdaYkUiuTJ6OSwsNWbguFmnL+IVWaSxxBBhF5YM/+wUa0SXJq0XuAxmCz?=
 =?iso-8859-1?Q?L6eVBEy1YpqqcQb0VOFnn9JJeUgGEUFtJPVWvllPzUnqc3s/KZhF3d3ED/?=
 =?iso-8859-1?Q?7Oluml1L7QcSt8falNODA1fjaSK8qVp8e+OmY7AcU/TEMrqCvVWDeKAQ+H?=
 =?iso-8859-1?Q?Xoz/4gQMgY4pP1HyS30SVT0Xn8rPLhm40OigxJRryVP5O6PYdL9nXqwdzA?=
 =?iso-8859-1?Q?R85yTeCZAGUmVbm0DqyF15DpOUwr5OY+EBcXqA9fubuXlQeqbx9zZiKiQe?=
 =?iso-8859-1?Q?gI1r7G93nsNZNgx63Gw41xOmTmHv4AUJf4/cFfHPNPP9ESlnYUvuz/mrg1?=
 =?iso-8859-1?Q?eSKqfZOWZkQRC5Z9fbsHhg8lUPDg2JtJfBfU2Y4YzFKJkJf3HXyB9lyN9S?=
 =?iso-8859-1?Q?+yjLIy7x1l1RvYuW96luNWxmAXPVoawPe8lZZbysqgObnolf7iV1MFa8TY?=
 =?iso-8859-1?Q?itYOFHouxbOu9rT93pLiVFII/03wn5y/I9Lyv2/kykfPZaqp58XVmDow?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a39f92d-afed-400f-dcbb-08de11a391dd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 19:45:35.9416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3eAoAphtv9c9BEuo1TyhaJBJj1oOHubiGM2EV1/c5SEyu8A5W37fweL6ScJ9RTfLOV+Mp5dtXR2thsLOPDLgrKNsWx47EpJdX1eAvDIMDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7397
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

On Wed, Oct 22, 2025 at 08:28:32PM +0530, Shekhar Chauhan wrote:
>
>On 10/22/2025 10:47, Lucas De Marchi wrote:
>>From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>
>>Add platform definition and PCI IDs for Crescent Island.
>>
>>Other platforms use INTEL_VGA_DEVICE since they have a
>>PCI_BASE_CLASS_DISPLAY class.  This is not the case for CRI, so just
>>match on devid, which should be sufficient.
>>
>>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Nitpick: Maybe include the Bspec(s) associated with it;

Bspec: 77971


will add that in the next version.

>
>but other than that, LGTM,
>
>Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

thanks
Lucas De Marchi

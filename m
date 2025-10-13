Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CAFCCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 14:12:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2844910E459;
	Mon, 13 Oct 2025 14:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PK37BhuS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B904410E459
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 14:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760364732; x=1791900732;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XAjdMQUe3jtkshGPtucxpZQ99vONkM2+Hjqm6wdKjpg=;
 b=PK37BhuSERPHROkxf0QWZd5oL/WPrn9JguZfXHHaIQSfFEbUonXEMqEM
 qhRqzyR8JJYZkRIy/K9zooZG0mvoquQLgU6h7VyP732qxxIc6Dqp22An5
 T2Omy0PALEiG4y+1rPonBWEYTbwakS/rrWUugWN+AQZz9ISNh37zFIQMy
 KXt7oi9Tkv+hoFkDum3sCWth9lUH21nn5UdrtO+wJzP1G2ayIufUauCZ0
 bKQ2D/nnjITFJFPGANeGC3xY+W1LWXNSUqAPGR8etnVPJdneh8sGIoQv/
 fmQ59YK6x+HvBcZQdQEgB57VN78RW+7T+SGcn7S6ZpceDLVdzf8XseK/g Q==;
X-CSE-ConnectionGUID: pUG8jXSRSPakAZSCQpYgpw==
X-CSE-MsgGUID: dh5q229VRdS803QSBhVf8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66158102"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="66158102"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 07:12:11 -0700
X-CSE-ConnectionGUID: 75bXJK/gT2SO0Em/noK9nQ==
X-CSE-MsgGUID: bq9Ay4LuSW6+JylQ3SAf5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="185870121"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 07:12:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 07:12:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 07:12:10 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 07:12:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RgZcof6KDAWdo1I1Zy9/nivgFhZN7llQ6QGqHFal9gm4i6aRGzHgjjz2/cg0KbvIV63O8j2iqpP8LBA9eGsOJ1L98b8L6Pgyy07b713krkMoy8GYsPdw95HaFXsI0sPgNeyiVjts+P6o9tQQET230cvW8vY5qPxBWZgn841y0mQuKDJB0eb8h4IjRfXaY2Vm7rzjEM1HPuykbBDtAxOBOmmLsBWe3LXgCyJEraIOURsTRC+DEMQ0N6lFpVGuSZBA37wvoJTM4EQ6TCYGrb2KZ1FNpndeIXpApgYLYTqkeKBEIiAl6OK6mmGcFxmXc3iINq9/LKmqBi6ycdH2Fa3U1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAFH+1QWyd1AKjnoPOWUzgeg1BCFWdw8q6zz9fHsFu8=;
 b=uMNTwy1RPGXPSalQ6f33KvXT8pK7YM+9XTm44xvLyjLunzMCHpIIlSWmy0FdJO0hn/vS77kv2i6nwIrSGfJYVt+uIhTepuutpwauJ8Egt2apSvpDVHs1seyIM9qKVM8O3nDmzu4hjiC01HfzTbZZXH4Xf7CAnf5b/Z+Ub4JIS5pxqSmBk2KMSnSnKvGdAG8nKGLbL6w3K80WlArk/t+r2eLPpc0gy4vzmIJx2mLQvf/2q1galp90nLFeNTVLJmAYyR6ilO5zt6smifKvx2DAyzfpvx0cAytVdRsijKZTcnS1ZAENj0Rwg7lbc0lEE4ijMl3653UzHoRGsZWtgbQhsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA4PR11MB9322.namprd11.prod.outlook.com (2603:10b6:208:562::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 14:12:09 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 14:12:09 +0000
Date: Mon, 13 Oct 2025 09:12:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/gt: Synchronize GT reset with device unbind
Message-ID: <ttr32rfddllzl2iodzmb4zoc6kdzc52snrru2mrxguzr5dvmyi@q6n75igxva5b>
References: <20251013080900.1507609-4-balasubramani.vivekanandan@intel.com>
 <20251013080900.1507609-5-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251013080900.1507609-5-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR13CA0223.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::18) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA4PR11MB9322:EE_
X-MS-Office365-Filtering-Correlation-Id: e99c0477-c8b8-4a0b-324a-08de0a627f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4g/CqGV3p8JnLPy3CE9tBly2zrTYUJgsOAjj8onp3+nk0gJzEUSoJNUwr7TT?=
 =?us-ascii?Q?upfRIAfQ2nU1ql2FElI7kEsAr3/CIMVOdRR8DsGuF9kg5mngfh+zhAsss4CQ?=
 =?us-ascii?Q?7uUlsAJULTWS4azIrNUWoMh/6AwdSUlmHGJkgytQsXJ8s/erblFWTzZlE6jO?=
 =?us-ascii?Q?p6PBLqtifS3EnzwDe25c1MLhAE2ykZg9m8I6tR4GujdGNR1DGkAFRkkznpAv?=
 =?us-ascii?Q?roVnRwJ7L3C1+gpC503dc0n9WBhvg1YS/MCqBl2hFt/xBFgj9p0NLqqk/0C+?=
 =?us-ascii?Q?UbogyTWzf75rTX+ES+/Thww5HvMZNUXM9PsNtviiE2JycNF8HKzmOepq/HpY?=
 =?us-ascii?Q?voSWVSlupfl+ej1Q9EwzvFvykxxRBIS6aQw0KwjiBXRB6uL6qWZbpHSLP1dp?=
 =?us-ascii?Q?LgbheQdf5ImQ+/MCHrSw2V6P2UOe8i2Y9lKH7M20/PmMcIypEn+zhHZ3Bp9f?=
 =?us-ascii?Q?xZ5LjNjg7eS9fCAIR1ZG1t2ZzyXD5YakKul97E9WaU5vVzW7iD5sV14tg3fZ?=
 =?us-ascii?Q?gjUdfXE2ET783d3DwZw+2X0BQSKR+YloAC98w/AsiJkOgiuv+0MfqOWzer4U?=
 =?us-ascii?Q?X2aiT3hOCdNlIju/5Ed37oXUQhMn4aMhnDMm7NurGOSQZjD9jknKcmuvnhse?=
 =?us-ascii?Q?soM/LcY4gz2w7kE8cWf8n2au88+VjMYI2fvlDLFvRBoB+wVuJwhnY9kYAbak?=
 =?us-ascii?Q?3Wdxz00fMTNBu4GuKzuYxtX16esWXP2jx7y+ZYGBmN7yBLrYs0Jh9vIGon3y?=
 =?us-ascii?Q?TBhJ7C8qSL1Ds2eKUB03SpUXTtVEar8TJq74xyfcGheKgL/lu39scYeigIrp?=
 =?us-ascii?Q?TDvZkmx7xIS0yXJ6Yl+JFcSCjtyBOHORU4ZQZ+b/fVlR2dwADWCIyp99Q+TS?=
 =?us-ascii?Q?UJpPWbA9vCd2UIs1i1c9qBJ9UTvS3gRNkHg0l+FLFHYQ/1vbTjqvi16nTgTn?=
 =?us-ascii?Q?3DPu/XAN/S8cG/YeySe9PDMMd8X2QHBbH1/QLqDpxOGmhSB80Ijc/u5s1XYN?=
 =?us-ascii?Q?8JjlqVpUH04v5xCPpiuQwXbzrhWA9FzcWNzfIAcBvoU7ULu0OGaw4i2ePkz1?=
 =?us-ascii?Q?poCfQsf3eZHlZin62cmfWN2GN/jRGNYZdT3KN6PHlPeMKstL+OhBBApBDwCw?=
 =?us-ascii?Q?Xz90mczuZ2ezK8DP+Nozw0+N0W6fNjWo/YrrkuX0LXE/0dtjjd0LXBYfP1lp?=
 =?us-ascii?Q?DwIBaEI2aDMJj4ZL87EOxUusyvi6IfEFS8Fwh89ItqLibW9o1o4/wVw2jBXZ?=
 =?us-ascii?Q?l6reb/6dDtZ0WJrGc7rV8NhrJGT94udYE2emmo21eDDUGwpX6Yrw8mC9KjLe?=
 =?us-ascii?Q?N7LU58Gir/6lqwRwNZehTgBIsSxGv4iDNiCbDWDQ7g6SW9uRB9eDNGgvFec5?=
 =?us-ascii?Q?lQfSFuzI1OCNYk2RByoZUt2mDOH3EFRy8aUZIqVp+8jBA4DrKJJBjAVUtoOI?=
 =?us-ascii?Q?n2PJjbsYWtqzcbNBXLoZFZzK1fvcfkG/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?poHmY5hypX6tlBh5huttWr/evuy517Qx1+efU9KUh7wUmqfbd0lxjIjKhDTJ?=
 =?us-ascii?Q?jrWUT5leJnnSfSHBq0IU1lGg+d7dZ99DnFQfE8Y/SeydUyptmF9ML+6OA2Uc?=
 =?us-ascii?Q?gcgBDGR0gi7KOkEEezb7yq96NS+mPfEDE1kSQNdiUoYhIVCoMVRFAp5D8OdP?=
 =?us-ascii?Q?Jq2D9O4aJugvg49ig+XegAxdQd7G4rwGgWhVl+lXpNIZRsh5ZIZanl3JrDOL?=
 =?us-ascii?Q?A+MJhQKIOj44PXnFE0Y7tNNj7zAxcBX41xFymGHcYkBHBHkSXQIg6O5f1gfA?=
 =?us-ascii?Q?44fvSKuWnqqRrH1R3vEe1qU4iSeE6DAv7nwmLkSyrA0sA/L6wr7/Uf8QfRQ9?=
 =?us-ascii?Q?TX0CEW1CmzsLqMuQKB6u3PwfhKxDFlzC+CUDjvANMUDwnBajFopzhat5Wiv1?=
 =?us-ascii?Q?x6WCBJkS2+CCelB8HnAdoxlHLatrVARbRVXfubrSBlVTPgEJJZU3WTgYaoVJ?=
 =?us-ascii?Q?87+QkhR9RhBGF01rjcqvaLcWsfBJ2AhQgUPLHTwhpTg5afBat9QjKOearphM?=
 =?us-ascii?Q?KtwxndaJeg328Ru42IzOv/K6x8ZmX4uNks7G57Fx8F9gehjw06KsCA8lgrlf?=
 =?us-ascii?Q?BIHuFt2Hb/aHz6s9/PLX03xsoeGiGg+JsHpEQZwPP1xTAjBPfEmQcjutSX2a?=
 =?us-ascii?Q?xD1Fl8hXPaHKkAH95rDpm5cCVWp/ewJ+fj5tuYEXoTj9veod3tmx4jeyaA1w?=
 =?us-ascii?Q?5j58E7R0+WjhhMOBMKOR4nbU8YtYV5rxdTlfw/YKm4qcfRKWBAWA6FrH3ZwG?=
 =?us-ascii?Q?l3EdGWNQbAmIoOk/alV77DSkkfaGE/vFxskfQcNwyO3nBZ/ctmify4GQn450?=
 =?us-ascii?Q?vhcmAWblbMKlgOwf7MKVSfwLFzpsesonorBxYZd7Loi2O8yHi4u/lQ+DYEVT?=
 =?us-ascii?Q?y3SlT4cUX9pcX3c/Xj1kumHxsw2t1ztJG5mdYYbmQYo8BPUkI5zgaD3tRKE2?=
 =?us-ascii?Q?3afaGj2XJ+ZxzwwD+vN1k3dBDZsrpyOXgjQg2R1LFoGbPL4tG1dEkzNOBGPb?=
 =?us-ascii?Q?+UjATXJVEEwPRyGU00c4rmm/ztQKjre1MWx8FpD7pJ5H3fluZrmbfXyiCAwf?=
 =?us-ascii?Q?uSN+ickYgRYrusQ1/PnGM6UcjcM363rswXy6jO1HflN0t19exZaRmI3BizFB?=
 =?us-ascii?Q?IQOAR6jt1QZ5Hlk62RPPgRsBTlo6q/+wytb7f8ozEzykxG/iLidgfRTw+iBC?=
 =?us-ascii?Q?NeuC71uwSIngyu8cZ+1iScosHW1UTebr/BkWkUpO2nFmitNB/3S8OvGXtaAh?=
 =?us-ascii?Q?Emegh9yc6mFVETbXugL9LOLTS6JBSbQ4tWKaHMCWtSKcAsGsCTkmYglppD1c?=
 =?us-ascii?Q?Wfqyuw83e04ZTS54MMrNZqOc6HIjULmE4A2CrdkXGaSqROcE5/00K73e4yrQ?=
 =?us-ascii?Q?xOwrCMiYi1VSFCR7twX0j/S63SED1pn/nPCIc9YsZ3muNKE/SvjohTlmyO8c?=
 =?us-ascii?Q?i9Mb2ZOB7l7CDBp+tFdBUBZk/IIo8VupeUZqObw+1ILP/IfKXy+BKntFpxiV?=
 =?us-ascii?Q?dcW4j2EK/N6gUhAHQQ4kojIZINvRkn327531tnzBla5wQdOXJlHBTHT1IfeI?=
 =?us-ascii?Q?q+8M5sY0TPNb9O1H1UrVfKIOe9WQd+8AAFBMYkinSX1l9F0EPiD38TDyWtBC?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e99c0477-c8b8-4a0b-324a-08de0a627f15
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 14:12:08.9799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIx2xlrnPU5/FZXilV3QTAnnDLNTV/APMEbr/WJTC53GGNaNWRqia488f2vcqPhtb3PH2aOS3P6nHMZ8gMWOFMUD8tDnr/Y5ylB+2BJMUCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9322
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

On Mon, Oct 13, 2025 at 01:39:02PM +0530, Balasubramani Vivekanandan wrote:
>When unbinding wait for any GT reset in progress to complete. Unbinding
>will release the mmio mapping but mmio operations are performed during
>GT reset causing Kernel panic.
>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c | 6 ++++++
> drivers/gpu/drm/xe/xe_gt.c     | 5 +++++
> drivers/gpu/drm/xe/xe_gt.h     | 1 +
> 3 files changed, 12 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 386940323630..243c0438a1f7 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -975,6 +975,12 @@ int xe_device_probe(struct xe_device *xe)
>
> void xe_device_remove(struct xe_device *xe)
> {
>+	struct xe_gt *gt;
>+	u8 id;
>+
>+	for_each_gt(gt, xe, id)
>+		xe_gt_device_remove(gt);

we shouldn't add such call here. It's up to the gt init to provide the
cleanup. See this line:

         err = devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, xe_gt_fini, gt);   

Lucas De Marchi

>+
> 	xe_display_unregister(xe);
>
> 	xe_nvm_fini(xe);
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index b77572a19548..a58882065395 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -650,6 +650,11 @@ int xe_gt_init(struct xe_gt *gt)
> 	return 0;
> }
>
>+void xe_gt_device_remove(struct xe_gt *gt)
>+{
>+	disable_work_sync(&gt->reset.worker);
>+}
>+
> /**
>  * xe_gt_mmio_init() - Initialize GT's MMIO access
>  * @gt: the GT object
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index 41880979f4de..03d4dc2ff37d 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -49,6 +49,7 @@ void xe_gt_record_user_engines(struct xe_gt *gt);
> void xe_gt_suspend_prepare(struct xe_gt *gt);
> int xe_gt_suspend(struct xe_gt *gt);
> void xe_gt_shutdown(struct xe_gt *gt);
>+void xe_gt_device_remove(struct xe_gt *gt);
> int xe_gt_resume(struct xe_gt *gt);
> void xe_gt_reset_async(struct xe_gt *gt);
> void xe_gt_sanitize(struct xe_gt *gt);
>-- 
>2.43.0
>

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CA2C27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 19:09:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447A810E4C0;
	Mon, 17 Jun 2024 19:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="besbtsFF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266C110E4C0
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 19:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718651373; x=1750187373;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dB3bqtdsCwWj8cyAq9n6I8anWFbWCpHSdrm8ey4xmAc=;
 b=besbtsFFYL/4Mvk14tO8doKEPSVZSHkkUtxm5jlGV6kdALcpZ+i2X694
 53fW4Wfx/AQaNOP3HltZBIB8mOqWFpqfFfW+/wiy1rCXOgP4fDdGBq2p9
 B/kFUSDl0M5K9wuy0STBnGssr4syr0f9hlsxW5NcfkTGj7iggZHw5CEqw
 R08YOasPpAiHREWqoFBtVAGPDJ4R2X4rPujSu++WlhuCW0Nl5cuJBVtcS
 y/GqYiI1aDZm3rQYqXnRoXdblpTarKJpcZl8YaId0fehKzhZR3XSpZiE6
 gSg2NOr7G2/hb1lhnVYs1XQ7DPjktnFM/bnOb4HbVbby+VN6WS/9yofXQ A==;
X-CSE-ConnectionGUID: mfAxow9nTQi7yg7s+MwlvA==
X-CSE-MsgGUID: Go/pTOy7RAetldkMYuVLtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15624070"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="15624070"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 12:09:32 -0700
X-CSE-ConnectionGUID: Ea5evz+TTjux2yMBlj8RKg==
X-CSE-MsgGUID: ITwGh3aWR36emUXEIm5GTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="46206217"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 12:09:33 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 12:09:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 12:09:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 12:09:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 12:09:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTppNuwzzO4fgDSy3MpJQMaC3bHbJS+cmWwJJ78dVxZIbtiUYfC1XO3ZI1QAYUHMIXEB2c0ONnyC9BrUPHTm87rZDXZHHg5fwBXe7ITQjJQFRnmGr3/lKoOhWwBYvqRlRy+HRjuOKhfFolIB0Uli9JFHgIYiQ+OIJHRxrBkTRokEWnUuwO09zPAPRekr943gI5F8bXrk7/rxycj64BJi7YDgxoeD5eK/0PkoyyMG9gw12W8st+BsFnJe2YfXKfki/snJyX2vN2/ZGri1XfeQ5DEVXluhT3y/x+jG0wqGsgr7VmQdYjmIA0E6el5fN2jErike0y0gx8JKsv9323vyuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHtwjxDXzPAkaSwktbAynKGA5CeoyvxvMHE7xXcHQX0=;
 b=KQqL+kqBJC9joVj3f89LUu3xlGl8pRiHmNyDy/CTC0KzKLwGfGeC6SYu30aXxIIN+SS4deGiPoozSWQMF8M1c84fvkl+5BHPCig4zzGJGbbr27GdHVZBUm+4kRojXMLERMQ//J+u2YMu9HHwTw9pz44EGi6AeTgGfluwx7b/A2BPBoY3Y728tyKyGFDAbpy7gk4SMwq8FK4hBjIPSp7sF47auZBeSdQHdrcFPKJyKeVLABSSdZx4UUIIjHLxj6Ore3LnuiorUOpmLNoSo0Wdb0gFB5V+T9dVRk3j6CF3muQeNiPsVX2dCR2QTHgHZilWJ4KdA1An2fbwYZO57/0f3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6282.namprd11.prod.outlook.com (2603:10b6:930:22::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 19:09:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 19:09:28 +0000
Date: Mon, 17 Jun 2024 12:09:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/5] drm/xe/rtp: Allow to OR rules
Message-ID: <20240617190926.GG2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240617182518.280975-1-lucas.demarchi@intel.com>
 <20240617182518.280975-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240617182518.280975-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: 2973702c-9a62-4619-960e-08dc8f0102de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KGTnvkmJsbSHDSFe8CByHdpgpsRaE7qVkRluMM3HD2tw/Ym2EQfCEoxRV8/U?=
 =?us-ascii?Q?P+QgqqNFDq72ZZdnnlqhEsOKBxG/wL29rhtNa2OAzOeiI0SClNU1E9Ir7ujU?=
 =?us-ascii?Q?xFDh+Yw23JEW2PO+PxP8iH3uGVirRRdcQD8KFTAKca0Q5O2lFKKSXRSj7NWF?=
 =?us-ascii?Q?vF3OiNnYHI7oLMW/IvfmIbMHzhbPrVVclietJ9mQ+WKUTLOuwy9OJ+UhLJwR?=
 =?us-ascii?Q?NvsYUdRhgCcwq7pdo5uwa+VU30Dh5F5C1Uv/g85tPGTfxeR84PAjTQW+wfnO?=
 =?us-ascii?Q?IxdVJdwOZj7eWHIaMpvw0Cm9aO6qBBmHvVPHaEr/TiQUDZTVaoyVfQRbzkCK?=
 =?us-ascii?Q?ZssaxLF/Jwm1fsrfeG4oqp9J3krB8Nu0XnQE2TIDkiP1PGJL1ZSKGzWHGCpt?=
 =?us-ascii?Q?2MFvok6pkqm3yLgE89rMQzP89fiPxjhoKs4KiiYu4Q0Uh4oy4mOCbWpq5Rza?=
 =?us-ascii?Q?C0iXptIEp5A1UMHmjtIKDQRUbzTb1Yxl+beHUZBry7JKbKVKYEDNz7aUJJ4n?=
 =?us-ascii?Q?CwHKzLVApsU5OaHVfnr8JjoiS5T0RSaq5Z00QNlI8WD8btRcUs1xRxPdgvxP?=
 =?us-ascii?Q?rA5AW/JI4E41o47Ig18ch/dvelUs1WCzEs4cl9RmSymJ6GmGkjUaOQPH+yUM?=
 =?us-ascii?Q?HPBVKcTKlTQvE5yJCZkBmeAYSX7uAgC916i9YcEXAI03Y7mzJg8iTNTrRa0R?=
 =?us-ascii?Q?Kboj0I6ah2K0hv6Kpv5UcG5CKIpwzwVyjo6x0gihtQpnIayTnJ5A7TGQooVW?=
 =?us-ascii?Q?tNj9uKZIxPwGHZyXvnILKQHZN263BRR9bv59oKISdQMnoedfbtRpFZ6GgKxI?=
 =?us-ascii?Q?0IF6vglZC34P8IIW5hRlTQu0QDGECP4NgVga8++lCS6SnLUsGuzidH4rI1in?=
 =?us-ascii?Q?6OD6IbuyWdxJijMQAItMz+yPiezJdt6GzUhgL2WpwzWkT6gxGmJ2Ir0XV3n9?=
 =?us-ascii?Q?1tacEZv+R+O9cxjnKU5mjg4irBsYqPa3npSaJwnbA0SMfDApwRhbYpFshmWt?=
 =?us-ascii?Q?6iFrmBuQZJLlughNof7NKUCi4KULSnteEaP7VSdNBtVweOKbsjQ/CJ/MOSri?=
 =?us-ascii?Q?Sip/Lg29MKOdfyVtCy00TT4TPgp7wead7ypAQsdaTQIloNKIN+KnqIqR9Ez3?=
 =?us-ascii?Q?9w9vJmniTTc+ruqm49Fel+XNuk3Vc8FvMiNycaaFdOX8cZZOTwzvBKwf98Iy?=
 =?us-ascii?Q?9SVYbB1c9Xv9II4K9/afBjh3AhPiRbQ78I4A2AnHfwraEszCAnm/+Mwz1P/v?=
 =?us-ascii?Q?+6cuPQN0lOjFXvwAZdX+j25yW2byHzNg4MmXHq7P57pW2DGzm/Y14rGqaCdq?=
 =?us-ascii?Q?2PCDE3nuD+cVv27VNQficXu4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q4f6asIft4MExntRO0wGwxmYzuOw1FELPktpxcohuhIFnFpKjo/kLz/wKGAq?=
 =?us-ascii?Q?rV2h2bclvbc92nECwGYDpE30sbiOaInMNqd9oJvsnD9NoCEh6Wy0mJHwdfYM?=
 =?us-ascii?Q?GqDosbx6ifxjovSHgA31XeVB9gaak4bBq1S90W2lw/eEpnPgD8V+9BsDwFn9?=
 =?us-ascii?Q?/yQV+ugeNQLkfLbvuONjmeyFxJYye0bZO73BffgnV1ZCnQdNz79ExW7p8buJ?=
 =?us-ascii?Q?pzoJrj52QvhAfHGeu2I5vKAJ4AE5hSl0URpaHXJM/35JNR9vjXRjbmUm/Uhl?=
 =?us-ascii?Q?KZLvNlrX9b1QekEDwhYQgYwq3zMRJ0YgDN+XgfGOYSpVkP67kufb7p7OfYDI?=
 =?us-ascii?Q?fb59XhNYBCA5kHtg+QZ68CZ1ljFTJzAOVwD7zER1MjRLMEf5bCWMtsTSxJHy?=
 =?us-ascii?Q?luSMbwYohRQBQAnKHsVU1Cs8euPmybL6gSxzqVyzoXavOmil/qwJcNRr9z8Z?=
 =?us-ascii?Q?ron8+tgiNDpwem5F6gfJMmpGHqh1j9L6Qye8UKhonF/FJ5dekZfLnuH8/VvY?=
 =?us-ascii?Q?NnQ7JGjE+LyarP/uQNMbp32gWa6lsLqCP7ZLg46vL/4BIQ0qYObfcSq2FOau?=
 =?us-ascii?Q?LC+goyLEc2DSD4L5Wto3qWQuS9jvUZsVrdGxSXhm+0JZbO5aReQK4nrion+K?=
 =?us-ascii?Q?LlBz61iueKuRgM1dmF684qX0RnD18obFBtWHlDq3EFSovgwkT+B5h0UNg//x?=
 =?us-ascii?Q?zbOS/YL0CVHZREqi2Qw6fsQWqc2Hf5vih2waESkkKx+HekslgobzDSNQUxvu?=
 =?us-ascii?Q?+WbJl7QNK35Ak5UCPf8EhF/auD3N9Q/qmKrBJPjRC381Z8Ywry1ynmHbl6B6?=
 =?us-ascii?Q?HLhcdCfI8J8sOoE9pzVCxKTFLAIbBW5SkdK/t61sbh9iSto/kKifj1lCz3Yl?=
 =?us-ascii?Q?9YZ2vLdnY2Q9hIQhAM3WJQ44GNE3ZBXEEygETpydrob239MuNUgAIhRGy34m?=
 =?us-ascii?Q?5jW69CCYgnSJdQ6a+4glrJchprtH28kluzSM4gqJzaIrRJLlsBxuqIakeN2q?=
 =?us-ascii?Q?O42/uGVCfQjwYguWHTusf//7RDp48z0XHKr4CD5ykRa/paI5cg2k/yYCBhkH?=
 =?us-ascii?Q?xRJWJxxnefOMKUeFfrDMau/agfqXCSTOU0DWFqzDCxEjXxn6XrpUe/i0lSo3?=
 =?us-ascii?Q?0jdaHItoezEeB1N4/L/2RquFeD92yTNvkt5NBmosxWx+HtqIwUI0vR/BGDxs?=
 =?us-ascii?Q?6AJzAdOan05HgCj8Wvn5pYLDuI/QT6bUdUX/03LvgK1cDm28tf0FCpc8xAGy?=
 =?us-ascii?Q?JqYe64emn49UCoTMKQCpPH9xny0NZ31UU2M9ah4Phhl4TaF4Ag0CR+poAoNe?=
 =?us-ascii?Q?mb6UrUtXtpoOGTlA4sBSUDlckAMLJoqXY2KpmxEf0mjCqWvuvsxD3VBTJhmf?=
 =?us-ascii?Q?tnv1ZJgDsWmEKNQNCwKJZ67jDy6JQXIfbp0QZq8yEPs+sZVieW5obnjNRWEy?=
 =?us-ascii?Q?ABUB+pDfO+o6tBE72Dv5I0FaecAIDcX12l1ftrW8weFjXlqWmRQ6/bBpwvcv?=
 =?us-ascii?Q?5YX3CveuxgCo3up55bQBVjcn8B6zA+PPG5e1TTnPcUi8DtGV4qiK6n1ltP+A?=
 =?us-ascii?Q?GsyvKbH6zgU9YqWGFd4LuLNldyw9qkpeEYIJuoPJKYFnj42qMfBQ2/Rd35uG?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2973702c-9a62-4619-960e-08dc8f0102de
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 19:09:28.7526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bzFGv/mMPNadojfz12osgOxqMInilNYKDBtgPBJpbfEzBrReUmwIGHI0DylgHm8xQz3krBRtrgSYWjq91Hspu9aJAMsyDNvTD1zK55E7kao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6282
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

On Mon, Jun 17, 2024 at 11:25:15AM -0700, Lucas De Marchi wrote:
> Some workarounds started to depend in different set of conditions where
> the action should be applied if any of them match. See e.g.
> commit 24d0d98af1c3 ("drm/xe/xe2lpm: Fixup Wa_14020756599"). Add
> XE_RTP_MATCH_OR that allows to implement a logical OR for the rules.
> Normal precedence applies:
> 
> 	r1, r2, OR, r3
> 
> means
> 
> 	(r1 AND r2) OR r3
> 
> The check is shortcut as soon as a set of conditions match.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 54 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_rtp.c            | 20 +++++++++-
>  drivers/gpu/drm/xe/xe_rtp.h            | 21 ++++++++++
>  drivers/gpu/drm/xe/xe_rtp_types.h      |  1 +
>  4 files changed, 94 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index 474a0b222ce1..bf7fee9b20cc 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -90,6 +90,60 @@ static const struct rtp_test_case cases[] = {
>  			{}
>  		},
>  	},
> +	{
> +		.name = "match-or-first",
> +		.expected_reg = REGULAR_REG1,
> +		.expected_set_bits = REG_BIT(0),
> +		.expected_clr_bits = REG_BIT(0),
> +		.expected_count = 1,
> +		.entries = (const struct xe_rtp_entry_sr[]) {
> +			{ XE_RTP_NAME("first"),
> +			  XE_RTP_RULES(FUNC(match_yes), OR, FUNC(match_no)),
> +			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
> +			},
> +			{}
> +		},
> +	},
> +	{
> +		.name = "match-or-last",
> +		.expected_reg = REGULAR_REG1,
> +		.expected_set_bits = REG_BIT(0),
> +		.expected_clr_bits = REG_BIT(0),
> +		.expected_count = 1,
> +		.entries = (const struct xe_rtp_entry_sr[]) {
> +			{ XE_RTP_NAME("last"),
> +			  XE_RTP_RULES(FUNC(match_no), OR, FUNC(match_yes)),
> +			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
> +			},
> +			{}
> +		},
> +	},
> +	{
> +		.name = "match-or-empty",
> +		.expected_reg = REGULAR_REG1,
> +		.expected_set_bits = REG_BIT(0),
> +		.expected_clr_bits = REG_BIT(0),
> +		.expected_count = 1,
> +		.entries = (const struct xe_rtp_entry_sr[]) {
> +			{ XE_RTP_NAME("empty-matches-ok"),
> +			  XE_RTP_RULES(OR, FUNC(match_no)),
> +			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
> +			},
> +			{}
> +		},
> +	},

Is this a case we actually want to support?  See note farther down.

> +	{
> +		.name = "match-or-none",
> +		.expected_reg = REGULAR_REG1,
> +		.expected_count = 0,
> +		.entries = (const struct xe_rtp_entry_sr[]) {
> +			{ XE_RTP_NAME("none"),
> +			  XE_RTP_RULES(FUNC(match_no), OR, FUNC(match_no)),
> +			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
> +			},
> +			{}
> +		},
> +	},
>  	{
>  		.name = "no-match-no-add-multiple-rules",
>  		.expected_reg = REGULAR_REG1,
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index eff1c9c2f5cc..66ca58fa5739 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -40,6 +40,13 @@ static bool rule_matches(const struct xe_device *xe,
>  
>  	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
>  		switch (r->match_type) {
> +		case XE_RTP_MATCH_OR:
> +			/*
> +			 * This is only reached if a complete set of required
> +			 * rules passed, so return success: the remaining rules
> +			 * do not matter
> +			 */
> +			return true;

Would it be worth adding an xe_assert here to make sure OR isn't the
first/last rule in the list?  I can see someone deleting a workaround
condition that's no longer relevant and accidentally leaving a dangling
OR, leading to an unintentional "always pass" condition.

Up to you whether this is something we want to deal with or not.  Either
way,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  		case XE_RTP_MATCH_PLATFORM:
>  			match = xe->info.platform == r->platform;
>  			break;
> @@ -102,8 +109,17 @@ static bool rule_matches(const struct xe_device *xe,
>  			match = false;
>  		}
>  
> -		if (!match)
> -			return false;
> +		if (!match) {
> +			/*
> +			 * Advance rules until we find XE_RTP_MATCH_OR to check
> +			 * if there's another set of conditions to check
> +			 */
> +			while (i < n_rules && rules[++i].match_type != XE_RTP_MATCH_OR)
> +				;
> +
> +			if (i >= n_rules)
> +				return false;
> +		}
>  	}
>  
>  	return true;
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 337b1ef1959c..5a6b112a8be6 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -179,6 +179,27 @@ struct xe_reg_sr;
>  #define XE_RTP_RULE_IS_DISCRETE							\
>  	{ .match_type = XE_RTP_MATCH_DISCRETE }
>  
> +/**
> + * XE_RTP_RULE_OR - Create an OR condition for rtp rules
> + *
> + * RTP rules are AND'ed when evaluated and all of them need to match.
> + * XE_RTP_RULE_OR allows to create set of rules where any of them matching is
> + * sufficient for the action to trigger. Example:
> + *
> + * .. code-block:: c
> + *
> + *	const struct xe_rtp_entry_sr entries[] = {
> + *		...
> + *		{ XE_RTP_NAME("test-entry"),
> + *		  XE_RTP_RULES(PLATFORM(DG2), OR, PLATFORM(TIGERLAKE)),
> + *		  ...
> + *		},
> + *		...
> + *	};
> + */
> +#define XE_RTP_RULE_OR								\
> +	{ .match_type = XE_RTP_MATCH_OR }
> +
>  /**
>   * XE_RTP_ACTION_WR - Helper to write a value to the register, overriding all
>   *                    the bits
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index 637acc7626a4..10150bc22ccd 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -51,6 +51,7 @@ enum {
>  	XE_RTP_MATCH_ENGINE_CLASS,
>  	XE_RTP_MATCH_NOT_ENGINE_CLASS,
>  	XE_RTP_MATCH_FUNC,
> +	XE_RTP_MATCH_OR,
>  };
>  
>  /** struct xe_rtp_rule - match rule for processing entry */
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

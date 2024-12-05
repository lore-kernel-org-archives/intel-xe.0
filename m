Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363B0E77170
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 20:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F182110E5CA;
	Thu,  5 Dec 2024 20:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WAwUyQ4N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FFB10E5CA
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 20:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733432156; x=1764968156;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PE8wVz6z7umVo8ajwehzZ3RAP7X1g8m5N/xZFAIjQtw=;
 b=WAwUyQ4NLmUnQGGQWyW/EUdiziQ3j7QFRxAQzebKlKT4MOwxeMcFw+bQ
 a7yOoTHFpD2lHRICqzunBhlGNIwFNUKSAcqGmAyy9PiBnroRd04arExyK
 hqBZw0yhrnDepkUe9U7JPUtMuP3bgb2QWQ604KqWk87ssZ5pZA+vq4OgL
 NcyZyu6521yDOxWX085aO7HKcfzxMZ7gvX/hBCMlJwjZS/cQaPLjWlUwI
 Fr1PLU1sUns9gIyhAn80nMTE2ZAxE2W7g0hhVof4YBKObheUFKIbNHkq+
 SM0VW6S9fq8W7Y60sio7WyCOhvRBWzYsYAG9IMLXfD9dRXWkytHjP2ZoL w==;
X-CSE-ConnectionGUID: 0TEMmeK6Say2YayRA6R8Fw==
X-CSE-MsgGUID: uAcvC4oRTamnsbrOiNUoeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33685730"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="33685730"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 12:55:56 -0800
X-CSE-ConnectionGUID: bShM/YUdQyud5e7vGi+sJA==
X-CSE-MsgGUID: R+E2VeKrRo+1RRmx+IoBIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="131629384"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 12:55:56 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 12:55:55 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 12:55:55 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 12:55:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=da5m8sa1wSfJrULlCFCIqcCnx3wFmua5bP0W2uxNjOAnIHM2HfNqN/0qmEkqBhpWFTPPbbjGgmh9JCcDxZDhpXQcpLjFJx0CmRTz6cx/DTFXvZHgAne7ipWhjhsnzpXKZihL2xHayMpk/d57zUPxgoXbVWn5LrgDynXfI4SeQ1z5CNKaU1onqgVbaXW/TS+KmHATLqQkNVlJQ87cjSbnRDr8j85nUx3Xx0YG6+O18PQsOhfDTCPeEn4hp+L/ZyqIiZNCqhwT7lxqvsn9pas/W1JY33arDyrXtrqzylgcITGdi0cGNiEh33YznSMZVkK6n3EusdVsDGlcy7lM7SNxfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BlSIhCnzq9dJnAOJhA2dYblrN/K12td5u2WDEdsG4o=;
 b=Lmz9Gv0r6CVOnmvpsjLv7rS0uG9puqWO7PXTWY80hyBEU+Z5SkqU5VdPyrGk+ejDySunLHm9Yx8RNpQ8ofStNJ522BC75/EyhIAf3oGSka9YQ1yrijJESZoDZGtlW8rDUIp4s07huuhfsTHCNpMuza25b+Mfr5rtthOLGm32BAAO+jNEiIjwXdS502KWxsMEAME1rmIEb5JdwBD6tJTZ891p1xW/awyKMMl9UBydIh32yT0zkCh5p6PQYqqFHGv+VzmdUBge0Z//yhiqPKvqZh3+DZtEsPe84XyTo5IBqgwfpnZ42QLXzadB9sLNHHoy4pmBSpAzi0GmPMxBeFQZJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB4926.namprd11.prod.outlook.com (2603:10b6:a03:2d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 20:55:52 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8207.014; Thu, 5 Dec 2024
 20:55:52 +0000
Date: Thu, 5 Dec 2024 15:55:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/vsec: Address static checker issue
Message-ID: <Z1ITVafQv2tm2anJ@intel.com>
References: <20241205183649.3120032-1-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241205183649.3120032-1-michael.j.ruhl@intel.com>
X-ClientProxiedBy: MW4PR03CA0318.namprd03.prod.outlook.com
 (2603:10b6:303:dd::23) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB4926:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e108541-3fd9-4df9-46c6-08dd156f3466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nsGQXUMCIOQA+ZAypJSalkBy+pWW0rJ0dQB9kkkzAweX7EiXrnQmPki5/WLh?=
 =?us-ascii?Q?blFv+ZTHy+w3BJ1f1w3mfxib4FmAEjUK/pv36XqxXqKyrVb7sQrdGcNmmrEZ?=
 =?us-ascii?Q?ULmGS0zbRsvv2oKo1NMY7ABknF0qfpjHrd1RfzF8wWdbYEhoupBYUiVPvrdE?=
 =?us-ascii?Q?j8rQvCq5KaOwiu5iuVPsUhuqGwJJdhutCuUeIZlEgKgUHgpzMDk34MCwYNP1?=
 =?us-ascii?Q?5tsj9hnAHCatuHK4NSW6jpIoo6LA+4lGhMh2Cn3KKxEEJufNQWGGrJ5pPhrC?=
 =?us-ascii?Q?q+ABMd1OiR8thQ+CfUMH5w5e5xDnrm1UZvhXO1VVCESlAmorF2dYfPWpbCDF?=
 =?us-ascii?Q?IGkUKS8b6bSs2HFifq+P4oZnLUAMhVED5a7Af1BLTOnzbFYacX/ZTjvWJYKk?=
 =?us-ascii?Q?YXUtG+gbdfkmeTKk8IQ5IbV6Q7AlvVpiDGqpSH0JIXHCphE2JP8dZNa54RJ7?=
 =?us-ascii?Q?rC9VYMz4ekcLw46Y5lEcPkJf0z0YRHLkTJCbLm2GqCLZKkzrX9Sw8VWgwl3J?=
 =?us-ascii?Q?DdsOngbBFgs+UVbVHE8Yjoc9AvuJUSx6vajTxKqE9Y2M/kGQz1S5EH+Jpf+Q?=
 =?us-ascii?Q?n0pUWXUz+rkQqfsVbPubA1Hi3QAT0NVszvNAgRRoSItCzc7zkroo79B7Oa+h?=
 =?us-ascii?Q?hplj09t0IqKTdC5D0vnb5x89N+zARBF9YF3lMkOTaU49y0SGteU3xJgNqpKn?=
 =?us-ascii?Q?ojAGF+6RhF5XlZl1Mu3QAy7ldB1V2lrTFq+jTd9nYu6J/In0uiyg3et41XcR?=
 =?us-ascii?Q?zQZ2Ji4BJyczgmPdUNtK+meomK3Hye7Q2awujNNNNPcg4E9r15zktOKPsgbl?=
 =?us-ascii?Q?5YRO8yW0wKfCt6kqq4KTDXkYM+nkv/xqhkRxvy3M8vEZDvrGUDtbRvUXH+B5?=
 =?us-ascii?Q?sw/LGsA7g+cqrHqWwhgXpkdA8tGUpqS6nA7wNvdqui6g7MTwAjqLljuwvCB9?=
 =?us-ascii?Q?oUmTez+XVwi0yXzbfQVwkrKA9vXH01wSFM/ApInAzYMCDlNdUrtweqXAmfq/?=
 =?us-ascii?Q?DvCfftzlvbOPNQlCFC2ba7IS6swS4kzRUZSF08S4FnKSeeqx63yBKHSXSiaf?=
 =?us-ascii?Q?BclqdML80pbNRyK0geo10LOrk41fOvryi8ehD1/rZLRe+0IkNgAXRDJpny/k?=
 =?us-ascii?Q?zqtwq/C9i8Aub11EglRtKRcc55hSazsgMXN/WVmdQKMnCkSuQ+7JCmincnnO?=
 =?us-ascii?Q?Abn73lBBRnc+jCHVTnBZS3guXryODbmT2m0DugU1HbgQXkfEr0oG5aay4HW7?=
 =?us-ascii?Q?C1NXUGrGGeYrme+3QKd9sV2qr1qVgOFpG/xwjTK+xfvNZgpzIVWoD1aeLaPC?=
 =?us-ascii?Q?j3qC9zws/jY4eP6QpHez/krw7j8E/9XKjqttEFXCXaOJ1D33THpXo6D5sejn?=
 =?us-ascii?Q?KSYDY08=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tTdBMEUd9+4GEJ8dFoCw1S4uD+askbibPI/qtMfrYI/ymc9gy4cNaEmk/DvA?=
 =?us-ascii?Q?4z/1C2MSfKBSpfJ7hv3SVpjmpvU1FAYgOg+9of95anjQ95IM/4rhOBnXoDy0?=
 =?us-ascii?Q?VqHbc5aBt7CNgz9YmU9UjRqB7pqftYAXVdkWQGQQhGXJL50uqGBnQVjMxLvh?=
 =?us-ascii?Q?VkAI89bGZY+AV/X8eunZeVGwqCd7iTCFeG/1fY+3J9SvTxssxlWh0xH8QjOS?=
 =?us-ascii?Q?YzjjacyaTUxXHki1P5CxWTRNOo7HNxUG9O2IW8+MBD7fIOo+S2e/B+jcaLta?=
 =?us-ascii?Q?4V/4Ev8BmHHim4XhogUi6OcERyCcKZ/5J/3pZ773rTJDOHEDLepZYdVF0XSw?=
 =?us-ascii?Q?iajd/uNI9YA/6vMha57R40ArKK7ymGqk6SEb6/F0c2yNVFaGGNsHW0dgFO2u?=
 =?us-ascii?Q?lin7GjDEkkhDbc1iqPx6FURubGajHdi+xmqkKtR5hlvLbM83zZ9eVbP29lpg?=
 =?us-ascii?Q?5xdsIX+zOcyFXxCxG1LTYqz8JjOrA8otBny4N5rJKnEEqN4jQRA+2t741ygd?=
 =?us-ascii?Q?bVeLXNEuwanQEJ0NU8FIDEfK6nAIJgFiU8N9XmWeXfFNWnEbivS1pE1N5C0T?=
 =?us-ascii?Q?9N/buN/lFt9PFrfrit2Pc+drs3+qGOcdBphgsLGvSdwFVaFJRZ5Xm9HsKAHh?=
 =?us-ascii?Q?UyBBtlS8s7OkiOdkw35nr7aCZOHvhAMHor9CUjkCEbQnYa41mJx2j6R1qpGr?=
 =?us-ascii?Q?rmXhDtZRSjCe4rVri3U5GQ1PX/hqLVcwY2hWTnOP255fJEGsycwdGLeXoE5q?=
 =?us-ascii?Q?BR/6fAr5h1smEwe/EC0R74Z9ki3M5vnexJfUdY38K2Vjs8gMcHJWD7RcC1H9?=
 =?us-ascii?Q?DTTAv50na0hal4qh77Hl7RsRgkfsGkArBXv3XLqaEGrFxqavKs168jR5KNtd?=
 =?us-ascii?Q?IbAD5jn6WR6DPdj85i4UC+ruY4Vnm+iq+eEiCCpBlfpFbys6Hwbyh3qmoLpX?=
 =?us-ascii?Q?BXvZfwGhqiVjLujh4jyq01pY9YPAY4yZr6SsNDgIu3IwKGN16FAOqywcZ165?=
 =?us-ascii?Q?OfywhFsDx2g7cTUylTLdWXnuk+nVPObwBFcBqfCdyxTnDmC9qYZ1LUlcDHll?=
 =?us-ascii?Q?kfpMlf9RihNQW1HxMKciFs+EEj7vSu7/HiA90CcDvIo8UT+eHiDzkRbuDXCk?=
 =?us-ascii?Q?+LLr0vvvXJ28a5B4vbyU4FJ7Yqgmu3p398w099Ll06CGprHaBm+LTz/ggqws?=
 =?us-ascii?Q?liDd7qDTsifI1iZurSunh66JzbnzwmhLOl11KCgDPeEAKylcKKgIhMMfmSmQ?=
 =?us-ascii?Q?RMLSEArRF0vHa/Td4Uh4i9+RcZA1QpzIBznxT2b8jYqBLw1KaAk349zx94Ol?=
 =?us-ascii?Q?b1HI93a9XGFrP1ndj416qEjnUytxbTwU9Yt/RV1Cx238W1hOnUKLK1siXEko?=
 =?us-ascii?Q?V/CYbXHKpJZVre3bepvTht65e7UaHHLQbpzP0PiFEI1NLi/cBbo+nlXOlJVO?=
 =?us-ascii?Q?eOCP3ltDFJ/XaqwAYGJ24ZmYet2XWUWKSmAX8nszkmOfiS+4ZqmiUnLHjyKI?=
 =?us-ascii?Q?3SCc/DcM8Za2t4Jkf74cJmaGUqRbpFf6Ln4a1Ifhon8/caNB6T64jyqkpQLK?=
 =?us-ascii?Q?rlQ4J5wO0oIu7RPXt4+/hdQHL7+ClNveQcnJCWPDe29i/ZKCRNzT8cE9jkqI?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e108541-3fd9-4df9-46c6-08dd156f3466
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 20:55:52.4154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +KRrMeWY4rWoHnoPYReUtU9+R7iNs2TkRZITDHG0vLvcma5nN2vS6jmtM2LFAuT92B+QhzKPU+mt5upgOcz0YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4926
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

On Thu, Dec 05, 2024 at 01:36:49PM -0500, Michael J. Ruhl wrote:
> The callback structure should be static.
> 
> Add static attribute.
> 
> NOTE: the fixes tag in the drm-tip context

With this NOTE removed:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

(I will remove the NOTE while pushing it...)

> 
> Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412050418.8ecQxYXj-lkp@intel.com/
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 17ebc3ffb573..edaec262ed0a 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -180,7 +180,7 @@ static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t u
>  	return count;
>  }
>  
> -struct pmt_callbacks xe_pmt_cb = {
> +static struct pmt_callbacks xe_pmt_cb = {
>  	.read_telem = xe_pmt_telem_read,
>  };
>  
> -- 
> 2.44.0
> 

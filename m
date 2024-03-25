Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E321BC54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 17:09:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C03110E393;
	Mon, 25 Mar 2024 17:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9h/B4Yz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8598410E393
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 17:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711386544; x=1742922544;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=S6nsRRf9JHMi4GWpvTltfhQc+znctZN5iwSZ7+1CNB8=;
 b=I9h/B4YzZOVdntKQqK0pRYULqsAPJLA4ANMl77tvkKrroI/Yo1IwHKbS
 K1lffNeK3wKFG1/hhjuCQ/rbEmSjzfXLQPVuHKentb3zy5V0e3AwSemPd
 Gt1BVZvM1UGN2dSsjJGSsavf7HwhtOTgo0daPcjkLaj5uo+zwYZb7zfvC
 JWNCNqJ1AGTuCdnoYrZbJYAZUYLkLJ3cjvlqxGR9tQzr4GuIXcAbwJPyH
 WyxDKcIZa1KjKvEPor9sFhFBhfc7iAKwWYFbK74x7IG3EaKjuyLnTMWZM
 16g8ZM7o/t3sZDDnZ3oUA/pNwst+bCtJw5BbDVWPh3+2fFkb1BcmjaY4K A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="28882990"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="28882990"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 10:09:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20234427"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 10:09:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 10:09:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 10:09:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 10:09:01 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 10:08:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Seo51joPjl56TPQkBH9ocgXPS4Fq16uz9kWomXHfLy7SOIVyeB0DXqGFQ04cR2fd6nPr3F9Sbv1SmGQ8TfPUeWRLRRh4DOk/+RiEyI+b2/2U1wOBSBc0q1Kla1npqVbnhvyDXrzYJTPJHv2rIQ7tHYla1gIlyklr2a1LRrejRh3RkdYbYgZXquI2RtZHqV3I7t1zoYZMU+pa8MdIrzG4iYlw5AA/SHSVlhmr7owUpDq4NQ9zUurAxOkWhs0HsXuv85JgEh0LjSsgWa9Rj4EZfEVZC6XvJGNGIfbauUCIwoR3RbABqLa5UdAztwpRUkVBOs1xB3D9kpG93oGJcrEwPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntOC1/drh5k3RBE8agV1BqHQdyT7lyzk41lenQn02CY=;
 b=jlo3tFRKBo+e2UlIFc6AzHnashaNVFl1i+lNogDU4S6urio6TnazheM8WlhZlgR3PhtxEAKevD1fowRmCa4bHYGDM+5ZSIM1j6JrvpuWVyyMLiEoi3/olu7mSoTwuSj150qOkvxscf4filJFh/vxDzvM/TDHqxqLSCeA6bwVmOV22Zx9CHdLe7ZizzyB5idMVxMuAWPtL1BZjISxNEts+ynNFUfp21HA8K300Qqi9dUkQdfYpopCi/jj5ioOxY+fvq3ZXX8rAjoPnfPKe9zKWPf23GBdyGPJS+Dfjz47e+mKbqD2NZcYUIfPI6HW4XQGe3Dk6GAgAFKcylEfSyDNSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6090.namprd11.prod.outlook.com (2603:10b6:930:2e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.26; Mon, 25 Mar
 2024 17:08:58 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 17:08:58 +0000
Date: Mon, 25 Mar 2024 10:08:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4] drm/xe/xe_devcoredump: Check NULL before dereferencing
Message-ID: <20240325170855.GX718896@mdroper-desk1.amr.corp.intel.com>
References: <20240322172447.3372167-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240322172447.3372167-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6090:EE_
X-MS-Office365-Filtering-Correlation-Id: 113bc683-cea5-424c-5cb9-08dc4cee427c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dI0tkmovZtZ6oAPykR9TEpth9ot2khH0kH8eKWgZrNcwrsIGQlavho8y07TpGBIuRC+9P5t+w8TG8y8CRz5vwvcjAmkYiNfNJpD3EOzZosrLOQdfazS0eOHYPiOaiYykKUeOl/Ur2bFPbejOOaoFiVTst4pQb5vPLnKD+T2HvlmVCFhjBX2VDprE7Xz9HRihtmWhZXOP+S6SHHqN/h+/SxDVNHoAgaz0ZMUiyTDd3w4DSrHQHa1NSInCpL3Sjj6radfp9S9xxcK/UoBe3Pp412gUe9icaNR0mrxjihWxO4Dz1eScF9vVhI/o3MYX4CukPnQjdYj299bo5IkyEHCzzKigSg9GqCAGV2W0JltjfPf6wdrRmEH+SNAyFS/FoVw/ZptJL0J7JAYI0km+Hvcf1AYx+EMnYYoPGqBmwM2DGkpVl1yPh89t8+PClT/PoJtwZzwZK46t2glGV+3VyXRzTmdPYiM4reFJbA6umDNlrfrPViCufu8Him851C4lE8nweC1lE+VjmSmdy/iSFYaRvoTYD9sy/iaQp/wrGQ7wOR750jKQZ6PkJHmxntxWUVZD2PN65/BAg1FMa68kHaXog1W8NoAse31JwccnUuBClwC4amjWGvrwgyKGvlXynTNVQpkyPp8XCOw8itGQIpjAeDWjbtTfLxyaoPCwHplKQMA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4bPlnRgV4mOtacwAddgTQ3gzhXcMipKAkxBj5dIvIUHYVg1573SrOoyLw2?=
 =?iso-8859-1?Q?0zIp9agMYSrlz/irFQUwQDxs115ZcwMqz29w+8ZBNLntnGhYHhakK+/JkF?=
 =?iso-8859-1?Q?MNBnYdwSrLQ40ptpPk9Sh0S9UZvpRwlU6+sUHKjh9/uHmMl0vDAsd5+qe3?=
 =?iso-8859-1?Q?iMjUVFjzMpWRK9DOPIjwf1tmP8epfmioMH3AslF88chS3k4zF0dX0hTkPW?=
 =?iso-8859-1?Q?SEwWulmK7HwahZyrN69cikeBDk0NZYTb3c1SeLSsnAKcQG0nSN0mv+yrEF?=
 =?iso-8859-1?Q?6++yneCElR+LWVKXABAjf23RTyyt7T6Yr+tCcbm5z2FYkHhax3PTP0gL8a?=
 =?iso-8859-1?Q?NJlcGJYXSyJ2VGIKuuHlLcObbLKOT8GWnLiaRajs6EJeuNSYx4G0kcF+o7?=
 =?iso-8859-1?Q?3DNgM20PCUakK8hohdJcwAGcJj4GVesu1B3iS4pMyYNG3+eFYDHNmzeOja?=
 =?iso-8859-1?Q?1zPC0riscLKLDzO7rs9oTcI+uOleIHj0OoPuqsdI5j0Yf8zdNgQSP+KuOB?=
 =?iso-8859-1?Q?/tGwSVsDUrtQ1g/9agYNEh7ZzS+s0VwkNyPNpXEjiIFehdEqD9dIK6zwC4?=
 =?iso-8859-1?Q?jEyBaZMYxSCAfUQvJxv5b65fz+b721L96UDfH/R1CwwrDgDDe2KWfNx5+7?=
 =?iso-8859-1?Q?+AgEvVam3JNNVi7zLIR7Mx3jvOa0KgYvKbAFU+W4f3CLpm9Gqgp+4E7D0n?=
 =?iso-8859-1?Q?LLtB6bEut5xvKvt+1Sv76JNmEZgzc8R6BmKbmQtpZs0pj7OrnDcThqyKas?=
 =?iso-8859-1?Q?VoljsQns8qchoZY3mR5C2/DOPKDOdpQbj29qK3p2bH7yacd7eOeRrYR34z?=
 =?iso-8859-1?Q?kwckeSdLz7qihBS2oXtqrkqUcRPBlqLdilXsPqQkMynzEVycKoW2WtBi/b?=
 =?iso-8859-1?Q?5cKxIyYUMqX6DYMVlvWV076IRddd6nh/7VPxBIAuVHyPfCTcWK9qj8+3gJ?=
 =?iso-8859-1?Q?k9I6UNZ0Pdm9HoSnNCgDyfzPVz/dptBmlY4zJ9FphPghBVpblfNHrhlsAu?=
 =?iso-8859-1?Q?i0Iw4tg2JQXgQVo828uEulZDgaD2sWi2DqcAFfXQzNKwT90f1LfGNliJ0h?=
 =?iso-8859-1?Q?xTtwzDZ75SS0HtcirJBAQiqWIdeUWod78nPz7bK/li+DNZ3xRH5k6WLfKS?=
 =?iso-8859-1?Q?r51kZhwsNdbCXsLbY5e7RjGyOlgFWIo4/7KFQ/pZLenc8XZ1sv3VKQFkvJ?=
 =?iso-8859-1?Q?IoxAkO7mI8VVyqIOlBj22iYxHGLnKhDM5A9tPIe4U1eVFa3xSjsRMj57CB?=
 =?iso-8859-1?Q?JgPmam8WzvJ6nC9KPNfirP2hUmXJfuTY77VKZoSH/+OX2gL5W5Qeg845IM?=
 =?iso-8859-1?Q?A/gLFRYLdUCOIMI68dPxJIKoXofVkMFnt0NOOuilXtTqwTVVUtY1/k+R4x?=
 =?iso-8859-1?Q?jVtiVkR1Xcv0NWP7xqnLELzSqTVqilEXJ5xbC3g1PryvulhDXDP3g13Xgy?=
 =?iso-8859-1?Q?rGmIWyQ0wTW/clIgA8EMRQRL8aTsqvPte/qRIgPXWczof1G2xiKY+kWOfs?=
 =?iso-8859-1?Q?oQXbCW3VxV6RpnfnNmTUoOKnvZZKJEKEl8JjauywINDdiZMOvXL7kfldu5?=
 =?iso-8859-1?Q?qQx2GiVGdZp90lSjKn4dQy1OLXg/q7Iig3zgi+kp8cKBagw/Gzbl6E+IaO?=
 =?iso-8859-1?Q?Bl/FI11OChQoBBVJLQd/vgyx3EA+WsQCR35lx+iAcdvUtqikTt+lB/yA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 113bc683-cea5-424c-5cb9-08dc4cee427c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 17:08:58.2903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWaJYK4U/fZcJ6SurW+Qo+5DISCPkRZpJwTDTHvoEgK0snoVxP7R8SV/tySvyTG0+ESNx5bCE2Oz2eubww4Yf8tT4VGHxHuiTUfJghCR/do=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6090
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

On Fri, Mar 22, 2024 at 10:54:47PM +0530, Himal Prasad Ghimiray wrote:
> Dereference 'coredump' to access 'xe_devcoredump_snapshot' only if
> 'coredump' is not NULL,

There wasn't actually any NULL dereference here, right?
coredump_to_xe(coredump) is just container_of pointer math and doesn't
dereference the pointer.  Likewise, &coredump->snapshot is also fine for
NULL pointers.

The change looks fine as a general cleanup / future-proofing, the title
just seems misleading since it makes it sound like there was a bug being
fixed.


Matt

> 
> v2
> - Fix commit messages.
> 
> v3
> - Define variables before code.(Ashutosh/Jose)
> 
> v4
> - Drop return check for coredump_to_xe. (Jose/Rodrigo)
> 
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 3a6263ecff01..a951043b2943 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -77,17 +77,19 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  				   size_t count, void *data, size_t datalen)
>  {
>  	struct xe_devcoredump *coredump = data;
> -	struct xe_device *xe = coredump_to_xe(coredump);
> -	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
> +	struct xe_device *xe;
> +	struct xe_devcoredump_snapshot *ss;
>  	struct drm_printer p;
>  	struct drm_print_iterator iter;
>  	struct timespec64 ts;
>  	int i;
>  
> -	/* Our device is gone already... */
> -	if (!data || !coredump_to_xe(coredump))
> +	if (!coredump)
>  		return -ENODEV;
>  
> +	xe = coredump_to_xe(coredump);
> +	ss = &coredump->snapshot;
> +
>  	/* Ensure delayed work is captured before continuing */
>  	flush_work(&ss->work);
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EB8C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 13:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C026D10E6A0;
	Wed, 17 Jan 2024 13:59:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D60E10E6A0
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 13:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705499978; x=1737035978;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iB2Ymbqeu+FktMPycYX/nzZi6T1d3iY9fLr+Ax7vY1U=;
 b=BF0XP2ID7S4unbiGAUA4njRCNu3y2z77N29EhPVONjHA2wqlQEPlyIpQ
 iebF9mKNjRIvB1L8R4pX4nvyxR1pnB79gp5wCqEf3mO10XnWaASjoMPk3
 Puf8mK57Sb5Vv2U3AUY90QF2PVmgXvmt2ZEURTCGPHEXyyAJYyErnzsSg
 hVYwNUeQdvlDSrIzfAcGOlzTBfys9lGNCw59orfw0jjxYlZ5LATKTlWsQ
 jiRcLdKFC5nAemlZAiews81cLydxlsQk1CY0cAQdiN/vkT97cbbyV3b0f
 4ldfhITlQvYDP4+6fT3vqt6J5JPgZ50OPGyFWDg0U5hzP8uOyJNXxE3WM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="13526602"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="13526602"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 05:59:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="42776"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 05:59:38 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 05:59:37 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 05:59:37 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 05:59:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZsrF0gXB+NchaCZQCTjQBB9ymHvGMKCv7pvw2ZFx8+YLBlDcmRf7BVCO8OVGqZEb4nrM0ol9QtJst2caPYVcH2w3+iFtrcS1hLDJPTfySVa2njEVjzS7pXUfPPl3WfZrJRMJRPJ0M+cCgjHqNUijmX18y4eqrluY6EtwI7n3yUdkKJK+eJ6UT7SMC2g5+4tu5YjoXupOjtfZ3Sx2q7SEwYxSw9yyKhzpsU14mytJ3wl+JIv/pTc0INVTPOigmhUaPlMbs3ntUfFsSBRwAFgzxAK0OBDRoQo87ywcC7fqZ0JaHXHeHF07tcO93siTFNuYPdPQseeDY8RZL346L1mAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6eQpiO0tni6zBq+CCEvu1I/OCe24a8iA4CewiR3s0A=;
 b=Shwy2D+zkewB/DPq7sWdFVOFIFnaN72nFyhDyij+BA9YR+u7x53O7mUBfhL+vo4iuDfz7Ov8uRg6HpUhQlMrFLGsM6E3uuk+FCUOJ++NRnRlQaNPMyjbk302DBw+LniFuzINS6rVBxYiUKZ6HZJIYMxoJ9HhB9cFt4O5XLDHnL3y0hJdqckV77A3mmLtHNR61n+2VEXIh1yRZ4FZV2CZDUHt1THtNJc+sovYzObAj1TWKF+3wtbQik1ub8s8fOEPhwuSMbCLRc2E3j8SK7TaHCrKoILtEbcTZRxQyskLQ1Lbdjn8z7byL12SAolv0RV2D/pDhQhANuno2tpR68WdcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CY8PR11MB7361.namprd11.prod.outlook.com (2603:10b6:930:84::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Wed, 17 Jan
 2024 13:59:36 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37%7]) with mapi id 15.20.7181.019; Wed, 17 Jan 2024
 13:59:36 +0000
Date: Wed, 17 Jan 2024 14:59:29 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 5/5] drm/xe: Use a NULL pointer instead of 0.
Message-ID: <ZafdQTbd0XQFlsTo@fdugast-desk.home>
References: <20240117134048.165425-1-thomas.hellstrom@linux.intel.com>
 <20240117134048.165425-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240117134048.165425-6-thomas.hellstrom@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0307.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::12) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CY8PR11MB7361:EE_
X-MS-Office365-Filtering-Correlation-Id: a38e39e3-e167-47b3-0cee-08dc17648a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JriXCLbS8JKhwYhlSqi8G9Mqcy6TtN+r5cN7yXMUwSNUXXJS0xd1dYNDsgKze+jLlBVeJzZ6rB7M0HiFLkIufCdhKrywVYLg+mQf1bk3JfpI9YCMgOz9RU6w9ogHlpb0/Bkdsw0525Kge5GlmiVRp5AnX9vnxBoLmphtn36JVBkbCTWsNuSWEAr+4ah0ANNiPS8LJL9asHixT0zmiBIZzlOr0EUNi2cxXZ2G2pBWl4jT5Jk2y+BVXz4ydI4cEBvrreiZhAUY456pWXUeaEfRt5QTdRINeBnjFTRjNyxSD8wQRTM6/fKYVjqaHKlmJ/xkleNdu4UOLM1mQLP8v+kmagneYtfKC3CKL9dxacvb8tGxthtXVE89nib20wp4/e5cPeUQpQhpL4wrbJZvtn73Dbbqd/rbmKhNrqIhpDuCc9mVB8gK20JiljKa0lvJbJTKqlpxuvPYhSpPbqaDZG7hTWYqturqyO/6t+PLW9f5FQNg7LK5wJsbRpiQPJuSEJRsw+LSJMIMEd7VLEj/qzKTSTac6stZV4GaqAFgdnhiDP8MZZKgoUPPmiF7UrDUNSkJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(366004)(39860400002)(396003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(4326008)(44832011)(8936002)(5660300002)(4744005)(6916009)(316002)(66946007)(2906002)(66556008)(66476007)(6666004)(6512007)(6506007)(66574015)(6486002)(478600001)(8676002)(9686003)(83380400001)(26005)(36916002)(36756003)(41300700001)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?j6x04ATEYcXdxkYa2TPyRYzNdoy9bXxFMdFPEg+8FkGKbiAocsgm0wDfHf?=
 =?iso-8859-1?Q?IAt+zQxTgi2YUKSUGqp8J9vE4MVNdg8KEuMuf3Z8jiM/Lv/rzkSDPdsz9z?=
 =?iso-8859-1?Q?Yn08YFpLUuGF7c69wKgsRYSLa34RaW4yykPf0Ihz+ygD7ePjYFQkgsIIjr?=
 =?iso-8859-1?Q?jL+t11UpyxLTNq3NXoJGMNU1kxp2R60OVpv8E+eTIC/fULr9tTzJ3Za4i0?=
 =?iso-8859-1?Q?wmbFLOX/QkZNi84IhTbVWSlTHB96dWiVmir9+YuUqifKUgaYI+8LyTCNyC?=
 =?iso-8859-1?Q?vLzdlRXfs/kx+LLMe+ZK8axWaY7jGdgiH8T4wFs/2YxWkZvUsT7pgjl0Qs?=
 =?iso-8859-1?Q?GjWWIx0hadiclC4iuqrQgwar+eZ2wMYN2sdNia3EryZrZkNIymoLG5oUsl?=
 =?iso-8859-1?Q?5YzKrvEJ2yP5gHKVjF9sAl+p1auacA0SDupRA72G1+scf0+3l3+0LVs0Fj?=
 =?iso-8859-1?Q?1Krn6ebfOzpZ4ufKQeYaxqyntpPVCQT8zSPR8eNnIMbSgQUYzeicXn5UDa?=
 =?iso-8859-1?Q?H0ayRnc+c9Y6OYjoLkhPOWG9mELmOYzf93JSVZpmPYd+jyHcDXYWVI6ITJ?=
 =?iso-8859-1?Q?HesHVV7fUPrLaKxEW+QXMg/D8DNnU9pywLOfYYKVXNSMlCy6lamekE5y01?=
 =?iso-8859-1?Q?J5udlNAhhlYoMqw8jgWJj50jN08amtmFuo1Kh+qvdSp4N5NbPqW9jXn19z?=
 =?iso-8859-1?Q?iQTKWapbZeg+4hAbcD0BLxK4FqjY8BXgXpnbrDMPSPRJaLVsn25w+aYLQu?=
 =?iso-8859-1?Q?0JxuxyIya2Ut8L9hf4ErYZqQVnY9wMA9hwxQZjtuO11u3puUdDkHUqiH1s?=
 =?iso-8859-1?Q?llgpitPFZwu8Q0AslPSX2sTe91GgSGbdu4IcnMHic+DeFh9/1UeiHyzQZP?=
 =?iso-8859-1?Q?PUNSXFn7uBxS489uDiNx7ukV1EIoe16UbGzKGuaaiiuLXz6Mc2BEmV1Fn+?=
 =?iso-8859-1?Q?/vKNjhskGqix1JNPChwx5PBhrK469kiSeHAOqaK0pFb6vvsIMSZ0yChxPi?=
 =?iso-8859-1?Q?/FxxVYJgjedjELmXqVg3UGocgX4EktHHbOpPyhNnAGMZ8oP7x40hZ9TmGF?=
 =?iso-8859-1?Q?TUQbYYvnwSfoyNQFh/eJQdWGEKoQtEPoNjic0wFkviTxtsEqxPX8GMxJ0w?=
 =?iso-8859-1?Q?zxOXlYxd9Qw68/O4cggOeNwYpOyOwbsykOpUrHStL700rlRKGq9p7L28GF?=
 =?iso-8859-1?Q?3yyUkTiG7YV0oURVFQkhKQQTUzxeYri0g7GToTIUFEJHlWL73bnF7lZFjW?=
 =?iso-8859-1?Q?tM/Fzkq/mQE5fCPg8Mq0vzcyR/KMcWHSl+7cb41qMOciJGEK6tBrDKx0Iv?=
 =?iso-8859-1?Q?hefrQrgJUVApBmfJsKCJzKg6VChpETrvEQcfSMn0d9yd2gkjoQ1U74Nn4T?=
 =?iso-8859-1?Q?ph9Zn9Z+uX7skKbG0U7v22Tca9Qg4Vr9jgoAjVbJgi+BX/qBLG+Hw5mEjD?=
 =?iso-8859-1?Q?Hqs6PJJ92+jwyAQFDDbgTj3EcfUrnHsNOdXyUfbBAgDDyQB5iua/4EamWM?=
 =?iso-8859-1?Q?Ugbgk1oW7f3NOp6DCI5EYQUDw4VvWEKzM9IBhyQklYJ6N1epQbYd0yFylD?=
 =?iso-8859-1?Q?aBGxNepZTwKGIwbSO9jCJFrHrFqOD634SEAB+Ea5ehzky6G73pSqjAGBph?=
 =?iso-8859-1?Q?ZEWD/92i4KATSoP08L/laS1JzLLjNH7lTVhi0Q5nrF2zaaecskNCX6TQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a38e39e3-e167-47b3-0cee-08dc17648a15
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 13:59:36.1261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ZvvWvr3pLjvAJnsY7R/r1yEnOTQfYYxw79MdSD9raPeP4uGIMQgat6J/hMWxu/ouB3cWdQwZtnwdr3ZfugToCq962vrWDYbM+IYtSihRl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7361
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 17, 2024 at 02:40:48PM +0100, Thomas Hellström wrote:
> The last argument of xe_pcode_read() is a pointer. Use NULL instead of 0.
> 
> Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 6ef2aa1eae8b..174ed2185481 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -419,7 +419,7 @@ static int xe_hwmon_pcode_read_i1(struct xe_gt *gt, u32 *uval)
>  
>  	return xe_pcode_read(gt, PCODE_MBOX(PCODE_POWER_SETUP,
>  			     POWER_SETUP_SUBCOMMAND_READ_I1, 0),
> -			     uval, 0);
> +			     uval, NULL);
>  }
>  
>  static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
> -- 
> 2.43.0
> 

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499E8C83F3E
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 21:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B9F10E51A;
	Tue,  5 Sep 2023 21:09:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFD710E19D
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 21:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693948157; x=1725484157;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=g66rBycmniiCQEd4DGeW1Wkzl6rd76RdNzYzVTMyqpM=;
 b=ATXzierWz5NtR3AaJEyzIBEvKEo/jaIT7055gPDiiC10BC9LUmSDWuJ+
 OphZxkEohBPSHqYSCJAHOr+1/WD4iL1OniASZ6+pqI9Jpyg6X1RLDZJ/6
 pyErlSkVKG9xMoR3UvDRtCHxUNlc7WxNuAaG4Mky/SxUWjnFhVKp7lw49
 bfCwumkZ6GqIQlJF+4NTcUbHe4sWqJMVZz6uXJIfe/EdTO0FCxOE8uCAb
 pcXiYa3FOZPPyHChqWrdbS1QsrdReuc1jQUJaMRCcgAvDtRLD3xNSHkKd
 mhPv5i6FKFPaA8s5OlEP8OAZ8pYaR9DJJtkK0jwcAqpE1igumTZQH0zoT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="374293377"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; d="scan'208";a="374293377"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 14:08:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="915010445"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; d="scan'208";a="915010445"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2023 14:08:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 14:08:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 14:08:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 14:08:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9RzX9H/2vq3pIFUTxw7dHsp5jCuDPm2U5XKZvVr7/r8d14R0NcUzwZr0S4Viw+wqoqL9rc024JIurj4AljYSRKUWPQK3TdHx63cKTeeDkEm9lzpSOXnd5AzxbtgFo43Q4nAQcJFWLbVtfQPvfD4OEtejTojW7k6vtflAQPGTFI52DHKrtvu0IbuTfKj0DatrEcHpFlMh+3VZM0qjOsJSE3SqLKg2TPjyaVLQBi2iNG9HcGaZMOgppadI5gUSl+Wo+PYHNB7aFoaO7W12rfBKclLNToIyIz7nwgkuqZ//sg6V7OVXN7vukJI0i8iLZM/TS+bSjvWbwDpqtwRZo2xBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taGf2+QYioqfANNAoeJHOvPdemdE0M6v3CjnBBDq5Bk=;
 b=Ep5KKsYaKbqu7YpL10Fv9BgmKjjCYm7Dnkg5UWi66WKEIALcGuWzmJ+lXmIy/IrbHmn0YFFQSJlDJa9YaZBvyzVL2VYTGfLU5VW1uNK8g+ZPMRB+Px8Ycn6I/dW8PDDI6VfbosF2WNpp65siCF+vLPto5eaiBo22N/80N+bxEaYvSOJDQrECjxFrFqAekQHFSBBYrfBjj2o0bOqb9eC6bjw2ZFvDTizGXXiJdZ7aYF3vU6t9fQLoRJGcUR5/0QNDUp8eFMHrqckRF9gk7YO1ovfH4Gp6WU+eYbYnnhOtrvVYTFnpLCNn5uUCqfo5W92alTNDOeAqyqdv+SBglQFhzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 21:08:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 21:08:50 +0000
Date: Tue, 5 Sep 2023 17:08:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZPeY3vOAHuusDtZe@intel.com>
References: <20230905194942.7-1-francois.dugast@intel.com>
 <20230905194942.7-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230905194942.7-2-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0068.namprd03.prod.outlook.com
 (2603:10b6:a03:331::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c479e8c-38ea-4e6e-b80c-08dbae544d32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SPc0xVmO1LPlQz83Yh8jHylvUo1YIMJibIya/lihBXA8hHIB9PLdlQVqce1fqoV3+Pbd/WGizcaU8OKWR7PWx1jTap8uGtZ0Y8NLLnhEn8SBkDy3ptf+yTgIUm/KRcuPqvyM6qyu6//xmJ1aeV9WK9QMws7wex3xVRkZlTMn8V4QkggUP5eUFKhys7vZUAiakyFW6rZe3HGVCu1ZQh3ktb4zfvTCTrSEmixqC7uDBxHS8PXAFdw0C8hFfXRJevVshaKLV+Y0vSzZgAS2ozhPKDQV/ytElWRjmJsMS4asTV1zSAH+TWtg2LbNKrB6ZET4TnraEDY2liS0XOdzHD8LOS7K3qsHL8rqIGRa/CEH4a7P+tLVFRto0593xgTTxRz4W/DUKVLhSrzSrl0BWts04HhDicpNwTuQ48G05+gQRKHYOBpFbUxSgM/2+J3va+CzchCRfq4qPLUvl4VF69brCb54w1lyFsCHOV9t33qgyHXC3CoZcBzTxVe+XCapXwwgP4eEClNrr3jPHlX2feBsj/60KGVX3MV6UR5UF0YJCFqXDsj+9R1RoLzwUblGPlSM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(39860400002)(396003)(136003)(1800799009)(186009)(451199024)(36756003)(6666004)(6506007)(6486002)(26005)(2616005)(6512007)(37006003)(6636002)(66476007)(66556008)(66946007)(41300700001)(38100700002)(82960400001)(478600001)(316002)(83380400001)(2906002)(86362001)(44832011)(6862004)(5660300002)(8936002)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGpFMWJhcmozaXRHbFpBYndaTkU1RXRLL3FZTlR3RC9GZmtGNk93Yi9oaUpr?=
 =?utf-8?B?Yll6QUpEeG5KRzNTNEs5bEgvSDAyaDRIc0lUNVRPR1QvZ3JFUGRPZFZwK1hO?=
 =?utf-8?B?Tk5XTEZOVGJ0dWptajE3bDF2Nkt5Sk9xRWZNTWFnMTdvcHNISTNXc3U2eXJn?=
 =?utf-8?B?dGd5VkJLdmdnUjZTdmZvZ1J3L01Dc0xXODNGK05vR3lIeHpGNXRTTENBV1ZU?=
 =?utf-8?B?NEhzMzNjanFJVDFsRmFSTnZzQVhXcDh6aE9NbWhjZWcrSlo5K0hWdlp4ODds?=
 =?utf-8?B?MkUvN1dUaU95SGM5MFRyODdWMGFkeVVLVXpxSlprWXFkeFpJd3VoQndzWkhj?=
 =?utf-8?B?dmVOT013T1V5S21uS3VGdW5CWTJ0cFNhbTk2aHE5VGppOEdJZnhZVDlFTnJY?=
 =?utf-8?B?NVdTRDd2MUxucDBMQ041VjgvRi9oU1QyM05mUXowMUNtOUo3UUsxSzNycTd2?=
 =?utf-8?B?dTY4dUVKN3p6dTJaN0F0NVBCZVU1U0trQkFPQlhxN0JCcGNJMVRsaVFsNCs1?=
 =?utf-8?B?Mk9vWmlRd2xwYjRCeFdnVElleVl1Z3lwcnRwZXhqdUlrb2IxZGxDVnl2RUVx?=
 =?utf-8?B?QWxrRGdEZWVmVStPcjc4UGNzWGw3UTM5aEpUZzNTL2NFTmczRVVYRCtrSDNM?=
 =?utf-8?B?OU83a0QwUGR1N2RPSzVwYmlOTTFQYS9KQTBRSHV6KzhkbUtBRlpvMEJiVWlk?=
 =?utf-8?B?T0RaQUZ4dlp1NzlML3E4UUl1dVZpVHp6MUpGLzNRM1I1MWI5Rm0zRmZlSTZj?=
 =?utf-8?B?c29CWlhGc2NlWU9Gd0xnOFpRVDgzV0hWT1lLdll5N1ZmSWpUczQ4cjhVRWpl?=
 =?utf-8?B?WFl2eDBWQ05lRTVHOTFQOWduU1lONlNsRHFVYW9vWVQ5cGxtMmJ1d3krZUkr?=
 =?utf-8?B?WGZOOWFNbGxPbTlGamplSDZ3SFQxR3hZRWpaNmhpc2g1VDNHMGpKZFdQUGNG?=
 =?utf-8?B?MGhnbXdqUFJaNXU5cDQ0WE9NMVlOZ3ZXaWlxVTl4aFovNW1iUjRKR2lKVklj?=
 =?utf-8?B?c0FTZ1VGcVRPZVNvUm54SjVSeThSTzcvRHVidzdWV1ZRT1RzY29NWWw5aExn?=
 =?utf-8?B?M1MwVVJSblV3WGQxaGl1R2tJL0JGZGZhSmdlZlRZeGlrazVkRGlWdXRUanlW?=
 =?utf-8?B?MWptRHVINTA2Y0wrNml5ckFJWTlMWUx2Ty96ZTltblZpY2phZ2NKVy9CVExO?=
 =?utf-8?B?UjNUYmV6dDRPbUNEaHo0dmVtaFpBUG16LzErazd2ck0rTUVYeEwxc2JqdFY5?=
 =?utf-8?B?NEQ3NkNHS290RGh1QjE3aGZ6SGFpMUw4aFRBUCtReHhXS0QyUGEvdTBFT2Zw?=
 =?utf-8?B?RmdCcXhia0FKSFlhcU1RMnA3azRmd29NSU8zMW9SMXU5YXppNC9RK0RyRmJX?=
 =?utf-8?B?bHNNcVFLS2tOVDVVdXg4eTZMRDl0Myt4UHFGNnB3RzlIUVZHM2p0T3RxWDJm?=
 =?utf-8?B?c20ySldYaGRkUHBWZDdkcGEwbnFwd0RFOC9QT05tdS8rM3Ura0VCc0lWVUF4?=
 =?utf-8?B?UkRDZHlka0tyMm1jbTFwcHNXeVVDQUIrdUs3MklIOE5OOU5Sb2ZOaFZkN3Mx?=
 =?utf-8?B?ckRpaytpNjNGZCtPckRDdjZwZEFheDR5d2NpUFVNUXJwUmY1YmwvUnVUOUhs?=
 =?utf-8?B?ZFlMSWZZT0RJdG5zY1ZxWkszd3YwakxKdUVPQU9mSUFtUWkxL2NFdDNCVE9E?=
 =?utf-8?B?bTI5RkR2c2dxelFOUXk5YjF4c1l1S0luRWNHeHFHVjRuLzA3SFpmZVdVc1J5?=
 =?utf-8?B?ZGp5OW45VGRQYzVOSzhEN0hHdHlOd29VNHBZSlFBc1FHVVU1Tm5aRlJiL2Mr?=
 =?utf-8?B?VVlDeTRycjgyNjVTN0dmVmVKT2tydjhqVHRQNmJoVlNycVNZdXFJM3RQaW9r?=
 =?utf-8?B?YWZnV2U5K0RIK3dVaHRRUzc0djBQNUZDSURJMUh0eHRVT2oyZkt2Z1dmYUc2?=
 =?utf-8?B?anN5VHE2TFJqaHZFbXJITjZjVmJRTkdtbVQrUEZrNlY1Q1lDRGVZU1NYeExD?=
 =?utf-8?B?SDVjV3h6bi9Nc0RZSllMdFhlV3UxbTFmVldHdU1yMGIwanBGL3d4WTd5WXlt?=
 =?utf-8?B?cWt6MU9UUEFGdDA4VEl3ZEtoNm8vZGZlczEyYTM0ZFBPTXJ1Ui9RVHNlbGxt?=
 =?utf-8?B?M1ZKUzg0ZGdJanMvMnAxNEtwa21DYnlWOFFFWEc5L0lEMllUQ2RQN2NTZTZZ?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c479e8c-38ea-4e6e-b80c-08dbae544d32
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 21:08:50.2017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RvhpmUQwT4cydfE9LOn7b0FaOZn3IkMpuiaEOabMcKuHBQuVVbvym8yP9NK5zwb5dZXnSOZy5wuYV3BMKxkMdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5830
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe/display: Use
 acpi_target_system_state only if ACPI_SLEEP is enabled
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 05, 2023 at 07:49:42PM +0000, Francois Dugast wrote:
> This fixes the build error below with CONFIG_ACPI_SLEEP=n:
> 
> 	drivers/gpu/drm/xe/xe_display.c:334:23: error: implicit declaration of function ‘acpi_target_system_state’; did you mean ‘acpi_get_system_info’? [-Werror=implicit-function-declaration]
> 	  334 |         bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_display.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index b6b547c4877c..a453946ad108 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -329,9 +329,18 @@ static void intel_suspend_encoders(struct xe_device *xe)
>  	drm_modeset_unlock_all(dev);
>  }
>  
> +static bool suspend_to_idle(void)
> +{
> +#if IS_ENABLED(CONFIG_ACPI_SLEEP)
> +	if (acpi_target_system_state() < ACPI_STATE_S3)
> +		return true;
> +#endif
> +	return false;
> +}
> +
>  void xe_display_pm_suspend(struct xe_device *xe)
>  {
> -	bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;
> +	bool s2idle = suspend_to_idle();
>  	if (!xe->info.enable_display)
>  		return;
>  
> @@ -360,7 +369,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
>  
>  void xe_display_pm_suspend_late(struct xe_device *xe)
>  {
> -	bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;
> +	bool s2idle = suspend_to_idle();
>  	if (!xe->info.enable_display)
>  		return;
>  
> -- 
> 2.34.1
> 

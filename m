Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FDEC04FF8
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 20:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6FD10E021;
	Wed, 20 Sep 2023 20:03:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E79C10E021
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 20:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695240184; x=1726776184;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rrSPHfJX79W8yNGDu+aJNBmstOaVw8WiCTOZMppSaZk=;
 b=T50nw2KSK1BSLrkcT7CXrHHqxk2Zp2LekH66IDmQZZENx0dAUewSQJhS
 X+9zXekRlGwlb9ka0NYfqUHkWE/VRByrKRjqGz6qi8jo2kQubj/5mi1II
 qJqbf6YH4UMZP57Oa5rEKi6Rx7PsqCz1haPebFltZzdI0YD9yo7rA2SND
 KVzqDf0wcWUh22WB+AmGsj7PnpBWpvXTvQwW7EW5nEiUjI8uqP8m79S7Z
 UlK6Kp3yp7LSuGsV8dXXD0EiueK15PsCannA7N9P7OzUv1vi8vhCG7AnF
 CCCs6rJVS+dWRM/Ssfv4+bXaXO2s4L8MVb0SfZgf/4hj7qdb7VVTfosH/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="365392155"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="365392155"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 13:02:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870508814"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="870508814"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 13:02:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 13:02:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 13:02:47 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 13:02:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aa0bPwBhSrfrjvfnz1VC0+zjZY2BesMH1Vceucj2nKS4ytbQs0mC1f/xQqIuMTgQaGjmQuWLvX3f/SrHnvBBIZv3S1CDb8aoWIOxQRBRMLQSR+nt7RzOCQS3qTk11bdN7iOZYBnL9U5ZbFy77ND+fNCqvUAAR4IJWt2KbJlIkDOSPeMzaYYkpYXOtFxMKuQJLxtN7MXmhIbREU5cZBnuunX9pVLmjt+UHDFXW2eQ/FBG8URm3WXROaQClQBp2bTwXQNTIaxVwF58GTZ5M5N6/tqpVC/MvMp+umyJax8GrCSxa7C7l3SQXjhBBW0HSBR7fjdIcjwt0VedYB5vuf2wqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiPs2rNl4SKx8YGQpQEDaOsrAfCGZBWLfRWlIJvjq20=;
 b=C09R+hqJhERL0mNRjYOl9tkQym9UbejVsodKq7g8Z/tNh5hek8RGa8BQ/qPe1sqpQtGFXSnt1W78fyhnMwx1lld0IpEvPdkcmx+34FJjosXEVMKwPRMcj6ND59/oCkd9gjfdR3lttMUDzHq/Z1k8iumxeJ5l9u31I2yEv5FKyOP3yoYfb2c7FOqZJ7Z6cikrg+WH0xU/QPg6CsfkwgayDey0ydceZJF9VLLlWA+S9Rv8qNesOR0eNK7dmDLW0XW6eA2oDtTFKtYEw3qHq8Mjh8IxJ8kI/Hj1ZH33Du1ZeOx2ThXIo+54JkHtTkVEeha5M3F1ixB1aMInxn4pXdHERw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6234.namprd11.prod.outlook.com (2603:10b6:930:25::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 20:02:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 20:02:45 +0000
Date: Wed, 20 Sep 2023 16:02:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Message-ID: <ZQtP4YvzBrK5osx/@intel.com>
References: <20230918070100.1387082-1-jouni.hogander@intel.com>
 <20230918070100.1387082-4-jouni.hogander@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230918070100.1387082-4-jouni.hogander@intel.com>
X-ClientProxiedBy: BYAPR08CA0007.namprd08.prod.outlook.com
 (2603:10b6:a03:100::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6234:EE_
X-MS-Office365-Filtering-Correlation-Id: fcae91a0-c140-4d5b-675e-08dbba148e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9VWv4v1TGMgd2zKG1RZgtj+cn6bKTMI5t0AuvFcRpJZBBn4sf55ANZ3+7twKlxMKZuna7pTYAOlEbjF4FtTrC9Qynt9EtGoGjd4GNr7pnkI3lrDYOmg/tzO4H1zs9i5dkgQpH13hDHmemW1nRP0mC1irfyy/DL2IiPEiIvbJFdoyB/MOKJGrYcxcEkOavdaAnJk8ARoI4SMsxvsaFhJ7ki4TTCR+rlxohIHoeXzullY3n0RwZeEiVrK3dOw08ES58HsrwPTWAvt4hVgAH0sElqBl15M65amm/9ul0RBDL3LoRRhU2iCu37fmOE1ugdrYUfEaf2xVyMzVdc9OwoQR/HeYmoTa+tF06XxWCuqsCJORc9gjpha48Kf/ggWL8dhNAX9Q8Z8dGd1WUI3xnd0KzfbkSQIGlVIM0XR/IThkRM2Aw33qrk6AlDuIwKyY3R9gm+HGoj6W0zrqPVY5AkPYl+ZGwri4J9uaNCYRivOv2JvtLchTuwPiwZ1XYq1MACz02au71eTCEhOsupvZopodqR3ggaOcXgi82rNOcwrGFrBGJR5GnEf675gp4JwSCVLU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(136003)(396003)(39860400002)(1800799009)(186009)(451199024)(6506007)(6486002)(6666004)(478600001)(6512007)(83380400001)(5660300002)(26005)(4326008)(2906002)(2616005)(66574015)(44832011)(316002)(66476007)(37006003)(8676002)(6636002)(66556008)(66946007)(8936002)(6862004)(41300700001)(82960400001)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NMvaMBmkCX80GsZ93n+cmr3ItJB+96sRrAHtlMKZFGCi4LjAIIKjyiT+Bi?=
 =?iso-8859-1?Q?z210JMpTDrxPDakFKA4ZrtfZL/G1qXBpK4AgC+HwF2DrC5C+2jVc9XzuPc?=
 =?iso-8859-1?Q?Gyd6SMsBhV+Cf4ZeTOX7uvYO5wM0wDpI2k2mzabvLuGrtFuFT+zAQRF2kY?=
 =?iso-8859-1?Q?SK/gdshzXPNBUMX8Ke4DgjPzr/WN91GJKCSMuht8P68pORlYoxDf7E/+CT?=
 =?iso-8859-1?Q?MAwNDfwqxHbsgrZ4JLJXFS1/FRQameCyiJhYGMQHctSy3hQXuYUKdpUqGP?=
 =?iso-8859-1?Q?V9sbsx9i1vHgmrut2EptPf4ZfZuQ1xX4MMj5/DRfSIWk/bap9TicZG2Lxf?=
 =?iso-8859-1?Q?7ndhc12oZyd4ljUP/LFG9xKHktQ6Z9yOWA9jtQ40TnBPUU5r12e63CvhMC?=
 =?iso-8859-1?Q?USQBd7mSn+zVnp7gwpJG9SRdtkSHMxHbtL4KrfQBzLk4jBF7LlY1BzcnPM?=
 =?iso-8859-1?Q?VDNpr/6X0Fr9jpAuSlX+iQfoBDdWCCg98vBNK5Xk2fskA1m713WbDRPskx?=
 =?iso-8859-1?Q?FLj1S5/r2KsnLGM1XZ1j0124kadhu0jKEJbvmcC4IDj9XiVCqHHUsGPPWy?=
 =?iso-8859-1?Q?KhUmQee4B15cyutHWFdfFLeN4zsdeSfLKGrxVqLQ4oadtxrP8iUJIqCRev?=
 =?iso-8859-1?Q?A/YQnitXViNyIIwOzva5UEpkf99gGOGDORTBryo8lHwSbfFG65ROQ1+QpR?=
 =?iso-8859-1?Q?tX6rIojG1Zd7dV5AT+lcmtJi8Ua1QUUPe/O9az6JMry8LucP4U7XT7vHWl?=
 =?iso-8859-1?Q?HMCR7kmtvQDIF9LHhguL5ddNjhqU1y5koTgF6/hoBaqV0lTKsY1DqWKO2S?=
 =?iso-8859-1?Q?/2S7x5UF53q80eLkjqwdj4VwQdiJOst631wnDgq8wF6UbW0c5uA0eaBMFt?=
 =?iso-8859-1?Q?Jxx2q3+u0S4M8JmuGAjqOC/T4otwqa7TpdipudHJpCm/8gZ4pgfXUIL/hG?=
 =?iso-8859-1?Q?4eUYikjoY5+7bml4dHEOR/mrE4C3OM2JB+P3qBjmw4jxktT8WGx12I8Y2e?=
 =?iso-8859-1?Q?/ijlIYjZ0TiLLUTGodRvqeo9qH/lfiQlgKU1F5AkvKKJWEZteZcmzu1Lbp?=
 =?iso-8859-1?Q?2sPTv82rVpjayFylr05wd2zgpe5ZIqLeLxnrLkUCKBnSrfBjQmfqMvTotK?=
 =?iso-8859-1?Q?G/+c5QfDhXzjhWkOOJnZx495GAX6A8BJrUSdJ+/bTf12Z5YPgkt1ux9H/L?=
 =?iso-8859-1?Q?iWU7HtmmISLt5iDLFXnnf+Pw9mvgSBS4usTX4p3rn3pDgKDPBXaD3saJu7?=
 =?iso-8859-1?Q?QC+8VWSCNvi7sueE0x3QH5WC3Y25PiZvn+AdCtNIZAJtlLnP4IL+eBMU4O?=
 =?iso-8859-1?Q?aSTO2zbURhJMoevHqQ4jnx+qhqHzPfZDpO49jZAFhjbx31oUzZcUF6Krvr?=
 =?iso-8859-1?Q?tVIIxlS8vzpDBgNahfLV2VzhoI/eoHfMPsZLkpm/LnE0btXae1X1wHNTJp?=
 =?iso-8859-1?Q?81z8eiatA2NDd5sDWP1GwWOXtqCU7ZEsyT7HcBbDUZkm9Qb7fMuUB0GMUp?=
 =?iso-8859-1?Q?ByNtm0y6THvYuN0L3jnBfJ0lj6Z6GyTZzE8ssOZscgXcUpvvmG9sqS2Pxf?=
 =?iso-8859-1?Q?1sk05ZXyMa2B3SotGgu1CP0yhRzLnvjXBckxB17sJWBYEzzr6Rn+/CwaDW?=
 =?iso-8859-1?Q?B0+PBPcs+tndpfNo396MzmFAfrGS3gQo5SA1OMqr3l2B24ocAKzktOzw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcae91a0-c140-4d5b-675e-08dbba148e4e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 20:02:45.6118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 367iOxgsONtqp6y54M+YaVcluZI5m1hipY6NDiVz1waem7tyr8MrYG47/fPq9ih8qpIlEJxsAMQMIuWxc6MrIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6234
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] fixup! drm/xe: Introduce a new DRM
 driver for Intel GPUs
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

On Mon, Sep 18, 2023 at 10:00:59AM +0300, Jouni Högander wrote:
> intel_runtime_pm is ok for Xe driver as well. Especially as this
> whole struct is here just to kill some build problems.

I'm not sure if I like this. git grep intel_runtime_pm and you will
understand.

But also you made me thing now... we should probably simply remove
this line from this original patch. And then only introduce back
on the display patch.

And in anyway I'd prefer some define in the compat-headers,
rather then in here.

> 
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index a82f28c6a3a0..ae18097cf8ea 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -402,7 +402,7 @@ struct xe_device {
>  	u32 edram_size_mb;
>  
>  	/* To shut up runtime pm macros.. */
> -	struct xe_runtime_pm {} runtime_pm;
> +	struct intel_runtime_pm {} runtime_pm;
>  
>  	/* For pcode */
>  	struct mutex sb_lock;
> -- 
> 2.34.1
> 

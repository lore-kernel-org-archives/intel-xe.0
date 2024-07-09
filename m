Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DC4C3DA41
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 14:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C0310E099;
	Tue,  9 Jul 2024 14:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axvEvTiK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A191510E099
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 14:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720535780; x=1752071780;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I6QBLWQ4PSXvvz2Yj072BtqVjwoLqQGco8sJlPNG+54=;
 b=axvEvTiK9+R/OwKE5sSvqvGznqwqaGJSRg4jyyG5/c+D/F6KfnKjp2Ma
 UTidCEqC/dk8qyECy5CUIhAMflvMGCf8KVi1YdiIM6X6P42mUsmQBXG71
 ImeixoNAKQRF2l/dDgxSuC1vOwU9R3qm9AcyS/u7/jBUPHNED8+1iP+fP
 rLWDSa1GDeqeWsAJvYtCUJxaDcTe2ziHGKfBnjfYZ0qlr1x11G4gl5Imv
 vCZREFcz9bKhKFqevlqwv2LCTP+72Z/eNPbyFO8r3g6ZCMY1EKm6bODIm
 LHWVBgsXDIwaRWnjePxKIKfCxLxYyU4WVVR3I2uvKy28g8MEZtaXPUKKi g==;
X-CSE-ConnectionGUID: B8fvE/QmQha5LEbdr3Jtdg==
X-CSE-MsgGUID: PCkg9xCTQpSCm3yDlME4mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="35332239"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="35332239"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 07:36:20 -0700
X-CSE-ConnectionGUID: kpajri0lSnaNaCBgmfq+ug==
X-CSE-MsgGUID: LPF2a55kSgWSJaOMnqwr2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="52273046"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 07:36:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 07:36:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 07:36:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 07:36:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 07:36:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cpsiv3pzwmwR1f3R1dHsW3W5885Q9QRZPL1QmLDQY45wl2400AbcrcfbPzOoRPywKYw2X2SOOM/gLnOab6iiPCTjPa6tqyPUR7iD5JGkbC5FLi9oTkyiosM2of6vST5zuuFa4AmFQ24qXB2pf6PYnsYf72cCsvIoVMrBOKFDCcllVjBDQQP2ObyCy6iytk5AV6FZc7gfUbUq0edlEhngs1uQ2P7tWjDaShdUAZ8TwD4FLXySrAxy816TfrLH39mcQqwMhnp42ehf1kP7Xd+DtxSu7r06s2f8NliA5BExUABaEuld/ZE9poisRCqZxqOjzjeBfVLD/Xk9F59OT7yBIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBah7S/IzZXkzPVkx6D+UO3+FbNVK47Ci1AjZGgj6w8=;
 b=kWzsXBTJCdbPZ4Xpn/DoRJ4ejDwjymTNISAOFZJphlmwQBGHY/34voyT2Gt67jVIdPmDy/NeMsW0zOBM26EMEQ1YRfaJVSbOZ5ykb8/Pc9KDW2KYsziLikJqhAfb1enXvOH1eLblZb8s9X/qZx7JKTxqUFbuj04j421ruIn8YONBniVtHdZ/Zn5f1OHf4sHzG2MTl0FgprZWz7TrnNPbZPKtSsUrXy0QPCKzQOwlyXePkhLaKHotUlzNA2pHE42qvivGkxGT/cIO+L3x8FfTNS+K2IxWD0SzDlMqiZhhibQIbgUQ+vPsooQtmxufuj/4nwN9DUMtVoFTFpv3optJBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6561.namprd11.prod.outlook.com (2603:10b6:510:1c0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Tue, 9 Jul
 2024 14:36:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 14:36:15 +0000
Date: Tue, 9 Jul 2024 09:36:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/kunit: Drop XE_TEST_EXPORT
Message-ID: <i6swrwmqdnylutafm3h3dujnjdnlr2n3zsavajr7n4if5wbne5@diaohlvf3t23>
References: <20240705191057.1110-1-michal.wajdeczko@intel.com>
 <20240705191057.1110-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240705191057.1110-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0334.namprd03.prod.outlook.com
 (2603:10b6:303:dc::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: 95320e63-853c-4c60-2e98-08dca0247cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KMFk6wL+UBPGoC4l08+FL1gUmmEsOTa1UT7+I/fcBq1225ZCSgm7h6bSboMr?=
 =?us-ascii?Q?5jxVVw3mVZnlkTeZU/rSJw5Fdt/qSlF8WbUKnYf4ND8rieiCnzLNQ8kMlCRu?=
 =?us-ascii?Q?0ufWZmNWts00tnMxxho+dh27zHWUV0vezUS7bdr8HZxVB5Nn10nNPJ16maNh?=
 =?us-ascii?Q?rze+APSDJDwPuyh+h/G371P6tH2DZDa9HjIvedXJPtzqrenZAcVIZd1fXbmQ?=
 =?us-ascii?Q?2RMMyjDqD/W6BxCUk7yXEWH6vC5ARfdGpXw8fvV6v+4x3sXCjlz3EjG/WchC?=
 =?us-ascii?Q?okSaNHniUGSnVIsKm1PkBnO1Ryyc+w+14uq7aMC1eqA/9g4mK61iAPC1frYY?=
 =?us-ascii?Q?cTjYNHL4ukmXoOr0+HFE/j+MFmi9QLSUEhK/z8RJXfwI6BWsZyWobyyV3eAF?=
 =?us-ascii?Q?HBnmRPvZvRtPGnZTIPtJ1eS9Yrljqc3IY4MPb4cL4N+26zhOGH+Z9V00MjTd?=
 =?us-ascii?Q?Jng+qyxxlI8DWn+oMIMNSjMMLkg6wJu+Tyt3Onu3tLQgNFThOvrf0QhGoB5b?=
 =?us-ascii?Q?6ScrL7/mE6C8yGwt/IZS+lG8FN6dQd7FiEsYLPdL1zAVA2B1/oWVtx1UAhT+?=
 =?us-ascii?Q?uMzIxeDujrMpRckw7TPwqXBAbYJNjj2p8OrKavsea8UMHeaoLgTyYkOO9MQM?=
 =?us-ascii?Q?89O7kECLItSwNXtEKi0hkqV7G+DcnOFUJpT7SlyIpHUhq+ow9QNldgvL2c6U?=
 =?us-ascii?Q?n5GKbT4y7sCQKdzjC+yLY8MQWZoT+KwYPO9kM9jjS9aZAN+uy+DH6S8Ma7Z2?=
 =?us-ascii?Q?76e1ADk08kAm/HlW+L0H+DQjRVWOHkTDrmWM1/xLWc90RlQ7bYL+MCFVM3sc?=
 =?us-ascii?Q?vjTztmucwS24ZOkFCwNkP+a8n7lEX259LFbxMYyiFmlDQB+l/mp3+LW5k073?=
 =?us-ascii?Q?19Q6GM1NVppTnQz8Txd2fDPp5jqoWAcka9PCMGdLzzFij2F3AtsAu6hLl3xC?=
 =?us-ascii?Q?RRhoTuf3ghwaC6jwNWpXnf1bl6Oo5Sd4XzazO/N0DLkCNdVuZdX0Y8JsqZ8x?=
 =?us-ascii?Q?QVe/joboNllopzCDKElBJeKg5eadKKs2pYtFhbzDsgVUP22BHYAxkwlQHwr8?=
 =?us-ascii?Q?3QRhwkePMLj8ZSwYAVVYPDQZ6hF8x9t9bVwahSpq4CBjXrhvH811jawl/uCs?=
 =?us-ascii?Q?5al6vBssEGexYDOs7lBhqrDG8RJrBPkNQryuH07muDs+qHubq+lup/jhPwq+?=
 =?us-ascii?Q?LD3jgjouHY8nU9+pdTvBTS+elSZVjeUnfhMraYVZKt5deglUI295459xJ9pl?=
 =?us-ascii?Q?YCpMAbgFLYwFQQxzAFMPYwHki42SPqAepjuk13gsur9Ya39smCPUINHgpANk?=
 =?us-ascii?Q?q6x+51Q31ycSWQSiprNCp9z+/BxgJvGBlWoTUxMYrpFkRg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Uq4t7nju8fseIwQEJtp+MpxLfG/GDI2ZYIhP3e6WBEctRIsqk3z6r/5gDnOe?=
 =?us-ascii?Q?78e2qad5Dyeh6TSJJmmDnFLOHQFUOyFi8Ps/P3QK1FDM61Amfo25Liu1bgOx?=
 =?us-ascii?Q?sdBb8jP70OBZGo+WjYInyBPtVfFVII7DDcZ4nKynDKJT7O4oMTfcHGUu46/7?=
 =?us-ascii?Q?Ipi10hWx0LAA2W3pjULruOmDDIYeQXXQeZh9kZIhSs5eWPqVKL3ek3eH9jlo?=
 =?us-ascii?Q?gNVng4jWLY6OsXTWHL6qjbYLStXO4s0fjgVK9vjWPs3u/ToSWDa/KK3ed2uQ?=
 =?us-ascii?Q?LbisNubBkOnnIdgNb3L/ajr4dc98Q0nJplR74uqk7o9trtBwd98WK/MJ3sEP?=
 =?us-ascii?Q?47WUWOT+OqCw7DjNCkmQrGDmnFlXJ6uUODE7bkbQotbzz1pdPJCQK2w3oOed?=
 =?us-ascii?Q?+yXB4vDbcRrCIA+3lbmUJH/1ap3Nj9hJbwcAQUY0gloX+JqAqxOIuMChfslm?=
 =?us-ascii?Q?rNUD0OX3qUQt4YlkTLcG8bhoCY61IC1IWfAL4VzE7vX/66F7BUKgn+XkcpbH?=
 =?us-ascii?Q?epl9iKmPKGSbG8J3BTuM4QiGeDJQVx3jjU5RoDuz+7CcJvTtYOTMrMfHTKEV?=
 =?us-ascii?Q?/BeQKgmU2qSFQAPFe01A+7pyefXPZZemGmCV1i+Sj4HiYWzMB09nvg1gengM?=
 =?us-ascii?Q?KV4VFLNHDzMZG6SgLA1RYDDYmCAdVa6c5NAIBWr+p48rt+Cp+MJpDRTNASml?=
 =?us-ascii?Q?fSEpUKUEJJlgen0ElRqmF3Q0pGuHE8cTjc1DLoXvC/o6G2lZi8DcFHPkUgob?=
 =?us-ascii?Q?bYIZ4ZUMugtKSpbn22nL3R/8PoNrL2vTh7RFRq4aq5hbwHxNEPzlaEM6MnBt?=
 =?us-ascii?Q?4RHPaFb8D9yTHMBLW2qXbRNqEnnUkrTTOFSCc8hTKbJDOrKQrpsUfkX57ZxC?=
 =?us-ascii?Q?xs/zUPTykZa6SjRbGearvON11YUU9D1gOzFj5pvRgWj0HbLhQuNjJDQu2B78?=
 =?us-ascii?Q?fLmCspuB/nqZWjUVvWMVwP+WX5SZquWk+FUTYR9mY9MjzxhO0E8bGwDhO2EH?=
 =?us-ascii?Q?zdMPga2HgwAe9NxImi3xU5ARTyhqg8SJGjGqDiePcoEsuA490C7G3+LecaO/?=
 =?us-ascii?Q?yfNL8FmMzdCnTEFLofw47t6eYVVhj+k+3DwmZ6ME9Wk6RlmwHvrDsM4h0s27?=
 =?us-ascii?Q?17cG0gXrSOgVo58EGCWl/1ueJTzfseVzG3wAVilDY9x5plhJUfbuiUisnCrg?=
 =?us-ascii?Q?Uru7/8G8XD7aTQTlhk2dcjGCNsD9IWV1jGmSSuBAGK5zaaReA/8WqvGg+Nb+?=
 =?us-ascii?Q?eBFmdxnCYG1XbbtPEBrwKmW9ZwUlGqsceKb/ezE6o4qS4b3DT4i6c+DIhPvS?=
 =?us-ascii?Q?xy5PzkPBlJ6yk9+LVxsJDHhqxNAvZXAldp3lsIufzSB8u6Iyn6Sy+clAetQw?=
 =?us-ascii?Q?FtSOuXUBU3uRW2VQuTPy92mmGHN8VVKdL/YpYJH/eluCiWxtkB1BAFRGhj7A?=
 =?us-ascii?Q?umzA9LfMit2jnCEEwcPLE68dJL/N26KEWoouPkMWUCGypizZ1uzbkeVGnEv3?=
 =?us-ascii?Q?s+0cjTvz6seyB1FBJCB3j05CLjtzK2K0J4njoJKPaq1LQMpK6TAYyfPCO2ha?=
 =?us-ascii?Q?1OGyQHBDPloN4b0+uuPiyt+7vZs5aatx9vt9LcOB1DO44rd/ME2ooXGOLhRl?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95320e63-853c-4c60-2e98-08dca0247cae
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 14:36:15.2611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/wMoMbX8mg/7ryX+tWaAhtBv5jUqP4FtbrSdIPAgBUVnQ/Dw5Io8tvvRQkP47ulReLkgDfnAMSb87twzjPLdkLWVoKQGnXCYeECUC2Hdqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6561
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

On Fri, Jul 05, 2024 at 09:10:57PM GMT, Michal Wajdeczko wrote:
>It's unused and can be replaced with VISIBLE_IF_KUNIT if needed.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/tests/xe_test.h | 2 --
> 1 file changed, 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_test.h b/drivers/gpu/drm/xe/tests/xe_test.h
>index 55e5b5bedccc..9c23ad9dba8d 100644
>--- a/drivers/gpu/drm/xe/tests/xe_test.h
>+++ b/drivers/gpu/drm/xe/tests/xe_test.h
>@@ -31,7 +31,6 @@ struct xe_test_priv {
>
> #define XE_TEST_DECLARE(x) x
> #define XE_TEST_ONLY(x) unlikely(x)
>-#define XE_TEST_EXPORT
>
> /**
>  * xe_cur_kunit_priv - Obtain the struct xe_test_priv pointed to by
>@@ -58,7 +57,6 @@ xe_cur_kunit_priv(enum xe_test_priv_id id)
>
> #define XE_TEST_DECLARE(x)
> #define XE_TEST_ONLY(x) 0
>-#define XE_TEST_EXPORT static
> #define xe_cur_kunit_priv(_id) NULL
>
> #endif
>-- 
>2.43.0
>

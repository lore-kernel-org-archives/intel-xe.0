Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95E9C001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 19:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9394310E4A9;
	Wed, 26 Jul 2023 19:25:35 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9CE10E4AC
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 19:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690399532; x=1721935532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mpRaVMEX/tuKK7B0k/G+ZkiaI9PwpFOVI7FdrIs5H9U=;
 b=L3CM93v4EwIv9trP9gKXqJ93SL/tWRPkzs3McO7+XsBnuturai9yUWfg
 3lMLlV7HJwogNkZIJIyd2+7LtFzmYnVy5BseT/XdPVMp85TJAmRpbw1td
 eNhm/TrKr+QSsTtWmF2ranEmyVAlzuNm41bnSUBC2LmdwWa5iESPUDzhY
 IdF/CAOaxFYZDCVZsGWFAqTEzijZgCM7cBhiT4v7f+jN8oM58TCpbBdNO
 CA1sx+oMSd9h38aLh9s4ydfqcg9qu82MbuJXJPXH4unZUYmTiof7Cd4/2
 AFeAc//Ny0h6p1v8B21OBom6J0uKUPNprUmmf2ly9CuAKhJah79iF+gN0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="370787543"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="370787543"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 12:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="816815720"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="816815720"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2023 12:25:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 12:25:31 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 12:25:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 12:25:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 12:25:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8vzzjYaL+IOyISRbjcIFvC1shWNaylv6kjLYrFMBW3Xk0xkvGSSMg5NiQ3GdM36TFgXUn+vlDXIfVmTTYZp+vUMjxXn8Ytb66GvL6KcIPacE+N3ExrJwLyfnWucoa436qmvGtjcEAZUjWgfahKXS2/EuznLMr85XavUNagIpRo097g2qbRVsXSNkroId11vuz0dQB+ctfxn5u6fPwc2EIp/FiSAumzGa2wveyDexNZ9iLpSLefIx/syziPRNN0pkmXUtpbAL4aUuzlnDe88Ci9PSH/YX08VCYkiqgISkxZlRigL5uGxLZSE6VqKmM8ejihppi2KuOPerLLcuYZmLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58Ivswxf4DGXC7vE0jD/6Spe8R4h/dxVzX9317CMs1s=;
 b=Do/pSw8lTxyTUu37m1jNg0GBENxXPmPieUnsaRF7IqNsvaC4PePMhtGOQNTnHK5BERWg7H9l+9fwYXiem2QuvcdDrgqRrSBvRN0vLASGxQeMUQTiHRxuuTGzTTBqZ92D88YFOLkhI6xVXO8+K9RGF1DWQ5FefOn3TDL9vXaXttNpa3CVoAWrEkpH55/1Q6T3bi0VmgPwyrGJeCvFmmPANjsEzrskJSgyogVkLqRh1FvpxWWbhW6uldFcUUfuq5l8sdByFMzhArzXisJQiQYi/o4SeqKbOGkufcDDeGuOMJLtfSCMUEJubFmw69VVPZST7zRGXRh6nRWQ/PfSQtJm8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB6002.namprd11.prod.outlook.com (2603:10b6:208:386::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 19:25:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 19:25:29 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 26 Jul 2023 15:25:20 -0400
Message-ID: <20230726192520.383531-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726192520.383531-1-rodrigo.vivi@intel.com>
References: <20230726192520.383531-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:a03:331::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: 440e33b6-1c86-4d5f-fb5d-08db8e0e1282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mE1cjY3zsbIB1y9aP7zb8RXi5cLN+Mh9uVi+B/cc/JYyODjMzl1UNPzofjV5LaKzvkp69+QecyER07uUyVXJ3+pGFNB4qoWMwQY6toYWIHkJgQ7CTWxky9w2XOULYAPPQUlUWsxkNnS7b15egbKNZwsyYzrtdF2CaAVjQbHqcaFOe8x8xjAhdQzMx4iIGXjDFTKDgqlH8Nec1+sXwkAEPN7X0ItrPnqM1djxT4p2ZylFBuKCQeDBqAzMl4J+JY2OjlsJKY8nnEvqe+TLlAUzWnPlo0IS+KM7y9xE4aH+UpERYLvX63RDqTwU6xeJPJzgkrsUlALsf8ESBVmwGNtcr7dnQq27MiObEA7509rJJXO1X8pXB2OEOtKCfLy5Q1RFSxyHOBY/FN6LSTwMMZsBa9gdVtMqQaS0hvc1RVdmHbrzAww+ihOamOh7Ca/b7Q9lBYHi2Hgrx0RSpZmWBnGyk3ZSXAy+rhyjYw9zivhRHZfr2fzxCujUseHtqbbPentn+hN8L9KBmLuGq4ww/ylb3VNVn42MBVUIHQTB9SsTDrv3u790okP05LY+XhpD2yxt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199021)(15650500001)(2616005)(83380400001)(86362001)(66946007)(38100700002)(82960400001)(36756003)(5660300002)(107886003)(44832011)(8676002)(8936002)(6916009)(316002)(4326008)(41300700001)(66556008)(66476007)(6486002)(6666004)(6512007)(6506007)(1076003)(186003)(26005)(478600001)(2906002)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aOZnArWpGkhM0LA1+QAjzjdT+I/jndz34liFIh5wly8GwtZcblpo0KNBbdfh?=
 =?us-ascii?Q?hLY0oeb6e+CqEKJFOsroq5j1eEthYlsGPz/6O7TnE8OtVep2L476saZ1nx4D?=
 =?us-ascii?Q?5ZgQ3QXA15aIV0M/D+toE42iwvSgadcAqrpGBTR+EpvjdwcsG3dlbNe5+HCs?=
 =?us-ascii?Q?uKx86VMNQ432rNTzKRQmfQFIv2ehghMW7dOzWESD+lYXfUG6k3BG+/KIZeA9?=
 =?us-ascii?Q?TOzrAUgbkDndODB+olW5HzqCzRreR8iPi0KhZzXfCe8VISEq6EfvVlCSyRLA?=
 =?us-ascii?Q?IBFrRvE+s5Pyhs2uLIUMStg7pc903ZmvkWPYdWQ+y5F33dZDCJKqWVpSVm+C?=
 =?us-ascii?Q?RtUAJs1XFQQaB7dNWSOKYcmtwlXnrAlgN8d0/q46V8tl8anN3E7T+OBKphXw?=
 =?us-ascii?Q?wQPdZr6+Qn9bVBgkjg4LwcPdFt9+3jOb2DQ1+RWgfSQlA3TVhLknCoEYXbD0?=
 =?us-ascii?Q?/NWVzUt/sMd8T8OazQVioHrnvaVm15mHWhkfTuSIpsuiOhK3Xc7U2sThyvjR?=
 =?us-ascii?Q?g7v8gFF8U2XG/emVWPfaDkqkpgdokLS0IuUuBbi0mE8KYA7HwpX++3Sk8moV?=
 =?us-ascii?Q?IViW0uQscIXqmjZw7n3NOtorpBR2J8FHotAbNgbJj3FtJJA0HAQZ3QQtfEh0?=
 =?us-ascii?Q?N0lVs4NZ9B9oJT8criwxXR8n50fIKBOZcA7upe6SaVMxpSWDqfVL5To2nGiL?=
 =?us-ascii?Q?L5D2WeCSmeXl3k8ErtQW3EnFCjqmL5kYFayIAesa0FBWZSfyZ/xnAXIBAYFQ?=
 =?us-ascii?Q?RwP0uZQS7FW4nhld/fsD7OXnHtFhsN4W8tfAUt0w9seORWTnOa22LVybWvYH?=
 =?us-ascii?Q?k8Od/O4VpZNw/oI5nVtA+7rpZgzYU9fQUxeCGCFKeDSpaOm508Iu4BBtG4Pb?=
 =?us-ascii?Q?tcKsWUv8ANNTPkWtnviXCA0o6K+N+5JF6LbjojegSRcrndrjkRjAVAgj63di?=
 =?us-ascii?Q?NcB9VVQcOPGpcVlHss8kCVe2KaH+lpZWIvdprMzyGLd7x0wnFeHUnWWl+Mb+?=
 =?us-ascii?Q?2GSdRxPy+PI3qex3HhBRCUEu2mvMHL9yZp3LydyIc0ULuOPtm1Or3hLNvY7x?=
 =?us-ascii?Q?Fhh4vunvcwIm4awYo+lgCY7ZhBdwUO5dYYJ7YwpCxpd4EH9mQ4FvImv7PmuZ?=
 =?us-ascii?Q?CR7qycYeaAgVlM/u6oOcnHrzwWQ0v63UG/43gtakqaLbHHUYsM9SxSaNHTcE?=
 =?us-ascii?Q?sVGZVs1xgkdOz3Li7JZOBO6VKrn+N0qk5R3UCtgm4H0nmwRh0trHGAlBvPHT?=
 =?us-ascii?Q?KQEbP72wkoyltvACUD/C20DvqzzlaUhGsL5xgcJp5OaSKfWmMLhtiolTpj+j?=
 =?us-ascii?Q?fojHpFPRFXY5OSiiesIBgwQ89MLiDXh9MNYwsX0I9AGyWfuSs/51GJeDW/cg?=
 =?us-ascii?Q?PbgN9Ufn8gPqHM8rTTDv+YTpnLHeptXqRWeBI3WYyV1Dt5y1PXdj16XJD90C?=
 =?us-ascii?Q?30cUMKwA/gXqjBNn/MCSsewk9yKTZGlFAEHKLKkKpU/4nCSJHFAH9MDK2/ER?=
 =?us-ascii?Q?X+pW186QkfewC/QrYwh6mZ8Pw7SaKma9fBLiGYRG1qVUMPe2vmAkI/s/QRlQ?=
 =?us-ascii?Q?MQzV+/UaztbAcJnQS1bdeRVrjDCGthbPXhYYuz7007OvxYS/T94grV/j6iFq?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 440e33b6-1c86-4d5f-fb5d-08db8e0e1282
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 19:25:29.5395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyWGhocuZCPHwsVknwdr1dD/2Xtq7/XaZwDTBTbD1f+M8o0/SThcAGlw1t3voFSFpoOdJZRLN6RffAhEw5Jqgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6002
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Update DRIVER_DATE to 20230726
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It is time to update the long and forgotten initial driver date.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_drv.h b/drivers/gpu/drm/xe/xe_drv.h
index d45b71426cc8..dd1a421cd4f2 100644
--- a/drivers/gpu/drm/xe/xe_drv.h
+++ b/drivers/gpu/drm/xe/xe_drv.h
@@ -10,7 +10,7 @@
 
 #define DRIVER_NAME		"xe"
 #define DRIVER_DESC		"Intel Xe Graphics"
-#define DRIVER_DATE		"20201103"
+#define DRIVER_DATE		"20230726"
 
 /* Interface history:
  *
-- 
2.41.0


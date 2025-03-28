Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F1CC28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 06:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7979B10E982;
	Fri, 28 Mar 2025 06:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgLJoNQr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB8810E982
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 06:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743142233; x=1774678233;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lrYXDYC32gOTfPnJBMpvXpyXHT3SFEFdbok+VyezLos=;
 b=fgLJoNQrnPJwxZSkWOyQ2uy9/fk6JEj8387xyeYjlwthK/lp9Uwp/BEQ
 p1h+Sn0+4nhZoX2KeL6Ttxz2KuJ5OXuu+1hz8JfxrDgI/xMgtzEfA/8xF
 7DQpGADiuJhr9VWp+QhWW7I+kjPjBy2FEh1Kn9TxwUZlGEhF/DzWERMLH
 A4WkYqLrnw1LWsh95me3RuMY2vTrNFF/Gv7GubwFYyOQqM15ZrfXwHvqX
 wF0VFNJHN9X1W1ZwP0p2e3nm3tEhS5HnIXrNBhpW9lC9L0s7tOnnWVgJf
 JOKjCxuZsJSasGPsIE31e0SAeaxuAJonN2hEx8DfNEQJnoTcX+JyOiR2A w==;
X-CSE-ConnectionGUID: B5DxqEomQ5ODM8+8SSVSvQ==
X-CSE-MsgGUID: xpM8Lcd5RCOLVpPiuTcmaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44510878"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="44510878"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 23:10:32 -0700
X-CSE-ConnectionGUID: lF99Qhv8SESsVJbYWyBQxQ==
X-CSE-MsgGUID: smJic9PoSuO1Co2o2g5YIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="130461482"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 23:10:32 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 27 Mar 2025 23:10:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Mar 2025 23:10:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 23:10:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4c9PL47I4iqf1JXFNR47a8F7eEASLjzpbATQ34Hx1ZiKpGp5ZGzJ/KpF992clr4NGpfiJqzhtv2XCBpk+Tys9Y2TUZDcBLcw1igUPB/sxjlust6dV+JaI0i2Vu6HqRRp3T5b9Jmjispm91DsFGep9xnLPjVfIaT4jxru7rd2zJZJBvc9L8mUxMOwzakO6UMCUowNzH7U/kumcn1ZjodyfVD7KQ3yyCTB4Do/V9xI0JzpHU2hr7AgLC+knaRWYUvmzo8sXeNVYc3NscL2LM1cX9cXxepGPNED6+XtLiIKAmLUqSeSkYlUUmGk+HFkgLSbb1dAkI4HRTZSCX/3N8G0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAhjENy0Vm7AsOv68/6bwWxX1+ozS7D5Jhf1vaF6nNY=;
 b=OY+QBkNNOAsH3nN9P1DPmaomHy8tdh66dk8Yt3AfaTdNVr3oeKGEtMXHmiRrM3Wdh7lpCpyYV6uo/aLk2mUsTol1NMhEUik58V52OlKgDpSqsOj4qe86Ds6Ncf/Q24U/cksXXFBSyIRr1w6VF5QaKTZGp3CfSiG7nNWYi3NmJ5zI//d6fAB53QVEMvws4jO9euij6oWbu39C5hu316OUjcuVPVS3i4wnZ5mvR1i74tG71PX/MNxQZbP0NK8mQnlErstzE4eBPtiK+oPyiM51xwL3Fo5DmoMYjygkPd1RPNwEWKeEteqbqRWq3mhbYIrOZRdf1ZVcyvHzCXph8Ofbjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6621.namprd11.prod.outlook.com (2603:10b6:a03:477::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 06:10:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 06:10:02 +0000
Date: Fri, 28 Mar 2025 01:09:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Use drm_info for hwconfig missing message in
 execlist mode
Message-ID: <6vlzyhpdhjxfcehffgv6l7pntehzyyabxn3dr2dduraucoe6pz@wia344kqg3z2>
References: <20250327202201.15169-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250327202201.15169-1-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:303:8f::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: f13b9ce6-be92-453b-6eb5-08dd6dbf2d26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NZRELDEcy6dn3f2WtoA7uYwBltuOAd2EO+ZOTpWZ1CczMg37vYc3IO5Z9uk3?=
 =?us-ascii?Q?aw5XuKQjL49lYMMvZA10eY9IqSLkU5GahlanL07s96a4EVTAYbiIcqUGqpX9?=
 =?us-ascii?Q?sJNIp9E/mkSzNGNoHocioczIMFTWwar91LWUcC2NQrmRkD/k7Qhyb8sSifI4?=
 =?us-ascii?Q?KxEiJ1tJD60gSSLOUFGAToSuio4LHbBUXbZEFdpvWBARMNF8lD7vck/7uBtp?=
 =?us-ascii?Q?uQ4xOCsQKZqd/AMs+qvMVNUdzJqdX43H9a2jphlXFjY/BzticLDoIA9Gwb8o?=
 =?us-ascii?Q?2OSqQ3WRSNYT551/HohokaRQMedR3qBW5mkqGOYeAcG39E6C6uAwVZGg84Wu?=
 =?us-ascii?Q?fYd8Bnnfen3s4q1NYeeEbUeLR5mxjUjic7I/rOmu7QvMXXr8H6jUXHJWQsjX?=
 =?us-ascii?Q?Faif1o9WDy2f53x9cg/i0I6O8Hd+pPuEtuF/5dSGQYgEALyFyUFUHXLV+pch?=
 =?us-ascii?Q?x3mo7GG7KN1qcIC7NXbEMi8/eGb5FEToKFYoURQHvpsroV+KbrCyWIEQmejb?=
 =?us-ascii?Q?tyx3H2bD4FaL8MUaAPq25yL4C7CfgjbdyJ0I03iEBEw+efswFpZNT0ExTMPL?=
 =?us-ascii?Q?xQHZ+P6HV8vIHxPVrWbcipLYo7rNR/Q8peTEs3dxTSUZlOnvZiH3ciA0R/kr?=
 =?us-ascii?Q?DLHAsCSL+gIIB9jvv57Wj5pc+kItKFlaDkiPgcmypMPsAQMlAYwev5NNm346?=
 =?us-ascii?Q?rpIXW32Zz7CMCIiR9GH4ojvUJXg385500K6YlfgphVXjHca0vHrBztJaHK6a?=
 =?us-ascii?Q?pXyJDfDr7BQcQK3+ESwnP3PzNu4oMEn7iSB1zkkllcPEiMTP44+Yy1WyDH5k?=
 =?us-ascii?Q?Fhr2TbgsonqpLaqeilpaRmZ38J8E3v2m3iwL9W2OyQSe0yMPagRGVOEVl0Vm?=
 =?us-ascii?Q?Zo0p+JTYATZ1TYFVJokDRV7H0lvC2S7IdrF5qugsWux3zI5opPzo2ZaOTxDr?=
 =?us-ascii?Q?GjIk4AO+ETO84pntjBcXSpCE+PWqWcxzB2n07d9TvfpClbdgkGvJs0nkOm5Y?=
 =?us-ascii?Q?f9DzsVjkUNvuz0OpAZHznxasEMd4/yQI75bg46lygmtfOAlav52lCrKywnp9?=
 =?us-ascii?Q?Kg3mEjadGxWPbXuwP3XtG5AQT85ZE6/CYLBfbc63AIcVjeO7idJj4BEo/yyG?=
 =?us-ascii?Q?P4WeUNDZ8QGYsXRXfKm2nEbjpKr0HTRHMOYlHTE/kz5YZ6E3X3YddvZrsJCh?=
 =?us-ascii?Q?E0Xht69vtgIZsJRqaTiw9Fj4F24YvsAyFpSZLL91Yj8cKmaZkzwBxCUeLPG6?=
 =?us-ascii?Q?ReHqlPdpUxL+lxRl9pLAmJ0eNJEDmFywfRP0OyllVMdcZXtlMjwsYJuaVGwO?=
 =?us-ascii?Q?/K2qNLjZzoo0U6q2pc0km4z2Sib5RNVNf5phnapgOAybNCUT8qpfl2CYqyLa?=
 =?us-ascii?Q?VBN6ENVIuwxWlooYDug9Z5uYnwPx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZeTRwiVYCo+0tOD+d5XsQQxCMq3hcEzFsO8GTArYF5xGCLq3glawBlqUnCZg?=
 =?us-ascii?Q?ADRXk8SqsdY17vtZ81VJE7LEaPsTW7TTE42pXxbXkbEFu036OESWJ9HESX8y?=
 =?us-ascii?Q?PmZq5F+LpSvzqjrRdH1aIBDY16NdSkxY6p1gGwyQ9UipV0i786qrKy7KP03m?=
 =?us-ascii?Q?uFjqKc7Sod6MCOHTrZNPrriVzfETlhUpNlw19LDEY3vD7faZLp5wmYpUxV8e?=
 =?us-ascii?Q?iKbUXj5Uzzl33Hoo8EsOfkzI3tHO5GaMXs8F5QengqPu1m2xQppGTB+0OcF1?=
 =?us-ascii?Q?9oX4QdtD/l8ZNoXM87+OyBrs2KDTIfCerSHjC/XCHW+g7ast6IqSbWd/BWFB?=
 =?us-ascii?Q?CSkALDY/ZyF58jGkGPu4EQRtXJNHu6pw8Ksy+Jc4gh6tyDTDXN/YdoOYWZsQ?=
 =?us-ascii?Q?iXKTIKtRytTrdFaVUagNLneBZzkchDJjtW+Gx07aDoXFcVk0+HWZnhsiH27+?=
 =?us-ascii?Q?0BrQHgavPLzZlyteoY7OJS7TXFp+LmSTTEHO/6ChH9ZqhG+u3yfgtJJBDAlL?=
 =?us-ascii?Q?Pc7KCMY8tUpZMbF9t/mVH8lqGkFSUVMdJRg5Dl4fTaR+J0NVmWoVTBeUdtC9?=
 =?us-ascii?Q?FaUFfNxyqWXaluTd7UAoZE3KOf4Ee87/R3diPGQdIk1JFYViWBnYyh7uXzuY?=
 =?us-ascii?Q?AUngegThKJg8TeBNictykYdUTYNAJ5drzPb6+H2I2WW4gMFjNd2kqHNZ9vgD?=
 =?us-ascii?Q?3MWTRuxy92+8yGZItChGs3ytdd1Fcy4eGk8xvJ84Iepo52dixJ9TwRSiV3ut?=
 =?us-ascii?Q?uxj48YG5saJ0X1jrOxMN2oNP4FX7RIfsOIfG0r0JUVWZpVAsaH41bi0z1jVf?=
 =?us-ascii?Q?7PPPKWpuD7AsE4apSstnc/JKVx4RR97wXsnwH5gshB+JCOzGUeAOrM/MHpcP?=
 =?us-ascii?Q?V+p/mqfnM2+3AHUULMDiifFJHJ4dvzJvFO/YQ8kcFPNO8eYWIWJnnMZ82NKD?=
 =?us-ascii?Q?ygqQlzdcA22CPgxKfLtS6c4ViLvGFhgf5nU6oc3kNYlG+1ZAYH+pZvuzpeRB?=
 =?us-ascii?Q?pdLoL9Dw1TGsrai8gSUt4yC3xWr7XuOJzhjDfc+wjvsFxa7pX9svJ0zcvIfi?=
 =?us-ascii?Q?qr9JQFS2xC7GxNaLUZ/QHmV6bcpWxrlkIS0z0in2/JmMNUnCj6Ix43n1vKLZ?=
 =?us-ascii?Q?hSzCP7AKr5kHqjyaqwavA2tIWD5hkB2UrktRlGMz+50colYkcDi33Cq3dp0C?=
 =?us-ascii?Q?S16RAdkaOnjZIxtvH0yzS5hGaJg0qHymCL6JX+MyMnl09UUXaOpey7WEuQLr?=
 =?us-ascii?Q?bKGzOi8hvt0FOn/plVDwkexuMu+vVB4rauUx3MjBgMhlBuRAfc5jLg/6Cry/?=
 =?us-ascii?Q?hstXNTXWZbcfqRmuhmVkJvw9tgZnyrerBJwWHbZBKI2ilUQm/trJMxjV4Yvm?=
 =?us-ascii?Q?CmojU1NeVttQhaQ5gmxCOAG7Vr8lUdi7v9/chVH3K+t/pyX1ASgFYTVfXV5G?=
 =?us-ascii?Q?TVP865JPo6QIVw4qNgTBna4cV8If3omajiFP6gEZDPqB6u3GVK4plnbHP42e?=
 =?us-ascii?Q?lPxKezEYVPNzaxvCRg61sPzpM+8+h6+Km3neCbaHskhf+63hqhZelDzwMKz9?=
 =?us-ascii?Q?CwXZIX9WLere0f7/YZoo+/ndvaJjrafmJhbEtPDQ80ZDmZzxKvSXzQHjMumY?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f13b9ce6-be92-453b-6eb5-08dd6dbf2d26
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 06:10:02.2341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7ltO6Hs7n5u8ZmcDIYKF3KTBX0eE3Ma0oEwB47//6dEfMZ4ByHpVEkm3SxnGJHLEi4WAWaS9954rIkq0QX+5e+bgkc69OqT26tA4qWfBBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6621
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

On Thu, Mar 27, 2025 at 08:22:01PM +0000, Stuart Summers wrote:
>When running in execlist mode we are explicitly not loading
>the GuC firmware and the GuC is needed to provide the hwconfig
>values. Currently we are printing an error message any time
>we see the hwconfig couldn't be obtained for some reason which
>is breaking the execlist specific CI.
>
>Keep the error message for normal GuC based load, but when
>the module is loaded with force_execlist=1, change this to
>an info print.

but do we actually need the info? it would be simpler to just drop the
message. See below.

>
>Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_mcr.c | 14 ++++++++++++--
> 1 file changed, 12 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>index 605aad3554e7..52ee2ead3b17 100644
>--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>@@ -345,8 +345,18 @@ static unsigned int dss_per_group(struct xe_gt *gt)
> 	 * Some older platforms don't have tables or don't have complete tables.
> 	 * Newer platforms should always have the required info.

- 	 * Newer platforms should always have the required info.
+ 	 * Newer platforms should always have the required info
+	 * when using GuC.

> 	 */
>-	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000)
>-		xe_gt_err(gt, "Slice/Subslice counts missing from hwconfig table; using typical fallback values\n");
>+	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000) {

-	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000
+	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000 &&
+	    !gt_to_xe(gt)->info.force_execlist)

/me surprised the driver is not exploding in execlist.

Lucas De Marchi

>+		const char *fallback_msg =
>+			"GT%u: Slice/Subslice counts missing from hwconfig table; using typical fallback values\n";
>+		struct drm_printer ip = xe_gt_info_printer(gt);
>+		struct drm_printer ep = xe_gt_err_printer(gt);
>+
>+		/* In execlist, we don't load GuC, so this is expected. */
>+		if (gt_to_xe(gt)->info.force_execlist)
>+			drm_printf(&ip, fallback_msg, gt->info.id);
>+		else
>+			drm_printf(&ep, fallback_msg, gt->info.id);
>+	}
>
> 	if (gt_to_xe(gt)->info.platform == XE_PVC)
> 		return 8;
>-- 
>2.34.1
>

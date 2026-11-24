Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50D4606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 16:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jx/o+/uw;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=fQVkusRb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69B910F7A8;
	Tue, 24 Nov 2026 16:05:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0FA10ECA8
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 16:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795536307; x=1827072307;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tPRao+x8fRjmZg0v3sIsQ6Yl6Mi7o/L6k8PPUcMqkhM=;
 b=jx/o+/uwWIku8ksiklv1WUt0/Zi2TaIWsqkeoTr/zvK3zPnoV0dPZrQw
 2ukdXVCx64Q0SX3K6M5h5riXNTrGa8rAa2FDh7tuobkW8ZQpCugAh4D9K
 JBke29Q05Z3xCtIhkN7YHEHqI14t8VgER8lhBWRECUVc8aEBLGmmX4JGW
 VguI75xD/r5cX+9mmkcKs+xs3gIt7C8atIP2NY+DaWkCT8CuLMqxxZUyU
 qfM1he5qn2/MbyxW5fpnkJliRbxwGF3i4YxYukECkA26U6p7OV9djUaAp
 KI3vgl9qqYgymYbzy017y5NDO4NpROUB8gLNLFmYW4QWE09/u7yPdDwp6 A==;
X-CSE-ConnectionGUID: X/D/JcxqRFGQ4oxe2iAGyw==
X-CSE-MsgGUID: ZctOL2YwQ3O1WkYdkzVn8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4388505"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4388505"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 07:54:18 -0800
X-CSE-ConnectionGUID: c19wg687RTi8RPYMbED3KQ==
X-CSE-MsgGUID: ldULvv8CSoWOC4V5+UzAeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11893885"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 07:54:17 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 07:54:15 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 07:54:15 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 07:54:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbYjx0VLMqn12C4MmlADeefOdjmXpAVoR+xfcfS1AhFerqR7HVqvZxNN0cbzuB33iuDSB1dTWUZwM/r3gjdDUDX8WVvTqFDfogCi3BFZygIaD4ME9lRLxlco9gPi6dfZsgN4ksT1rMZLLTKtPcu6/+PDB2MuLIK9CpWZWVZ/3OL7w7N1P9qtb99MV4IbV5iL+KsESaL5YXZXoxPHDH8fJCyzspf8fqjnFeK5ot58RQpSnyuK1Lsu98E3kblpWWevkRU1d5qqtEXVKWLJP/659T3+lgXeORrHdpUqFDNHhTOsyIBatZxzhE4OtNZC0neEp7+ESYjxifo9a+hoC3zDrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h42r++ijW+GuPW46suxvaTB9+NhlMLSO1m0JqWTFBWI=;
 b=sx+7+xpO/TSBN/wp/s4nXXZCDGHBAwbCcZX5pNGdOBp074RXJu31bGzkXY8I+j1yvlLW7JV6duYI/emXSwzQsdGicSuiEkznwzNC8dxr+5ZLQN7m4W4Ldlfz6mNBPvikSagEt4WT0iO08Gan8PJL7Ozl1eutNb4PVBd8ODM3gwp2uE7gjOvu2cdp0dFhIlVgK07QSZ7jDSi+pUg0IKIRWuSUwbR7pn0qesmrSmk124wI7dVcwjjkHkj1HUBNUIjl1+SIWwS5zCKMHMZmPAy38d5+CWCzzvK06+zOfL6WKb3Ejx/TsKfdJdwAQStdl+jTbU64iCPSGYlLBXx6rK71Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h42r++ijW+GuPW46suxvaTB9+NhlMLSO1m0JqWTFBWI=;
 b=fQVkusRbn8L/dgT/OmSC0vaUsMyGP6SVsqvCftzmJB7wIb6+aePwlWdryAaB/vaTr/+yhXSV00iAh1VK0bzYSFkSRi/41FdlSXRIfSYjeah8wq3TBRS+rO+wWwHlIz3us3eBJMZAO1jIlImJ/nYW5LXlBc1IdDgQEnl73oIUkko=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DM3PR11MB8671.namprd11.prod.outlook.com (2603:10b6:0:42::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.14; Tue, 24 Nov 2026 15:54:11 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 15:54:11 +0000
Date: Tue, 24 Nov 2026 10:54:07 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Add debug configfs option to force OCODE load
Message-ID: <awWzH-TK-g4avMwF@intel.com>
References: <20261123183740.4002390-4-sk.anirban@intel.com>
 <20261123183740.4002390-6-sk.anirban@intel.com>
 <awSf42ue559qzavc@intel.com>
 <32cf23d7-ff8f-4e0e-a212-d869b943a00e@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32cf23d7-ff8f-4e0e-a212-d869b943a00e@intel.com>
X-ClientProxiedBy: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DM3PR11MB8671:EE_
X-MS-Office365-Filtering-Correlation-Id: 422ff3c5-8d65-47a3-0c24-08df4a432e6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|261026121527099003|261022113327099003|261022105027099003|261026140227099003|261028144727099003|10067099003|11063799006|4143699003|56012099006|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: pmMfkeaZjpT32LKH09G3kkRMAIh8VYCfgehi2DwaHNh3L0Kswjm0A7VH0Z/MPKn4T8tNFnhBRO03sZZPsCkkab00NaBAevv0+DvK8Yce+zubPHuaqE7cF9kDFLYJLCUzrPOhDPy3ZRJnbNn/q9ihIZzFryJcmLhDmSPVFKvrl4MMym2tHVnO74c5owT3QGiF3SXVyYAaOfbbJiwCwzF/+w3+RJoZFEjA82gF5nwMSP7DV2VyNKhGkmpFHDS90k8fCtkdDSNoiMTsMG/2xi9LQDF3eQYAi9T7i7RcFuT+cJj5pO0OPQxYXYqvQlVIvZfR40GUxl3Dxxwf4sW4wQyU0P6NhRacM1c+wqvxMpPtKxlxxgTuspcgAfRSr3FiuH1uszdEdb7Tk2IgV0dp7+PT8twDZGHNMAJR6gqiQX/bGEGGWxXiAOT2I7xU+9SCBA6o24Apz89A27cExFPTx1QSVyr8DwQz41x4YRQjtnt/j/MDhKZZInOnrFVJqV4dm9YYWLEd6nGVsF25ydyQNghHrSYtsqpNAgd9Fxgv9FViClEdYKe2bGY3FtOicCKIxP2MFtFfje/Kr6hKyiNhJRHdkFdPWiqpWijNxjUgKEQso2OhMnzoHASuYOjUGklLegc2M6mQ1vd4tsgAGvypp/hbl3rUbts/bxy2OI4O/WkixQY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261026121527099003)(261022113327099003)(261022105027099003)(261026140227099003)(261028144727099003)(10067099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4m9ONgYecrsMgeh3nTJGJvisJsHQbFSb++mXxtUrzpT6GvyqadnR9dxRWaZx?=
 =?us-ascii?Q?kVwSBFu5a4FDO0J3yNUOMPH5AyJeSHoY2B90LPUOHkllJMP2z14mSwwLcL/D?=
 =?us-ascii?Q?vcd6X4BCtJLfDh3dPWrU4ckVn/opO+NjyWcleDPhwlaWzI9bfFNlNVsCY2I2?=
 =?us-ascii?Q?wlMLQTqhCIZnJ+7A9sdJsyimGG3rY5uQMa43FNTdWMzEVxFTciksRyHEAfZO?=
 =?us-ascii?Q?oEdYEpDZHK1wG43PbBwQuQe6n7tzpEug/sjeoK91REaP3MI7/OQwP9BUrUc9?=
 =?us-ascii?Q?qo9ysjxaA6jdZxbh4cttEeSCoM/+RYXvmFdS0+WWtEO6h9IIYEWcTEvJIqdd?=
 =?us-ascii?Q?HJfncGg26u0Iwp1AoWmOa7Ww5ElXkjtq/lu3lY6ywjhF6Xq9JGFBONTYAzn6?=
 =?us-ascii?Q?0SUJp5uzmrpxzT89COWPQdwTEdRdZf8CD/CsgXGvrUiy3WP04UggAUPxQHhc?=
 =?us-ascii?Q?nx30TykzHi9tzY0IgGvKpyHZnNvOSRMEjHZ9kMqqOBM9A3WS24NhRLYGIJQR?=
 =?us-ascii?Q?Qdwkmy+6OF+/4W/1qbUbvWrg2A1K4MJzIdlsOHmoWhLM9FvVIcZoKuNwIPzj?=
 =?us-ascii?Q?n8RDT/e7DBKTal2VEh7NQY17dbvHG0U1JBy14mnLgE+V17Cuym8udV5thupV?=
 =?us-ascii?Q?EVoa3PSoICFPsWw3IiPlnvTD4LUcdfeQ/+Dc3ZcFYxuDDcBeJCB6G+5Jk8F5?=
 =?us-ascii?Q?mCDRmdhgHxHVhAvUTKwyNQYNiPRXEJsMnMThSh8DE07Tja70OQeRb6f9yDaW?=
 =?us-ascii?Q?5cDgIt5KG18lBhKcOBTTEWbHQJla9N7nhF760oeSYpE+oGUosGLrBbL5QNLp?=
 =?us-ascii?Q?Vp/79iGAxcYtXF62liCi031ONkLlikXoA7+WFfT0giumy3Y60S57gZpOCOYv?=
 =?us-ascii?Q?GkTdOv8rWaZZZIj1VTGpREwf+Jjh9x70+dwV92LRhMPnGrxDOW8cPYWa/qnt?=
 =?us-ascii?Q?zDBi5yhli24BcywII3HHdKD8STeM6EubMwmDh88QjE9eoqnZm88q7+HDlOHS?=
 =?us-ascii?Q?pGtPBbpS97fRB3yjJ9jbx0uQL3p5NCTauG4VWZjXomTLd2CjtSKXAKBIM/4n?=
 =?us-ascii?Q?YULDiPSNDzvC4DrzvBVzYyOrWEVIMuSOoUU9vulosElsd6N0T7fHSM1S0K3I?=
 =?us-ascii?Q?VxyVqmV8yjqLA00Lcbo4J41Yg1rJLKs+D9l0VHV6ZNtvUMiorTzy0XzQ7a4C?=
 =?us-ascii?Q?hn73i4oDfZXHYIJqyuciHu8jb8OCwcvN56EyZm02U2hblqftEB760umasq8l?=
 =?us-ascii?Q?1VHPnr/BmIOX8TCV9i189R2H+0HhnAIqYHlPG/SUAFErRJHo31TF1yHj1Ilv?=
 =?us-ascii?Q?vl4VM8N2dATmkGAZXxff+xZ9S3AuhhkNJqlQItNgEGXV9LxVO5lEL5qg6zPl?=
 =?us-ascii?Q?MSHM8IGvWb1UZDzpw64bY0EzhJsW25UljL0cVdkaBCSJ0bzem1Yqx9CgTRf0?=
 =?us-ascii?Q?uMpLQFzECZIPC+0zi7GxUxIa99yKZg33etvhHoYvYZys83DxskUC7OS3Pn87?=
 =?us-ascii?Q?7SrSu7rEkXIPuiY5kISFYeGNecAvkbLJhqhCBiD4wpMKtxpNqJqaGZftMAWA?=
 =?us-ascii?Q?UVB+kswGYb3VUTQqhEF+QjupYruXU0WbYSU/oqqgzXcRwwwa1uU1fuoEG/rc?=
 =?us-ascii?Q?zSGCDIiAxV/fveRnBo1nll6ro6sV85OeVQS9UP4s/HZvSllJLL5xDLN4USC6?=
 =?us-ascii?Q?ajXuqkVUh1+W2YfQHBXiwoIZf21e3d1bEi937WNdOG2L28NSORpeI1u4rEA1?=
 =?us-ascii?Q?g1C6G3uOYA=3D=3D?=
X-Exchange-RoutingPolicyChecked: YgcqviTWcIn5EBIwNUERvqqYH61uxdMTKFrXNGEiNYt7fikhxXngneCvU9M8VXp966u9dS5AFVAUbmTxFhF+Wp6FsFWaenYD5UwxPCVGWOZmh3YCWvw4LG7/1Zr85DdIVsi3uNGfVaXyxBSaDT5hU7sIsX6K6CETzr4Qn2TQvoauiNBVc/bYQKyxttVDbtcp7c/qnyZfyuBYVWUtVyevf8HSaVvYWPKIZul1XIpgetkRFit+XXQo1VpsozehJkLR8EUglovcDiXzDRaYW3nAhMwfWEMFIGm0UoX9tGOQw0ABH8A4aZbd2z7x+ysctkuZmUQebZop9NdQD3l4SYvWyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 422ff3c5-8d65-47a3-0c24-08df4a432e6c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 15:54:11.4196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaIlmYqysKxu3L4CX66Nsd9TDBxEZqN0xHNkqyB/lRaIvoZaaQSY5qrRB8GEJ6SQ6JTWbPEaJrQBEuQfTWkWJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8671
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 05:27:55PM +0530, Nilawar, Badal wrote:
> On 24-11-2026 01:49, Rodrigo Vivi wrote:                                        
>                                                                                 
> > @@ -12,6 +12,7 @@                                                             
> >  #include <drm/intel/intel_lb_mei_interface.h>                                
> >  #include <drm/drm_print.h>                                                   
> >                                                                               
> > +#include "xe_configfs.h"                                                     
> >  #include "xe_device.h"                                                       
> >  #include "xe_late_bind_fw.h"                                                 
> >  #include "xe_pcode.h"                                                        
> > @@ -259,7 +260,9 @@ static void xe_late_bind_work(struct work_struct *work)   
> >         xe_device_assert_mem_access(xe);                                      
> >                                                                               
> >         /* TODO: Compare the running OCODE version at probe when available. */
> > -       if (lbfw->type == INTEL_LB_TYPE_OCODE && xe_sysctrl_is_oobmsm_fw_ready(xe)) {
> > +       if (lbfw->type == INTEL_LB_TYPE_OCODE &&                              
> > +           (!READ_ONCE(lbfw->probe) || !late_bind->force_ocode_load) &&      
>                                                                                 
> > let's not complicate and remove this 'probe' check.                           
> > It is a debug only case, let's allow even on resume and move with it.         
>                                                                                 
> Dropping probe will end-up load across every resume but user have option to     
> disable lb using debug fs node "disable_late_binding".                          

I meant the other way around... drop the probe variable. Have same behavior
on both probe and resume and avoid the reload on both.

>                                                                                 
> Thanks,                                                                         
> Badal                                                                           
>                                                                                 
>                                                                                 
> > The rest looks fine.                                                          
>                                                                                 
>                                                                                 
> > +           xe_sysctrl_is_oobmsm_fw_ready(xe)) {                              
> >                 drm_dbg(&xe->drm, "%s firmware already loaded, skipping\n",   
> >                         fw_id_to_name[lbfw->id]);                             
> >                 goto out;                                                     

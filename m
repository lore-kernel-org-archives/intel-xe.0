Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F60CA0ECA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 13:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F4B10E040;
	Tue, 12 Sep 2023 13:41:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF6510E040
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 13:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694526059; x=1726062059;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=SXiwQUTWM1YJFFXWuF0ZTjo1xIsatZaYkIqf+gKNdUY=;
 b=HqB8Dw/kIVXanmSANvfEkE4uJaa5folH3RlQbjN9nn/MTDH+xn2lfcj8
 4P/31Mv8IklgZVYxd3ln5h8qrmlh5nPzi4uZtJRK7LIgL7RMdFbZ1mweq
 Qpklj0UkdRyp+nUwRCjajAT4u1rkYNDzhoW6PFM1k0wmBcHgf3oStLOSX
 CctBRknOvdXyeyVzCMFpXpEAnRTJcTq5YCP5O4GLMZq2cXWnUcaQ6nKBe
 BiYN84EmEOxoZmKXhJgZb5As5xvw8Z2KWlhA0Ic8VRy3+GJ1u5XkiENnu
 bi+KlP7iUjzA0KLn/LQK2c13JBW0YacPQ7gA2gixRAZ4DSSb42qi/tGfg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="381076648"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="381076648"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 06:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="743723567"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="743723567"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 06:40:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 06:40:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 06:40:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 06:40:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 06:40:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKnT80xCjE+NrfzHLbr5qErgpDI4G8S9YByetT5XfbtbMHMrfO5zYJ2I1QAdOXe5kcSst32Nz72ujCJ3LoMbGC34tdHCVJ6Zq8+E1uf0NXmKtX7h7ZlLkjUaXCUqAbbl/PPvd1NX34YwjUxBw9EzKTXlNnW+VUMMDcKRbCy7Hz8tIlvnEzxK9X6z+6OuD//vf5Cw1iEX+g4j98XBXxhNDa2AeCxYL6FpgY88/nMDaYBPmuCoqP0Sq1ZlFMrsfL+dQqarkFBNl9stmKNZcXbRIUTWRGf5PatiAcKlfyUQSHVdRssyKfVWR6us70bHTrG+lS4H+F04ZOwVf1xpWWcRMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7s3rMU13A1RMlTjauKZ/aqVTf5uJRquFStI8QtG6gA=;
 b=M/7Li0JPskGzvRJ/jY1GU/iMo3vWC5RZ+gZvZ9/dvoiEC/CNRk/xlNvKEuqc7DuMMLRkRCPmLs9sKHtHaJ+8F7GLawJy75jpu2lxmwrMtNBaFTap7gE1Z63TJxlSvrKyfuiSuo9/RSiESYx6Hd0vNaiuwp2/85ay5DFzfi2UBrhXgY8+lPp7qundMzYCrc7jmcpHoW0fUJYWTKTUxEaDK4NWK+y9U52GPRdu7Cbd0b++G5CA4pXOlLea8XytG9hG3YYFPxHeXCj0HmUrg1sdHKfFMtDLXd1O6d6juXlL5AxhS/ADdBbRtPaJ+lY0T2V24wmIkxHCJhVIVAXQsV1WTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SJ0PR11MB4799.namprd11.prod.outlook.com (2603:10b6:a03:2ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 13:40:28 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 13:40:28 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <epofyqmatq4b5e65a6tcjyctdfnq24sxddkhzjp5dzjfwnlzcd@bs6c4effab3r>
References: <20230911194712.34387-1-gustavo.sousa@intel.com>
 <20230911194712.34387-2-gustavo.sousa@intel.com>
 <169446182644.19625.15721984345055872792@gjsousa-mobl2>
 <epofyqmatq4b5e65a6tcjyctdfnq24sxddkhzjp5dzjfwnlzcd@bs6c4effab3r>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Tue, 12 Sep 2023 10:40:21 -0300
Message-ID: <169452602181.18586.1781311199083444191@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::27) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SJ0PR11MB4799:EE_
X-MS-Office365-Filtering-Correlation-Id: db2169ca-e9fa-4cb1-1129-08dbb395d37c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RbMP28aOkJyKosRhiCP9iK4IDMl7zTp7aWlhbi8zJr5u0ADWavrjopndONN47lGkTxZpSZtdWHNP6r9B20MZsx6f+SHoT53aieyF70/FwTkodPN4JZSeHiGQ050p9sY/VTY84SHXQc78RpBGUvVQ2bvFGRKFKpV3zOpZW7wvY0D97j7ybty5kOG6C/6iBFC3mmjV9JUzWUekHyGvJL/+rOLADuumVxaTgg2xZ/folrj+XMfMCUes9W7Fj/F3vcEh6wQj/OCpD8w6bFdCvaiccmzifL6xRCIHZbAgNsAorVxxm+uUYVXIX5eHslQKAau8+zyhn6CEkRiQxjsWfP4R5xmThFVVqRqxOCZyv7P2S/NE/I7+HJsyZv48z60VVn6H4FWasmfshppC16dmM9KGx3PPontZlto8sPTiAqaFh2qSqeTtR7qnwDKI7vkwJRd9DgQ4zg71feGc+1B6iXklsYvbryQBtQnGqxLSgwvx0pfBf/n8rhvbn3lMV58Hpi1IzFGIHVxAMzBJzpXq2qG/NkQvWLQe0t4Jkl+O6UvlsjibtQWFtW06jrRLmsRQfl9p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(366004)(346002)(396003)(376002)(186009)(451199024)(1800799009)(8676002)(4326008)(8936002)(6862004)(26005)(33716001)(6666004)(6506007)(82960400001)(6486002)(86362001)(5660300002)(38100700002)(2906002)(66476007)(83380400001)(41300700001)(9686003)(6512007)(316002)(478600001)(66946007)(6636002)(66556008)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjZpbWpSeklTV25BYnRaSURGVVBPWFpTamhtSXBkUEptUkQvbkY4SnF0LzMv?=
 =?utf-8?B?aC9wRURDb0pZaVNFdUZKVmU1eUhCc2pNVEtDK1FHd3c0VmhTQlU2TFlvekxv?=
 =?utf-8?B?VTFxQ2kyKzVPMWE3QThmREd3S0RwcHdEbExGRElocCtHMUxOZTNIM2RZWkJ0?=
 =?utf-8?B?MnVWT01JU2pVV2grTGwyWlNTaDVTb2x5N0xONkd1WllMa3lsV2tiVWNRY1ZN?=
 =?utf-8?B?S2ovU1hDNWxzR2F6V3ZjaGlHQk84Tnc2a01WUGJ5anFpOWpXa0czZ1FWZmpC?=
 =?utf-8?B?WVdpTGtyVUV4U2NQUjE5ZzJBdnpNS1VPQStuQkhkVzJmSC9IZG41K1kyaWxP?=
 =?utf-8?B?Q3R5UXVaVEpreDRZT2pHcVI0dmZOSm1WbWU1bXdOeXd4RXRhTlViU2ZvaENt?=
 =?utf-8?B?dTBWZ1hhTjJsQ2NRQWVzcDRPN1dsZ2pyVGpiRVRCUlY4K1IxeTlEcjZBemJx?=
 =?utf-8?B?Y1pLdTM3M2VEbGpWVkVJWUZlSFFMYWU5eHY3UUVxdUtTZ2cyOWJUbTlZYkVX?=
 =?utf-8?B?S1RmTEEwSUJ3TjVEMlFVNFg3bHlOUzVGenBQb0xGYllHNGw0U1Y3azRraEpu?=
 =?utf-8?B?VHEwMEJ3MmhOTnBhTEtGaTZtdUxUVXJOQXlmTlRaaEZLRkZORm9nTDFYQmlB?=
 =?utf-8?B?N2VyNG04MHRvalhpRnBJRnJwRzh3YStpTnk0UTlrZUhqNlNYanZKM2N3RHFD?=
 =?utf-8?B?ZldJYkIrRW9Nb0F4ZE03M3dHQTlTa1JGcFcxOWF0YkE2aEx4Z21FUGFDaWFH?=
 =?utf-8?B?bHBzczBpMkk1SVFlejU5V3pGdU1DN2hmWjVQMEx4bUJjSTFFRDU0Q3BxbUpI?=
 =?utf-8?B?YzNwSXI4VVp0Z2R2aG02Ymt4RWJQN1FYL1N6WUFRZkZRZTR4SFZnSURZd3Bn?=
 =?utf-8?B?bGNsUDdUWGNINVZNUzhmSjY5bWtHNGNHbnd2S2dQR1MzMzc3YnY3c0ZXc2Y3?=
 =?utf-8?B?aFB5Wm1ZSSswZHNyRWpwYncvSExKcEJ5U1JIUG5kTUFzZDRjbnVuang1VGM0?=
 =?utf-8?B?NFB2Q3p6Mmx3UWl4Y2xaVWZEd0ZVL0t1VFJnRlpUbmpIdXRqMEIxSVB2TXFZ?=
 =?utf-8?B?ekVNTXZxTVU5endjWWF2M1QvRFRZaHpTNGV0UWszVStnVTdlS0pVOHpaSmth?=
 =?utf-8?B?dm5DSWdocmdEZjhQUVhETE03YmJiRnlxcVNjbktvUVZiaDlwa3JsVU8ydnY4?=
 =?utf-8?B?QXR0ckdnbWVnV0lSZXhxYUFVWWVPNUpxbHZXK0tOMUE2MEtpZGdVNCs3TG5W?=
 =?utf-8?B?akJMb255RmxvRWNhYmh2NkQxZFo4NUdMR015eWtQendsQTAxMk9iSXVieUpm?=
 =?utf-8?B?VURWR0JDa3hzVmhpS3hULzJxY1RVRTNTdWlIbU1RbThHVlhzN0lVYkNRUElx?=
 =?utf-8?B?WW50R0NRQ1ZGZG9lN01VTDlNUmhTeWtvZUQwYURtQVhIUkw1WnNua3Y0ZE9u?=
 =?utf-8?B?NHluR1l3MERodExTcHkrSW1sOEdMcm5ZdzBKOE1tVVVHWkhTMmI1TU50NFdN?=
 =?utf-8?B?Q0RwdkZxVnFoZlpFZU5GUzFSZjNmY1FBQkNiQTRzYmNaWUx2SUJQQmZjK3Q2?=
 =?utf-8?B?eXNyekdBUzB3dTk5TWpzenE5QXFOazUveTQrdnRtdSs0dEE0RG1ZY3JnRm1J?=
 =?utf-8?B?OWNGUjJWM1pGVDN5Q1gvZFVpVWVxN2poSXBQK3dwRXBrN3VGWjR0SEtTY1VS?=
 =?utf-8?B?NEZnT244RzJzSnlsTFVWZSs0NXhHTHFxTnN6RDRGa0dKd0p5cGlaTURtWCtD?=
 =?utf-8?B?TmlieVlBRzZnSzhrcGI3NWVFbERjSHdaOGpxUlppd2NuT2RPZFpQQVJ5RzdZ?=
 =?utf-8?B?SmVXbWNZOCtCUE9DVTJYc01hOEsvaFFzVDFMN1RHV1Z1czZQZlp0UXRxbVpJ?=
 =?utf-8?B?S2txQ1N3ci9HdTB2bi9HbUoyMUxWWjljdFI2Y29BUWhNTVpBKzRWeFFYZUND?=
 =?utf-8?B?UlMrSE0wVmRjTGxSZEcxV1p5VmJYSnBPQkQ5a1dzcEtQdWExUGFqRWNRN0tK?=
 =?utf-8?B?b0hRY09ydVV1MTUwNmFPbmpSOUNqZnAxOWk3Wlp1ZXllZ1JST1M0NDRXMzJo?=
 =?utf-8?B?VWdHVTNybmlndDFBdVpxSFpCRkNOZlY2WnZTME1NL0tMOExmbFV1bDhuVitz?=
 =?utf-8?B?eXQ5QWFlSzB5bEUwSi9wOVhDang5ZWNBSUduTjhLbmd4eGw5UnZQN3RDbFVk?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db2169ca-e9fa-4cb1-1129-08dbb395d37c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 13:40:28.6281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0WHCDq4eHEs/B9LBYNCWljzE53K8BI4+Nd1TWCIS6XGWqsAQYYYJVjVXNkf6/qQPr2qCG9o9cfG8DXO9fGASg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4799
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] fixup! drm/xe/display: Implement
 display support
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

Quoting Lucas De Marchi (2023-09-11 19:16:53-03:00)
>On Mon, Sep 11, 2023 at 04:50:26PM -0300, Gustavo Sousa wrote:
>>Quoting Gustavo Sousa (2023-09-11 16:47:12-03:00)
>>>Finalizer counterparts of display initializers are registered with
>>>drmm_add_action_or_reset(). Since there are no other explicit users of
>>>them outside of xe_display.c, let's turn them into static functions.
>>>
>>>While at it, since this is a fixup patch, also do other cleanups
>>>suggested by Lucas:
>>>
>>>    * s/xe_display_modset_driver_remove/xe_display_driver_remove/
>>>
>>>    * Remove the unused xe_display_enable()
>>>
>>>    * s,xe_display_unlink,xe_display_fini,
>>>
>>>      The original suggestion for the above was to replace with
>>>      xe_display_shutdown, but I went with xe_display_fini to be
>>>      consistent with the other "stepped" display finalizers.
>>
>>Hey Lucas,
>>
>>Please let me know if your r-b stands with this slight deviation from you=
r
>>suggestion.
>
>I personally prefer the _shutdown, but I don't mind. At one point we
>have to go back and unify the names we use. See below

Heh, I like _fini just because it is shorter and has 4 characters, making i=
t the
same length as _init :-)

Yep, I agree on having a unified naming style.

>
>>
>>--
>>Gustavo Sousa
>>
>>>
>>>    * Group functions in the header by namespaces.
>>>
>>>v2:
>>>  - Add more cleanups. (Lucas)
>>>
>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>---
>>> drivers/gpu/drm/xe/xe_device.c  |  8 ++++----
>>> drivers/gpu/drm/xe/xe_display.c | 10 +++++-----
>>> drivers/gpu/drm/xe/xe_display.h | 33 ++++++---------------------------
>>> 3 files changed, 15 insertions(+), 36 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devi=
ce.c
>>>index 109aeb25d19c..a964dc205da9 100644
>>>--- a/drivers/gpu/drm/xe/xe_device.c
>>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>>@@ -342,12 +342,12 @@ int xe_device_probe(struct xe_device *xe)
>>>         return 0;
>>>
>>> err_fini_display:
>>>-        xe_display_modset_driver_remove(xe);
>>>+        xe_display_driver_remove(xe);
>>>
>>> err_irq_shutdown:
>>>         xe_irq_shutdown(xe);
>
>           ^^  here
>
>>> err:
>>>-        xe_display_unlink(xe);
>>>+        xe_display_fini(xe);
>>>         return err;
>>> }
>>>
>>>@@ -356,14 +356,14 @@ static void xe_device_remove_display(struct xe_dev=
ice *xe)
>>>         xe_display_unregister(xe);
>>>
>>>         drm_dev_unplug(&xe->drm);
>>>-        xe_display_modset_driver_remove(xe);
>>>+        xe_display_driver_remove(xe);
>>> }
>>>
>>> void xe_device_remove(struct xe_device *xe)
>>> {
>>>         xe_device_remove_display(xe);
>>>
>>>-        xe_display_unlink(xe);
>>>+        xe_display_fini(xe);
>>>
>>>         xe_irq_shutdown(xe);
>
>           ^^ and here
>
>but yes, I do see _fini being used in other places.
>
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks for the review! Pushed to drm-xe-next.

Gustavo Sousa

>
>Lucas De Marchi
>
>>> }
>>>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_dis=
play.c
>>>index a453946ad108..37278f73cb39 100644
>>>--- a/drivers/gpu/drm/xe/xe_display.c
>>>+++ b/drivers/gpu/drm/xe/xe_display.c
>>>@@ -132,7 +132,7 @@ int xe_display_create(struct xe_device *xe)
>>>         return 0;
>>> }
>>>
>>>-void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
>>>+static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
>>> {
>>>         struct xe_device *xe =3D to_xe_device(dev);
>>>
>>>@@ -164,7 +164,7 @@ int xe_display_init_nommio(struct xe_device *xe)
>>>         return drmm_add_action_or_reset(&xe->drm, xe_display_fini_nommi=
o, xe);
>>> }
>>>
>>>-void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
>>>+static void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
>>> {
>>>         struct xe_device *xe =3D to_xe_device(dev);
>>>
>>>@@ -204,7 +204,7 @@ int xe_display_init_noirq(struct xe_device *xe)
>>>         return drmm_add_action_or_reset(&xe->drm, xe_display_fini_noirq=
, NULL);
>>> }
>>>
>>>-void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
>>>+static void xe_display_fini_noaccel(struct drm_device *dev, void *dummy=
)
>>> {
>>>         struct xe_device *xe =3D to_xe_device(dev);
>>>
>>>@@ -236,7 +236,7 @@ int xe_display_init(struct xe_device *xe)
>>>         return intel_display_driver_probe(xe);
>>> }
>>>
>>>-void xe_display_unlink(struct xe_device *xe)
>>>+void xe_display_fini(struct xe_device *xe)
>>> {
>>>         if (!xe->info.enable_display)
>>>                 return;
>>>@@ -269,7 +269,7 @@ void xe_display_unregister(struct xe_device *xe)
>>>         intel_display_driver_unregister(xe);
>>> }
>>>
>>>-void xe_display_modset_driver_remove(struct xe_device *xe)
>>>+void xe_display_driver_remove(struct xe_device *xe)
>>> {
>>>         if (!xe->info.enable_display)
>>>                 return;
>>>diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_dis=
play.h
>>>index 9e29de012df7..de835d459255 100644
>>>--- a/drivers/gpu/drm/xe/xe_display.h
>>>+++ b/drivers/gpu/drm/xe/xe_display.h
>>>@@ -14,30 +14,23 @@ struct drm_driver;
>>>
>>> int xe_display_driver_probe_defer(struct pci_dev *pdev);
>>> void xe_display_driver_set_hooks(struct drm_driver *driver);
>>>+void xe_display_driver_remove(struct xe_device *xe);
>>>
>>> int xe_display_create(struct xe_device *xe);
>>>
>>> void xe_display_info_init(struct xe_device *xe);
>>>
>>> int xe_display_init_nommio(struct xe_device *xe);
>>>-void xe_display_fini_nommio(struct drm_device *dev, void *dummy);
>>>-
>>> int xe_display_init_noirq(struct xe_device *xe);
>>>-void xe_display_fini_noirq(struct drm_device *dev, void *dummy);
>>>-
>>> int xe_display_init_noaccel(struct xe_device *xe);
>>>-void xe_display_fini_noaccel(struct drm_device *dev, void *dummy);
>>>-
>>> int xe_display_init(struct xe_device *xe);
>>>-void xe_display_unlink(struct xe_device *xe);
>>>+void xe_display_fini(struct xe_device *xe);
>>>
>>> void xe_display_register(struct xe_device *xe);
>>> void xe_display_unregister(struct xe_device *xe);
>>>-void xe_display_modset_driver_remove(struct xe_device *xe);
>>>
>>> void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl);
>>> void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
>>>-
>>> void xe_display_irq_reset(struct xe_device *xe);
>>> void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)=
;
>>>
>>>@@ -49,35 +42,21 @@ void xe_display_pm_resume(struct xe_device *xe);
>>> #else
>>>
>>> static inline int xe_display_driver_probe_defer(struct pci_dev *pdev) {=
 return 0; }
>>>-
>>> static inline void xe_display_driver_set_hooks(struct drm_driver *drive=
r) { }
>>>+static inline void xe_display_driver_remove(struct xe_device *xe) {}
>>>
>>>-static inline int
>>>-xe_display_create(struct xe_device *xe) { return 0; }
>>>+static inline int xe_display_create(struct xe_device *xe) { return 0; }
>>>
>>> static inline void xe_display_info_init(struct xe_device *xe) { }
>>>
>>>-static inline int
>>>-xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { re=
turn 0; }
>>>-
>>>-static inline int
>>>-xe_display_init_nommio(struct xe_device *xe) { return 0; }
>>>-static inline void xe_display_fini_nommio(struct drm_device *dev, void =
*dummy) {}
>>>-
>>>+static inline int xe_display_init_nommio(struct xe_device *xe) { return=
 0; }
>>> static inline int xe_display_init_noirq(struct xe_device *xe) { return =
0; }
>>>-
>>>-static inline void
>>>-xe_display_fini_noirq(struct drm_device *dev, void *dummy) {}
>>>-
>>> static inline int xe_display_init_noaccel(struct xe_device *xe) { retur=
n 0; }
>>>-static inline void xe_display_fini_noaccel(struct drm_device *dev, void=
 *dummy) {}
>>>-
>>> static inline int xe_display_init(struct xe_device *xe) { return 0; }
>>>-static inline void xe_display_unlink(struct xe_device *xe) {}
>>>+static inline void xe_display_fini(struct xe_device *xe) {}
>>>
>>> static inline void xe_display_register(struct xe_device *xe) {}
>>> static inline void xe_display_unregister(struct xe_device *xe) {}
>>>-static inline void xe_display_modset_driver_remove(struct xe_device *xe=
) {}
>>>
>>> static inline void xe_display_irq_handler(struct xe_device *xe, u32 mas=
ter_ctl) {}
>>> static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_m=
isc_iir) {}
>>>--
>>>2.42.0
>>>

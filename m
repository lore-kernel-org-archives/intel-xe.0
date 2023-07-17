Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03A7EB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 16:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9D610E03E;
	Mon, 17 Jul 2023 16:35:42 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB52010E03E
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 16:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689611739; x=1721147739;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eRPkOB3tqaxZhSzXe0njnBE3rcf0nbr0SHtflwOlIS4=;
 b=DoUD+bF7h9I6RnJQYBYlutl0kut0i3QnLFT3gavsf8apY+LQu8MToTEX
 Rj86duTglfxaB42N/0zP4uRxqlm3UPiqmfRXtB+TZIRLB86NJb5J0sQg8
 TszRe2x5wxtbOlunruQXH/oHwPEe0tc4tNWOrL4ui6Gi6q6aVwIYsbVTj
 ELvxj/milEya5tersKQ2hIQ+L0/CZzqhKXF5zqsEYdlWZareSPnH4Vkcy
 R16sYbHyYSh3C+0XkAAUunmQ+irU1MqE6HrBKlLCNIYHpLIh9DJD9HoZW
 +7Tgzinz6fSozo54lWXEOtv5vYbqJFjowUc4O8XHNttsbxbFWUvy8IObH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="345570355"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="345570355"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 09:35:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="723272098"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="723272098"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 17 Jul 2023 09:35:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 09:35:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 09:35:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 17 Jul 2023 09:35:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOTStw1rx5S79uRbn7HIcD7i0buMbjSwqiAe59yql3nxv0wLHS8R/ck2ujUjtXJFodfyTx7esVpa/5mtv+UGwcMkuDnLujrEj8FL4q4bF8EsP++G1ufrrtcPXXRE7+ieftUW+qZ8CyRRr54tLS38id7TIAqM+najbZXvVA6tWlGbaixRV6b9j1xYWMUpzQj2jhVMoYNDQ01LgUMidU6LSSRc1jspuBTBBddcDu4n3QuG2lPzLhUiQhW6Z0TXIPGVYSiaQNuLGw7V1053z2kgrlPa7hiDX52CYJ19hi7J+IfPpD8vGqlBUwtzFAQljCFFZd9xzx5DLzxbWrsfOafSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KecnWhdzrf1gU0p3FJ1bcUvX0n3SNbj8A9/M2MRB0lw=;
 b=WVY1vzCsrhRUC+syrhIbazLQ+Ih/oRFSdf1Kvx9o20q15EydynxeVgcn7jgFxI8yUxhHgwGmGSYT2eJiIZWirlLq7RcwE+9SowQaQwd2D1XVzQtU53xBK8vD96Lf1WCgCDU2lclNHiYyDWeY2O90EtEXcN58ORiX9KUBBIhQ/xbur6RL3VFBrp+A59NqvKUkrl0y+/bBDc64reMIzllTI8210GM7+SYA6eXXqg7bx4GTELx/liwvEPN5e91nc7I10zujQPKn8VNLfGL8+t9/C7AXP25QpZvMOLUviXXQKPaVdtLkQnV/gmLY4vqBFArLRMNNB8ZPuM0tKN5CPFjJGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ1PR11MB6084.namprd11.prod.outlook.com (2603:10b6:a03:489::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 16:35:16 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f372:3cde:c879:be51]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f372:3cde:c879:be51%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 16:35:16 +0000
Date: Mon, 17 Jul 2023 09:35:13 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZLVtwZnjcU6QXvIJ@nvishwa1-DESK>
References: <20230624014137.11358-1-niranjana.vishwanathapura@intel.com>
 <ZK2H4OcUb1TY82x7@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZK2H4OcUb1TY82x7@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR01CA0011.prod.exchangelabs.com (2603:10b6:a02:80::24)
 To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ1PR11MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b1b6711-c92b-4b10-ffee-08db86e3cd67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Be5XH15cMBzRBLKLimZGVM5Ub1NW38UP4O0/RBp4RVHmyA1rrinHZbxDXLwquvl+V1ZVuhGOr05JKuqwcKiDdrcnmv24uLoG0nK5Qds7P2xDOeNULXMazYZB3CMc1JBBxE0X3vmfqax7LzxpcmuVbeSBgEc0tMIDYeGrfIiGFW3y2iSm+NN5QPAJG2qy4gHUe+RdnbDkl5OdK7EYAO0StQ/j+//Bg8ZT58NkYm8T3ft0ExNPgaVxm1qjfeSbDKWwBaiYX3mpPl4HMr7WBMroQC/J1w2JkF9S+kxB1PG8oyKoYupqQ2kb+NGsQCtetd+00wG0b0X3ukZ+NU1ajL2VSs7o9iozktEMoEK+Mx10tmjr5qQaLUXklObeSs7DcZz9gN8pRXTFIrcPyC9DQLoLgL5GotijmRcQhCOlBmT/l1ZoyXNaHTgOutEPsiVNyVwRBmhtXloYJftQdv1rltOcTwK7p27h6OG2QsGQCkBdK24eNayh2sP0tuvTRnkxvI4stV2dHHdxnz1jqQSQtP54trlW7Iw7c5/HLScN5KBm3eo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199021)(33716001)(2906002)(478600001)(6666004)(6486002)(8676002)(4326008)(44832011)(316002)(41300700001)(66556008)(66476007)(8936002)(66946007)(6636002)(82960400001)(83380400001)(38100700002)(6512007)(9686003)(5660300002)(86362001)(6862004)(26005)(186003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yvfCGSXM8hDg58fqhTwhJMIgXUCrn0iA5F8H94ksmbrVIVKwOBYbFyRz7k5C?=
 =?us-ascii?Q?0Dk8GJEq1oW7KQZKQY1lRHfyHda2SEPvzyxlN9yNLGg3AcJWijJBAtHXEoel?=
 =?us-ascii?Q?O0Ob4CjDxCG28VD7lmHywQuG61vAbsBEgGHvAxpVcdV8p2Vg7SJc5RzmhGq0?=
 =?us-ascii?Q?BS3u31nM7619hA8YQO8LYmQ0Uvf5dRA0ynC0f/Ary8YZygWq3z86tYgO4k2x?=
 =?us-ascii?Q?qBTWbwHddmiNoNZXZAq2Eo2wPFEBNkGrrDllbHXi0NgCxBzP/GKuyU+iKlXX?=
 =?us-ascii?Q?A79ISS8K/YNYmlUF/msg9zoeIPiCcE0HBA3oDtSfYsuLuXPVbO+bTU2vSFXx?=
 =?us-ascii?Q?R3B/QnQDpwDLSCkJCvTBFAX78sw++e30AO5C9rnTVGlVAUJy1CqlrcWELwII?=
 =?us-ascii?Q?BA0KUVHQ8jGLXYOjXRxeqUhRyexhU+eSQmDjnP6DMC2tjY5UIcZCMibNkwG6?=
 =?us-ascii?Q?NBfZsFeQVoWgpTfBgzKJsMs+kO61Uj86bvyz64pIdDEcA2SoP4mixfLb6ds/?=
 =?us-ascii?Q?DrfQgkxdcEOiQYzXL2ViCw3wvvFhA+/WTlo7QIfIY2M35piK66iRacbZYw5b?=
 =?us-ascii?Q?Oj55Q8WgOnuGemuQ0uPk4w33l8rDv3pMlCGUIGq6pgAOqCK9/ywIDDohsU9V?=
 =?us-ascii?Q?242uhk52cGCkLqaKW3MkhDWWfIVeaWRG2L7Xq8ZK0XgE/hVVFQuol9DhWPLJ?=
 =?us-ascii?Q?tHkEL8aiY9wjc6iod9lB0avq/EQFcHzlnoTy0Flg9hF7G9VJg2qfnjGGznIW?=
 =?us-ascii?Q?wFs324SflS2Jz9/IpsZGOaTmLNQxwtpGtDY1Mgkv5sBK83DkjxaW3yZ/6VSk?=
 =?us-ascii?Q?npn8VAcrpBIpeyc/FshVCPGZP+RoVw+dM+oTdyBTTpIb+4lJVmnTdhqCYHSC?=
 =?us-ascii?Q?p2BN24963gC7GvsdxgA/h3A1WPXuVo4YMJukBwMSY5GwCNp4F8yf9q/IHOXc?=
 =?us-ascii?Q?V1oaozBGn0STPuDRMPOM7FX08Q9DgfmNZvqkysmA2EwkKjPwUgAZK1j78KBH?=
 =?us-ascii?Q?k+5TDBSf+aj0nCK8TmYnPU9IAfW7wJd0uWMVJsl3JZAtrV+ncwEx3HMIe21i?=
 =?us-ascii?Q?gyvYutEP/qBDM8CiZMHDnd45vwVXPIRWenhCfI3A/KNXgg1SlslE/82ca35D?=
 =?us-ascii?Q?SbvaxqkgOivR12eGUAd1Y7F65gpxTetLY+i3kTgmmmYAZEdkrITwgpnFzFmA?=
 =?us-ascii?Q?h8h9rzv0e4EDUeajgAWCXU6KKAHgWZqBPWb2+eI7W8vH1JMtlBv72BuQ3uYh?=
 =?us-ascii?Q?Lcwm7M6GnnAXG3+ZmMwVnxGMMdmLJmgNZ4tcP4v3JfAr4yoWjs7yYzzxlmbk?=
 =?us-ascii?Q?PZYoU8oaG9t8b9Wxvx+lAgh1TKtW7bq9xxITfdLdWdt7X3T7hB2fSxKKPq8W?=
 =?us-ascii?Q?iNSuMiGRTbKCeUvpxA8BhSiaA8JrwRjCVpJPt62Amrtfp/lNLBcfHbtvxUm3?=
 =?us-ascii?Q?poj4pffkaHiSz9NhTH3Yf0ZJTx2A9cvRvzJS+fZpfZyXUzhQUtQl9w0799/Z?=
 =?us-ascii?Q?Giwv1a6ONaHqvWE+TmoftbAZBIJSX09C+Zh5gFfiUNaf7RM9FoYRSueNd+Br?=
 =?us-ascii?Q?KEs1qZO+x4j8VWZBB3Wm7xsoWhkPUnM3vjcFFQ4KqkjKHJrMEaidVHspKQya?=
 =?us-ascii?Q?e+30it+Wa0PG1ktCid1xST0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b1b6711-c92b-4b10-ffee-08db86e3cd67
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 16:35:16.6324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IzEEW3GhD6z+nkkKMXq4idpw3uclaSmcyV+fK3aG3DfaGyKI9I2X8yS+E2OOHh2BbiAL+VDPo76T/2bxRm9XdElp4yxhWRaNK4i7XsdWA3i/X3b6lZ4oTiGMuwWc7TpI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6084
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe/pvc: Force even num engines to use 64B
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

On Tue, Jul 11, 2023 at 04:48:32PM +0000, Matthew Brost wrote:
>On Fri, Jun 23, 2023 at 06:41:37PM -0700, Niranjana Vishwanathapura wrote:
>> Wa_16017236439 requires that we update BCS_SWCTRL
>> (via indirect context batch buffer) to set 64B
>> transfers when running on an even-numbered BCS
>> engine and 256B on an odd-numbered BCS engine.
>>
>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>Can you include the include a version of thia patch in the series?
>https://patchwork.freedesktop.org/patch/528460/?series=115575&rev=2
>
>IMO it makes sense to merge both of these at the same time.
>

Ok, will do.

Niranjana

>Matt
>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 +++
>>  drivers/gpu/drm/xe/xe_wa.c               | 8 +++++++-
>>  2 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index 79873bf64e8d..af3cfc696692 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -59,6 +59,9 @@
>>  #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>>  #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
>>
>> +#define BCS_ENGINE_SWCTL(base)			XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
>> +#define BCS_ENGINE_SWCTL_DISABLE_256B		REG_BIT(2)
>> +
>>  /* Handling MOCS value in BLIT_CCTL like it was done CMD_CCTL */
>>  #define BLIT_CCTL(base)				XE_REG((base) + 0x204)
>>  #define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 9)
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 5eaa9bed9d12..341877acf05d 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -518,6 +518,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>>  		       GRAPHICS_STEP(B0, C0)),
>>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
>>  	},
>> +	{ XE_RTP_NAME("16017236439"),
>> +	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COPY),
>> +		       FUNC(xe_rtp_match_even_instance)),
>> +	  XE_RTP_ACTIONS(SET(BCS_ENGINE_SWCTL(0),
>> +			     BCS_ENGINE_SWCTL_DISABLE_256B,
>> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE))),
>> +	},
>>
>>  	/* Xe_LPG */
>>  	{ XE_RTP_NAME("14017856879"),
>> @@ -525,7 +532,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, DIS_FIX_EOT1_FLUSH))
>>  	},
>> -
>>  	{}
>>  };
>>
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>>

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0547FC77B7F
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 17:10:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD6610E03B;
	Fri,  5 May 2023 17:10:28 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE3210E03B
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683306627; x=1714842627;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m7cqCuZtqF4DrfuBJukCRmVpPtxY7H/QQEeV0d2WsXw=;
 b=nLt2+RgVgkBtbvGTBqWU6scHQJ/egjUTIKqNqRVVFKA+T1+zxkafhwo/
 BidwlNPb0CSfNq/jy0vJAffI+OeDjmgNHMeB/qPBrq33wDMleCmbxqpcX
 sMSMRKMrxA7K3CaUauTjWkXXM1JcjBQEK+yICfYGWgyvGghQWK0BvBRWo
 WyIsCbTqsg0CKtqwq3JEYEMBc8mFfo67DimzLV4WSeRiM+1dN7rzk4BOO
 ikjpIscvEefDtwezkHSmXhxOHUuW1Xk04mXRa80Lacb7qGfoM3C4UNDzt
 q7/jAW+6oQrPluoH/2GVS+UzT+3HfLlXK9qLbbPn/0lBqVGJWpvspvtOa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="349295560"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="349295560"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 10:08:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="728163064"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="728163064"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 05 May 2023 10:08:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 10:08:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 10:08:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 5 May 2023 10:08:55 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 5 May 2023 10:08:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVggi2rsadr6I3WEvAvD/9kxVG5LFoGyghxJwTtJ2pqxANfowAaluWhTg6z7L8TNgpjij5IUeijQL6bSkEaCgDLMZIKmQzfXZxo5qmqylxldXpMvpO+wn3FDxOIDwMT3wkgy6F4O6U/LJ2Uze60XyOBFUs9v60KYubsPrRnqnlFdPYGpfQo2R3vCEFX9+hvGQc9h3ANnxS2xRhlkqDvcwTDxnX8ieQpFIPEKGrMYlCBwzurI/tAZxz6tiMFGP61MJFD9jkW/0hycGn+Gfkp2DOHFILZ2sP6tW45fqSYOdwallVup/HGpXXop1tIj4uMW0BKj6UYejS0Nb/6+T+AIvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0z7ouYkzRJL2cUHvzXIRJfzQsVzCVzXGATnVhafT4cg=;
 b=lA+J/ZJWnW4auQXOd1bqc/vvIbwAIZBc6FfoQ0u8kHOC7SRdoHdjcStyxIDnpd3mSAfYl31kkaL9KO9V5J2+DJJ7FQDUxSmsNCbgNhaEFB3Wdqp1V0MsCRY4sRdQolz88AFflFaNwFIOy9aIjOnLc+D3kxSyCPEcrtnv76yb2nI4+Ygt5635r8K7SmitowmpLFl+fEPQTw2ombBH7IF3AoBqDmIdLOGsR2XYKrCblYTGf9WvCn9Ag7NfdfFmtO4jpedb3yMGvgWSotnyU6MkbQxx7LIQMZTB6UxVtPELqnG9iVlgg8YpOHxtgWStE9HqrYqdrLsacMiS6zp6oc52IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6650.namprd11.prod.outlook.com (2603:10b6:510:1a8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Fri, 5 May
 2023 17:08:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.026; Fri, 5 May 2023
 17:08:50 +0000
Date: Fri, 5 May 2023 10:08:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Message-ID: <fies3nkjy3spmq7w26n7kut4endjgm3wq3uku3lghl25ykqev4@s5ub2t3de6hn>
X-Patchwork-Hint: comment
References: <20230429062332.354139-1-lucas.demarchi@intel.com>
 <20230429062332.354139-3-lucas.demarchi@intel.com>
 <ZFU1ANfhoovA6r7I@rdvivi-mobl4>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZFU1ANfhoovA6r7I@rdvivi-mobl4>
X-ClientProxiedBy: BYAPR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:40::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: af427b6a-64b1-4dab-3439-08db4d8b65d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mimNoYArCYTr96w7exXnJqiGa7xzVyNkNlopJ7BSkLwvffTnBXsZQ5M4AT0GLnUS2zaxGMKVUsg0VkmjvskXzriM6XWB7cKjXNTwLxsARnCGXqAxKQrUCAhIKxFTPErgr6Rh3HwJHQ7nvb432RH9Gm8wTATBe6fhhJsVqqtO4y9Hrrp5WguYLSPhocEOzKbtDifP9a+usF7AQfvUCSStDheMSqahvdYtr+96wIH62UKQPd0E70GIHboQISbf7kPmg7CAJ+xVlSHxx5yxJOFiheQ1ROaMH7zymTG1SGh8KdkTsUYep0ZX0pYJsxS8vyYK5FN7T1qDxes0YpuUppxB5+P7jcbWA0yAZSt95Mf5AdnOfP+g2ZODz1kG7uzifZZRqy425/OAv0nSnQv2H13m1FC+88Sh5NN0DbMvAawN3rPS8XblfQAVS1lYyBOjlsSNTYyHD0W7QB7cLejM/Hj/l5NH9+TgijpUn+5bAGSbT+9Lz4FGqZq9M73nbRIUiPeE3WLxPsZ909oAaGF1Dnofl2v/jlwT0qYeGzJWqMmJNy4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199021)(41300700001)(33716001)(6506007)(9686003)(26005)(478600001)(6916009)(4326008)(86362001)(6486002)(66476007)(6512007)(66556008)(66946007)(38100700002)(316002)(186003)(83380400001)(5660300002)(2906002)(82960400001)(8676002)(8936002)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GSrwmzK4wUEZXLjj4HhrnINj5+QgrtwDoY5aNQWDA628Dgl91Sub2jfyRCmY?=
 =?us-ascii?Q?8P2mJFMZl62TRLunT1J4jcdqiOaVdWcv4eU76m927GWACZmKaZWVwpIThAf7?=
 =?us-ascii?Q?nq6fmLDuBgmvHxqlHGokUQvY0o8sLwExcTx7GbC+S9n7Odq2/EktNCdfE5wk?=
 =?us-ascii?Q?34mnm73bSNPtm31AULPmSZ3ls5I9pR/IrCC73ts2YWPJPhOWU6NbrrIwzAmI?=
 =?us-ascii?Q?t6Mt/qyckgsnzjvxj0cdOMCFYEVSf3hx3TaJmF4Q9TAPDeWT215Nn50WWzGK?=
 =?us-ascii?Q?DsAZHh9D/OUThqx14/S5LjoyyB7z3c5una5AwVSabYkz7BedskNbZesG9uXS?=
 =?us-ascii?Q?X0oCNquDs6EooantbAD92ghrioP0kL+bN/EeOLbeEV5SWXAeCWrgNl2EvM6m?=
 =?us-ascii?Q?ypBrnNRkqOhYVVqORnj4kL+hZIc+JmxnmUTZryna9Ak6weScSzaA+mLWV2+n?=
 =?us-ascii?Q?bXnT/Ix2SI9c3wmAcVTc+YLCWPard4KESvqKSh3RGUeGZ5cmUBfH5dltyI+y?=
 =?us-ascii?Q?k4nxTgeqiaSs2+iB+M9x/mGr/Wct0PpyJUFfnBZ9BSQEy1taSRYYh/l/PIKL?=
 =?us-ascii?Q?85VyuJ0gC+IsqcKFsZg8aWFv7nDugAuUKy7NglBd8b0TjJpeYcUAbDhqZjkV?=
 =?us-ascii?Q?2K3fRWIFllp8prv2tguOmQZtgnHEZR80a9hSb0/LO7wzqvt61pqeP5JvxdWm?=
 =?us-ascii?Q?HVgvK8cpJYBI9X1ycQYSTcLFdDdZ95d4O7DMPxiqvK68fG1R1HKbOiWGUYyE?=
 =?us-ascii?Q?BzcI3VQCE7LHQVhwfFnPt1kTd2ufbdReCKm91DGmlQY1JngvwJo3Hojz3AlW?=
 =?us-ascii?Q?ApfWuWqon8mHlrYKmrJ29G4m/Y8OS2CHHcFSi9P/mRfEtRSPoUCq2qm6XtNz?=
 =?us-ascii?Q?eE5zKRCXwQ8tuf7gPjEjIuicSkOvAlNGON6p6uwG+Ojr7tjGYHtF00O0wirM?=
 =?us-ascii?Q?rmVgx9MfgbK5dyZ4FFCUJuhD/bPbHwforMa6q2Cr8PJUypmFB2Sa2/fD6bga?=
 =?us-ascii?Q?VqoUGZDZQJ4Dyxz1KPAnQo5EKwf4FyqzdAF9LQh0xF+Jav/fs7+wrxTRU6yv?=
 =?us-ascii?Q?VqS5VopKoneLNIupdzzapTMMeiCXmQs53pSOpVhWZGRveL0rZExOqMXsPNDn?=
 =?us-ascii?Q?zwahtM/X/g48+hSWpUmkwLEWkVOHHa3Qa7ZcUu2cUFuW8xbbLd8XaZQxyN74?=
 =?us-ascii?Q?lzQy5ss+R0Fcdnad14baKGkznBEXcc6caciS6yALXegXkV8w++qfs7Xml+tD?=
 =?us-ascii?Q?MgIy9MBsM4G6JU2SAuCefGVWzGtvZ8S3GhpU6dEUDQ4sS7MBx4jXNatmG8JX?=
 =?us-ascii?Q?AdA4NcZVwshv6I7vhBtLzu/8/rjXvC6oDIhInkpbG6e/gfSh6mtm8eiio+Wb?=
 =?us-ascii?Q?MaQOIe79ZwtLLs90//Z31OX99ZmoCBfOinPf2ERMd0nsBCxrlmQwlQNuqRrg?=
 =?us-ascii?Q?PlxljXpmtkAhbKaksKG3mluIWk4j0ATn0QF9Fy6uXVi5EC7hwnWvXMnO46Lh?=
 =?us-ascii?Q?BOZ9zijTdd3H0ik6q0X/oLRSY7DotjXAwrAa6P9NH+9frfi965pNy0coiFxL?=
 =?us-ascii?Q?6RVjrSyu1wkZpGLszzS4eRKffxYtcgY+q5lb3xO2IcZJ6x19r7wnEhiJZtMW?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af427b6a-64b1-4dab-3439-08db4d8b65d5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 17:08:50.8926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +aM+3h8RGtIR2FP0ttMpdds/q7VnZjk+XbM+n+GOt7eeXX9rjJGK+vdwSo1hOrDLkMVcDq8SQKZ2iLoFu/zvcj3X8Lv0PVsmQk557nGCWvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6650
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/7] drm/xe/guc: Handle RCU_MODE as masked
 from definition
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

On Fri, May 05, 2023 at 12:55:28PM -0400, Rodrigo Vivi wrote:
>On Fri, Apr 28, 2023 at 11:23:27PM -0700, Lucas De Marchi wrote:
>> guc_mmio_regset_write() had a flags for the registers to be added to the
>> GuC's regset list. The only register actually using that was RCU_MODE,
>> but it was setting the flags to a bogus value. From
>> struct xe_guc_fwif.h,
>>
>> 	#define GUC_REGSET_MASKED               BIT(0)
>> 	#define GUC_REGSET_MASKED_WITH_VALUE    BIT(2)
>> 	#define GUC_REGSET_RESTORE_ONLY         BIT(3)
>>
>> Cross checking with i915, the only flag to set in RCU_MODE is
>> GUC_REGSET_MASKED. That can be done automatically from the register, as
>> long as the definition is correct.
>>
>> Add the XE_REG_OPTION_MASKED annotation to RCU_MODE and kill the "flags"
>> field in guc_mmio_regset_write(): guc_mmio_regset_write_one() can decide
>> that based on the register being passed.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>I'm still trying to get familiarized with XE_REG_OPTION_MASKED
>but this patch looks right to me:

basically the definition if the register is masked or not comes from
bspec: if the spec says the upper 16bits are the mask, we add the define
in the header saying so.

XE_REG(1) -> creates a normal register with no flags/options
XE_REG(1, XE_REG_OPTION_MASKED) -> creates a masked register
XE_REG_MCR(1) -> creates an MCR register: here it applies both a
flag/option (for places that deal with that in runtime, e.g. RTP
tables), and a different type, for the rest of the driver.

it will be much easier to eventually convert to an auto-generated
header so these options come directly from the spec, which is my
master plan here :)

>
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

thanks
Lucas De Marchi

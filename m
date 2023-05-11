Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687B1C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 23:23:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CA389130;
	Thu, 11 May 2023 23:23:32 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263DC89130
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 23:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683847410; x=1715383410;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BhDvZQFJuVCUnQ+5ZqiyVlmoid1w3djQqb4p1FJjEbE=;
 b=ilsptN8v+B6JKZSC0zXGgME3EWAkNa/8Pxq43UM9MvhGvDCvFR2RmFPQ
 T9AIEr84EHbRuLVZT3duN8EY/lTj5RzJkiAFunrq8SpE5R0N9t2nzR61v
 tfs4CtZ8H2soI+3J1fIiP0g5kVQDEszAnNZ7oaS0bW3myWmiPEN4ka/JN
 ZWX7ZT6kslVn6XtMVjh5bcMlF1J/rX/Puf8K8TNCBNNoUahArPG7/eGRb
 uj2f6U0eSpQ1Prdmq1GFK7zkhjvEK+lERDuExLX1wBCNNXZMt7FHfxafD
 cOwIn7XaoBpOp7W3WK/TItIjPeoywE9pnL5Z3LUn8Muy7lM0yY9KCvcsf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="335167728"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="335167728"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 16:23:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="702938124"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="702938124"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 11 May 2023 16:23:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 16:23:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 16:23:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 16:23:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hghT8CgLkAAG4OGMG85ngYVPAGEyySSSqHE1UOxbHGSFAROneBsqA8swAryQsCQksEI1SHJHogCIPAXYoW8UkC3MjcUg3F5324mk33SxYILsQUG4aJduv5xjZVHNYiMU5S+eRVnkx7lGC5pzVpFeG1jHvkNnbfNeX+XrgPY7NneZWkeGmqDIckFu0QoGmL/HF7NNPgt6hlN7O2ifSaTkvNiAPkjCQ6ATdXqeoBk+PCDiTh+hpTkDupvGCTbIX4uXqjysI5dLyeJGCsReCjo/QLJQICiB4mi/PvspBhkzd8AVaLBrI8uqKNC5DgSLCVMLfnlXNJenFpwQ0/o0IR2b5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvs09T+pUJqljvdl6OZclXePmQ9nX3FKVgmBsaZbY/8=;
 b=kAS4toTnYUWhvKxBZ4IGG8FUyd3D3XTAuW5jQSa6i+CSshiqCKO1Q+qrQV2MArL+/Bn6OnKZHfDffufyknVo4gWaviMgZqLVEbRg9FQJlV11ibc/Md0JOaEIQ/av8K7A4HcddoocgStIPdQwMUkIi6m541pZoYhgeQgMNo49dqrSdXjsneG1HrRxcuSSxoMVeo13ZzvqeF/fVJ2HTIJdW6Nu7bRTXluauEIsSSDwemXINQRj0nszURLHJIfnxcOxOHRBUPb3hF4JiyXnYRFfVlDdSMEzON/bouWV45u59kUVM1Dp0bF97F57YM8tJoeGKnXrOrKKbqizMJxinLCSJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5929.namprd11.prod.outlook.com (2603:10b6:303:194::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 23:23:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 23:23:18 +0000
Date: Thu, 11 May 2023 16:23:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <q77ej3xk5tn2vnckxutbm2734es6ynwhrjaoytzg346kr3ttju@qdtl6os5v65a>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-5-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-5-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY5PR16CA0013.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5929:EE_
X-MS-Office365-Filtering-Correlation-Id: af29cfa9-a2fa-4121-c193-08db5276b3db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /HipMXc44gERdM1yKfkGAZfeE3H9Pl0bv1IN7wiBdLdN0p/UmzXahoxcFadzZmYY6bbSJsnJv4NzKt6gwElxDtLHMq6UjVb8D6pXfHmEO3xiEvGPVk3MwpHsrh8yFp1HDryVFZJuv/EJXfhUv66xmYO51pJyN+tXs73ajAfdTMOKXhLdORcb36PY/jX6nH4kXXqEa9Po9Ro+R76IpgDJlzi0Tr0KLadCLUKIHo3w9+dm22OhSW+LoHiXFda5YtqH6SZFo1SkBxbf/TBs72hY4duBQ9/p+/NBlsYq/cy20arb+MTLB0jVfZ/RNAIl+W6CYQGLUzrFfOjTNOBuJGpbuxlnUoU8sQ3W54FEdMFsqxrubLXvKMurZgRa5A92nCbUQpFT64GVmpO45uD+S8KIb9qQRysaoDnRorhQLYtbxxybDBT3GW603uLUPv2lH6yNM3oq9LiGg2MCT2awD6y6hATx+mGQ2MK2qyHnWkjVcH/8v28CYnKZh7tZ0nCdB222kUD9QKUBZ0qaLWotkN2VyRW0DYuvHmQcsrTf8faJCei076Y1ksdSgx+9AQEiDzbO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199021)(38100700002)(6486002)(6666004)(5660300002)(33716001)(8936002)(8676002)(6862004)(478600001)(316002)(82960400001)(66946007)(66556008)(6636002)(4326008)(66476007)(86362001)(2906002)(186003)(4744005)(41300700001)(9686003)(6512007)(26005)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JMDvQfDQsSaiVcLMZ6du1mBWatAzrL3fq3Eo9qxvsT/olspAifWt/nlGUb8W?=
 =?us-ascii?Q?HRWkRBrptLPxy/cZDktuBPgcMJgkvVLRdS0Jjx/9vqqWOT4qnNFs+n5SqUWj?=
 =?us-ascii?Q?qkJ9mLnoPGZdQJ61vXuomkCpTugzXk/nfhtS6Dp2h1YF2y266u9dcYreQxS/?=
 =?us-ascii?Q?mMTM3ojiVPupUtscbihib/tQXGqhngQQ8TCHKmx6l81EHzs1XEeugi8s9arY?=
 =?us-ascii?Q?lyD+F+GRKdgqDECY2GokkujpkXtYlxLeMsh5UPzdEil+ibzPHQ6ktBxpDv4K?=
 =?us-ascii?Q?cRbSiU++wzYwGpUpJr4tRmEKHlqYDUMJJ7+lF/38GAcrluPpVsdeKE9tU5b2?=
 =?us-ascii?Q?tTJk+rWa1DXVCQS9bZQDttWlxElFz8nJDMZNoqgBUpRh7ofyZ2O3TGeREw4T?=
 =?us-ascii?Q?UUNWA4LeUqdtaKeBphBVralufAqyq6of9q13jDW4+/gcXLY5AZW5He4l2iwd?=
 =?us-ascii?Q?Dw/6IA1/kuRWfsP630fRQ0QBX/mSivFaszcwWvlEiIcdDqB2yXl+D2/cdVis?=
 =?us-ascii?Q?nRBoQWiH1kTg+pAeFAHMo1I9C7x3eqUcaGD5XtQ8Pj0pzRHvbAWs27bFLlCM?=
 =?us-ascii?Q?aHWUHxBkegRq02e18bN0dkd2sRgzHqxYzmTXRigwb0RL8/cHGcKnPr/HMJIO?=
 =?us-ascii?Q?vnRpHcAAZTxW+BNf+40FZutZh/D25ycMdv2DoTnKSiTq+0Cqbr9WpY/+YKDe?=
 =?us-ascii?Q?dFOlGAm2wOAb4MqSep74d5qEXlfshE7rzdVhwj5IAQ48SDfvLMwYj/SB5kCx?=
 =?us-ascii?Q?VwjU4KO7x2gKy3dRC2BVRXhq3R177nuaM0SJpV4ORSqQe2NBQAt+/uSBYsHS?=
 =?us-ascii?Q?i1G+1O15GNvtTMx74/M0WExRiCEVtNwCWZaddnDsCSxLWAeNXNv6E+Gw86qc?=
 =?us-ascii?Q?ZeU2MCkj0IZ0Qqn2YVDid+FVHxS1HQry9aiT88FOPdqLq1frOiL4T8t4SGO9?=
 =?us-ascii?Q?p6rqrHfPHCeuA2OvgOMRWz36QVTlPzwnbbEKOsxUcEaHwGxh+jryEMR1IZ+l?=
 =?us-ascii?Q?9bP8kFY5SGIhYEdjGEYxNWg9TJmbl3no/9RcdhPNwu+DFhjGWWCSLcvyevE5?=
 =?us-ascii?Q?1aU8W/PLMx43F+8QAY/dJZRqDshlJPdcF/tVJGpO7V2Z2g2IhhSJT7+Q3yTA?=
 =?us-ascii?Q?b3APtmli6JxbaNp9Aq7JfI7N965qgAWsK9/vIpVUGXQaxpM8zlsqa0DmEL/K?=
 =?us-ascii?Q?6TBGuSt5pxE2UsCwSRrLnWe+wB5/5oKmEIsn6+oZuQ9BkuMAEdQPIB+I6RBb?=
 =?us-ascii?Q?gWKQAv2A+VJf6PsUnWHW1M29w8BWGaHokRl/JFEFbcWi15R5ns/VklVdJEIJ?=
 =?us-ascii?Q?KQexk5NMsCb6eMuwD2BobEPN0IGt62YY1g/HjfmXbSXMDdyHJGtDC1+SRJ2B?=
 =?us-ascii?Q?wfn5PzOyZcI5+WqOhX41jyHTBDPeMGsRlWsZ0/j0FeVoAX22xv9qcUy+eZ2U?=
 =?us-ascii?Q?mB67CPNZh59Uh1TtMFm+PQNjxYQyw1UUKRJv3ZmSvNvB2UbvO2DQ5wwN8HhE?=
 =?us-ascii?Q?9+w7ojNe/hX8JCLxDBO5pDSwuiStDgkVCIkorJR7/WMNOQsHyMI0r4Jpcquf?=
 =?us-ascii?Q?MIGidEb0td5Oy/CuUdq7khfbWgKeBL0LhIZGxwSgQvFfxtYpJT1WL2loo3ym?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af29cfa9-a2fa-4121-c193-08db5276b3db
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 23:23:18.2051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EwvxbXnMHXaPMELAQG/oxm0BN2MhiwL7ORDlynepaw/A0my06G2Ww/GXEIbjVmH0bZd1k2/iyPusNgWKB0INpFbr0hX1TbWRGVR+YdAhWE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5929
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 04/26] drm/xe: Add for_each_tile iterator
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

On Wed, May 10, 2023 at 08:47:00PM -0700, Matt Roper wrote:
>As we start splitting tile handling out from GT handling, we'll need to
>be able to iterate over tiles separately from GTs.  This iterator will
>be used in upcoming patches.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C59AC35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 22:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FC310EA89;
	Fri, 15 Dec 2023 22:06:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD0510EA89
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 22:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702677983; x=1734213983;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QGpv9vtJW1owS18pGoRfV9oyPqGuLY94tnIhnJpinAo=;
 b=AemqkslNKMz/ZfGU4+ml3dD5f1zp4I6RVBWHHOoZ0y/gC6rFzrGL7iwy
 MF4RNYAoUE12kO+FUwJIQpSaOp7tzRA32D/rqd/5NEKQi0baRZe9gNubH
 lP7662wl9a1p5CtUcxfag6wmlp+7Ur1GsfbWA/7dDzcSPZIUVNmWzXrRs
 sut6Dx46QpgHhNAWL20J4R3cNbPIUe9+xeNW+om6xiim60GpaA49CNr5P
 GlUtmd+hqd2D+nVRn2W+tt5zSbGDUvy8zkNGVABKdX2VH7Fc8rrBWT9ZL
 n1YBgx5oLcfIkxjnxSGWu5vHe6Eo99EuQU0pTDeMEYu4n1oiDfVdSR3ld w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="375484910"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="375484910"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 14:06:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="751081060"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="751081060"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 14:06:22 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:06:22 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:06:22 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 14:06:22 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 14:06:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hilX8qxpeTRFaPIO5CuhstTFig48kjvQVGwPQIqWs71LxyPDGYiJqCEeZY3lELzZWjPl3FrZujHF1FTJJj2ZERGMH4SceWwvPwH7EAMm9s8ixytY/8qOYd9aOzHM8WtmW1yjDpuIpbFfxvA3QReMa3MldbRC54FhCxlGkVbToPFQatnqmt3mAoamnYZYk2rWqzP+7HJdjJdOThqXZG9qWPGSmeptEKDtfWsn3S0jHvWlUl5016EBhGLCcwLhQ8fMTfyCqdNGls81jE4kqe1rVi4dNYKSR/LkobtAL4BqoRPjKv76OdXFFYMLJUmKAtUpIDsWX2rcBHgDBt3QJ3N2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGpv9vtJW1owS18pGoRfV9oyPqGuLY94tnIhnJpinAo=;
 b=S06D/vh1NpaVXjz+uBjAowCVEeq/cCV25RHWm65malYaRw6okHXdrlp5hyRTQI8sS9YF0xm2tWir8hQDRLbfk1IIbLly5ocxdbrB18155CsAHbQQeJdxVcnzkTRmWe0C0DU2QSToULWrJ2XfinQlI36rqUp1bW4RflWEENxkOLVf3G1EQqjVQQO6+MRQqOfN2DNkF7Q/Fnw4TCFWDC7H6ekyipX6rmYC6zdrCNbe/TY1O56ZK+D+ZKMjdTa2Od67KNCiNtNn6CTw/YmkKiazizy9KK1alsILWWDdxAC/c2ylYFBuRkuJycTd4NCAjdNEb9bUCqeJ9AuES8bCDPOSGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6413.namprd11.prod.outlook.com (2603:10b6:930:37::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 22:06:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 22:06:18 +0000
Date: Fri, 15 Dec 2023 16:06:17 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 08/10] drm/xe/kunit: Use xe kunit helper in WA test
Message-ID: <q2ykk64pagcinlft4ykgflqv2p45ryregpfilqee4vimeja6pl@qzspwjrrd4bm>
References: <20231215162502.1879-1-michal.wajdeczko@intel.com>
 <20231215162502.1879-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231215162502.1879-9-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: 681df0ae-3036-4ccd-8464-08dbfdba10ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /o2xQL8B1VoW6aLPV+4mAGQBv3LqwEgq3HDUMp/ObFuJzrq9Q6YQHTi6crumhUqkwQ5AwHo/8kZ3TQQsATft56pIRWXeI1IRpZELXnHcCtXvrpZCeh6RTNhceEOq74bTJPst1IJ6zE5cN9AYK7nLyulXolGeWOT8PKSdCnnaIMtZbYHRMI1UGA+K0g+3MpONaJV160TSnku5PZkDozcWUQnKMk84BtVTNNS7Pd0LF1INtytrVuV+5s8lEELQLzQ+QIfd33fzua+iw5RS1IQOR0E0m4TkcNNfSA5WQ3wHhTldT2qK27oJXJ34W8Rx3gdt+Ouehj2/O+t7HfXvD7ZV208YoA41Tjk9i/fsJMT4CmqtiRwA+K1ED6Fay+ocgDHJGp6ETgtujTIG1KyXIiEoZbbGpj8ENn3QpRhl5hdOgUNmgDYoqWrs3FpeombjZ8yKLRc68FCrE7DvT7B7KNegQC6W9BQhZzoKrqoCn/LJwyoN22phCnkxHiPBPv4WIhc1LOlKznH860kC7NX4UNvWs5qXhujMvCfxvbDw0A8HEFiQC/c8Jns1Yn5fXpTLtZsX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(6512007)(9686003)(6506007)(478600001)(66946007)(316002)(38100700002)(41300700001)(6862004)(8936002)(6486002)(8676002)(4326008)(26005)(2906002)(5660300002)(66556008)(66476007)(6636002)(82960400001)(86362001)(33716001)(558084003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?snG6SeXHKDEk8PMOA7vGgaA6UtXhcfu1YFa0rQ/ctiphmTO8jw6nAJ1fwrFm?=
 =?us-ascii?Q?GL/LMNyGG5CZiulKNFGgfA9pMWpI5ENR/Yd4rl0TCMyCjyQdH/njf07Ckoda?=
 =?us-ascii?Q?ACSeI9IavAZ2YK+xbG8A5sysWbxKT60rOeKHDLa9uaE2QEe5/nf9+pieCZDm?=
 =?us-ascii?Q?kUzitay6OXoPHOArFN7o3Fp0rXgw3srAX010KQ9yGotmStyJjQSvD7hBjmoR?=
 =?us-ascii?Q?69OCPfbB7qvHdVxIa+EDYuiN5NlYGeB1kyli5yI4OxFKi57M+68a9Kskcamu?=
 =?us-ascii?Q?+wRMoVGW1d6CZQIZ1MFu1uxm7oE10+S3dko+idg5xCq5YaikpNp1/7eWNfWq?=
 =?us-ascii?Q?//AtJrQgs1mlGuZa6ZHOa93PWJY6x1IfjDX4jqnS0ZpyQodIeZsbaRVTSznq?=
 =?us-ascii?Q?M7KW0r183xG4qkBDzPYZVc6iYfgpy/2p46QQWRWQkbsRPbRb4i1CnQbiPdWO?=
 =?us-ascii?Q?7VidCAjEL1lP91d6ESrx31Wj32CdmRJLPmFtVW3rFZ/CXTNiIASxKRKtANP3?=
 =?us-ascii?Q?Ph6LFRrqc8Iby3qE4BOF82iZ7006cQbmp1JJX+tfxQp/VuUUt26Yl0MC7gqk?=
 =?us-ascii?Q?H+KScV1T1nJUm4hfkk7+RfvTmodj5XjuFjmfpSbF51lyzhD6lGJkLYzK6cY9?=
 =?us-ascii?Q?3pMCMuifmMzuBrqGnAd61c9mLph8mLaXlHNoEc5/eSK730caIQ17nhFskMN5?=
 =?us-ascii?Q?9qzoAcFEb+7+/gT/PgRfrdCw0OTgI5avCV+3Js8/HksLrYSFirdfDMzX94aQ?=
 =?us-ascii?Q?yfT21W8sDHziBlgvh41q+wVJOuLraMXqSI90abk9e4Xy0/RypCgcRfTZNiR0?=
 =?us-ascii?Q?ivsspivwMIJxYGmUW7zUXCbiv2lVxy4VJmVNawdU9PNxAP34nspuuL/ffBOf?=
 =?us-ascii?Q?XyMvignYzm8KT2bqKXG0AB+52xxAObRPQk0iaeuQTJWAQwFtty5/sRryupfw?=
 =?us-ascii?Q?7r/MDgGIuQxH3Z7/ptTWhcOKSEejKlJjxAAYSUyzwi1bxkx8NTfC1VlOu+wy?=
 =?us-ascii?Q?rSEcMUvZCZaYn7dratun4GsYpuC6BbV5EU9PjGYNndI9Qyyt3jutEJG8mdHI?=
 =?us-ascii?Q?fqZzgYVfshzFAirEsiYSsB8MeoBzawdStylX41zDY9G3wAOVt1KQpQrCEkY0?=
 =?us-ascii?Q?TG/3mb7X6kC5IcH2VeZrjoviFdM0ah4j3xo6MA2mWKyoESG8kUwt7MCb+gz0?=
 =?us-ascii?Q?cDoTlUzP8B4Erbp7n30WN26HXHBtcyNjN+QZ+osoUcJzzmsZIEHqMI1UMnB6?=
 =?us-ascii?Q?d9Xrv/gY/CX6tYx6uXpBpoNUZcNYDIL3i0gsZiZoTDZLkTkHQddYc4brKY2O?=
 =?us-ascii?Q?bFf0pvz73B3hbfCA0RHZBl/d5xz6RklRsiVZ+zdsoV5ncaUy3Gtt8dv8zHXD?=
 =?us-ascii?Q?68XZoa5oc0k4OuM6MpTOi0KoFifkOak9GkzlgIjDGLUhbQnUcMX+7qUtgLEH?=
 =?us-ascii?Q?DGh1oT5V+qrEiK9I6fohxW5SHWjhs6mmrO9XM/L1gmytYHmknnMMF/xd7LG+?=
 =?us-ascii?Q?Qx5fSYhACD0vhl9Srw5g7HAJxdqzj4us3vTyMF8mdsSwMNJYeiT6J90v4zRR?=
 =?us-ascii?Q?QVK2C7te1Z96MPEbzQ6TCx64IMNlGcgkZbEE8UjIgQtoOwtdyjqtx+RKo4uW?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 681df0ae-3036-4ccd-8464-08dbfdba10ab
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 22:06:18.9526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nWqPnYVr7t4rC9tCJjZ/nds87iSMvozx5b6uuB8hsCHlFidva6reIL+4tKDN4ubfz/oNW58Eg/uvxvpe/92zUYSUuZCeGNrroERZqYgg3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6413
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 05:25:00PM +0100, Michal Wajdeczko wrote:
>Use xe helper code to allocate fake xe device.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

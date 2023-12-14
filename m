Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6803AC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 22:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0391F10E2F9;
	Thu, 14 Dec 2023 22:21:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4739B10E2F9
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 22:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702592510; x=1734128510;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AQqEqkelaVr7MPFSd7kSCvCFAjc0ph1jtY+ghdl2eUY=;
 b=a0cv+goc/E3QM7YRqvh7DajdugG+MX0nyqDCIotPXZhMJqyqHhQxwNyU
 W3J0w240Ndcs8mH5N2nOOLOLzo9+ecljgcgnn0GGpmKE2VvZ+Sg1jMI4a
 0oeqU6Adgquf+XXwGpvsTx8Yn2zbYit9YreGvR6OHt6LcDVEjgGztlfb7
 SkaogfEjJ+st+J+ir07LtfIFQbzNd3NKtOS1zuv2JlSXbbL5pSjvqrvUV
 W6gAaPE/EoFohxaOLifVpkIciRfWXKQs+q71xh4VIedFQoK59b47wjK74
 OYBLYOOimrLsj/2/P5BSgBpbTOTLRS9yvqcFaVHcVyMOKQPt9L2ae4HT3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="16748503"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="16748503"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 14:21:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="803465118"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="803465118"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 14:21:47 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 14:21:40 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 14:21:40 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 14:21:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOMCt2wVXK/o0O+WPxLI4UO6oIMqVRaLX317ono168LfjbrnhSCI5i3Gdd6gZTtCw42Rz6qRnNZwNP6a6WqK+e4AbYpnu0HBER2CIW7WNN9md3tBIcwS69zd2bN3k15RlvdLVEpSuVXsPWXdxr1H+vgKhLNWJ6ZDYT+NDqARDdN+qF7QRQ0JZHfhjJRy7NqQF8yj9z7DDvADyZ/Mj6g3m91QGgfJCwaYVQvzWtIuy6UIsY8kAoWwooDcesvqscPoJfbVwGoJAJQBp/FnRfNl6x7EPqYgwPI7sJmjFW1mNylDUFerFRl6XElBjMJB3Jm8uZbCpps+Sz+kjGL54W1c2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvei0ADVWqKeq2drGgp/kxzdWUJvaYAoHnSs9avc3t8=;
 b=QD54o5eyjN9AVcHxh1h2xVtwvRDpWUSrQnAGCOdwU2nTJb2GSBen8zm9s/Ox+baT3RnzJeasUzDKr9COCCmWCm9fsvGKpfvGOwsN8XJqDbOggbP7BfdZs/HIYQwbsIZ/OmXI31mN0uTfa9j7HZ5a6DIo3iW/CLHoVjjPsWpxkBxvl2skV3wyS+JCdWRRfXOMiVn4WbUHSh0N9JwUqYnd+Q+Si4jxjWsnzG2oEOx/sGkoCi4NH+sgw6rLaQwEJb6nRwOHUcXElXBvL0MXftQFeIC6h5XzyGfNZwnZWE1ughouuRdmtGf3A2mGaJNjs7Asu73dY7ExZGwEdtWssHEIkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6512.namprd11.prod.outlook.com (2603:10b6:930:40::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 22:21:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 22:21:31 +0000
Date: Thu, 14 Dec 2023 16:21:27 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 8/8] drm/xe: Drop some unnecessary header includes
Message-ID: <dv6xq3hjllvmregn4ofj4obrdgphgg2hf7clelrqmurezq3gcl@fmr2kyjxcj3p>
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
 <20231214184659.2249559-18-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231214184659.2249559-18-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: 72de85ae-153d-4e1e-a413-08dbfcf305e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lnJwRnwh2CXK4oo6JFckZIKvbsyXEAYFtaACazGHW/JvcW27JoylQz905IewAsHTK7JEBrBI1m4kUcPjFDw+M1rGdnvA9lM5G9ot+kgJlex/TIaVbmZRccKBwZyUfN+S/7wn41RvttrOPZ+O6A6NOu/QR02h7IaJP0rsUCuTW3OajXlqILJ1cYwTtY+b+IDhNeVncLzuOTqXt+AQfW1iYSRGIMhQDms5E2YqR4tJvmvjcPF4AKr1nyDJsYmAW6eWUE/hgA8LqoF9zfnqK9ByrehTI7la7HtTZy3QWKBgf7SRzCiOHHaR35ZSu7D0jjuMgURiJlVcoMl3HZQ6SJCgXfr2AeNAEZ4ZWgTSphAZ9+xLnEV9w1VcqFf6H2QkwaKwRmdLVEi7+Y3wJ5m/kbjrH6ib2Zjnwd06tLWXsS/kQsSVTmvCYXf50RXa4kez+J51Z8pCimKH8Ampq8+7JzZou/fODf28BUQDS8N75zKabvxNWZG3OooXzyBulr/1E8vsdYA6sm8Imm0nuGAS9uW+jdxsEV27kj3BJlq9j/3VAIEaBz7QwfA+ZBe7i9FKn5oF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(376002)(39860400002)(136003)(366004)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(38100700002)(86362001)(82960400001)(6506007)(478600001)(6666004)(26005)(6486002)(4326008)(6636002)(66476007)(66946007)(66556008)(6512007)(9686003)(316002)(6862004)(8936002)(8676002)(41300700001)(33716001)(5660300002)(4744005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?17t8LclZrf+wCcpquasoMEQB8weCAUPG1ta+VRBL6FVmpoblFRq9rnfMzqcp?=
 =?us-ascii?Q?Bb67PvIfkvsNSdfl7yVZxq9rOQGp/qI2BJd2l579SIZ71aCqNb++Q+XMe4hR?=
 =?us-ascii?Q?UZuwROSjgd9jiz4whsCjmNVMSo/YtOr1ytJNzGIViAzjF8QLE3C4+IutErSf?=
 =?us-ascii?Q?JzGwu3dilHCq4ixynp1q+8/Rq7tZEIhrAZTPrD8AvnXH/Kqk57Q9w9/tC2+G?=
 =?us-ascii?Q?LZ/TO/DDxagBVeWv09lszTUv/zE0yH0bNsnYN0yFB+mGBpb3T8vlByb4Q8f8?=
 =?us-ascii?Q?KUL8YIPJQ0Qk07b7qrS6y5vs/1wlLMBFQmmuWpwUjbQvQOvimGADgfv+aggv?=
 =?us-ascii?Q?IChsvf971Xee6wDq3RZgfvoNuO5rTcyiaKOYZ7zYL2+6bkrAtvhjb/jtBelS?=
 =?us-ascii?Q?6HMHXHav0R3vx5h6IqrxlRumgxv0yjvEqWjz4+kYXmlJOI2ghUk7ssWq1pus?=
 =?us-ascii?Q?s2skYMeBNvJtmL73t2nEZgJibYHcUAh4cf6ik/b8VSXJuQE1EPAFYk0BEqLq?=
 =?us-ascii?Q?YFtuHltXjKjUqasEzoGzQCrRzTB4CAMSC2TED+Oax5lReStZUENlESdMK4rS?=
 =?us-ascii?Q?bhUEskBtVZZX0rfIWXFBO+fC+yX7wND7Q1Ds38GnyhntCNyi58ZagdUy47EJ?=
 =?us-ascii?Q?wCdKJQdJ1sJTbhaSAdZsr6wCGVIMdrdWmoCWa4anYosCnG5uXILJzrKSO6xs?=
 =?us-ascii?Q?d/dqzKHA0wsVN4NpzjgxQm1MhNSKI1k5S5vH5VVnNkAAwfSRrmp25HEaPnhD?=
 =?us-ascii?Q?B0CYjW/f9ZV7K9OSSMpl+VlsH1L8mxS55jLL2Uv1aSzpBbFTSSzrKXYHWEa1?=
 =?us-ascii?Q?qzXP/iojVm/WrhMhc5HtJfeDA2aHbz8QEQG3vyKaQmMywd2xPAjlGF5gRHds?=
 =?us-ascii?Q?PqfnQNlvUkrwm/DdzsZ63ipnlSkhxs3VoSN4nChpfgzXgpe2EyqNRRslhUm5?=
 =?us-ascii?Q?ZOh8tthEttPiuCI/dIet2Jtuunb/1wHoY67yLHYQn7qcs5lbdyGXls+okQlM?=
 =?us-ascii?Q?jtrUvCGE0g+B0wTlyvHhNDqy7P/DVS0iHJx7YmFhPDu+GQUo1G6K+5IHll35?=
 =?us-ascii?Q?snXzOeDeyZ9QzGqsrPRmOK+iOKoKixTlXOxTyfe9NfBXXxvzaPdxjs2hv55m?=
 =?us-ascii?Q?XouGf64xe+z9x8Q+LKRknpFeqk41tMTPcjKs+A6S0SWnjLjcbpgIkfxkpjT5?=
 =?us-ascii?Q?3AjiMDu41ZuVsOA3rQP1RgxcQpAmdVjqrAdP2+nGfmHnm2BpVzAl0pGluubZ?=
 =?us-ascii?Q?Z8pbUc3KelqrqIvU/fKiCeArqKaDB7MSknTci4Uexc3ZdZIyAmQHrAGnebvS?=
 =?us-ascii?Q?zGkF6pqZSt095mI0pktW+VuVtQFJOruiLgM2k6BGlNhgmyhpydU2AfP5RCJk?=
 =?us-ascii?Q?iog5dBU+tzIwAA/LSfUZSB0c4hPL2peCjMpyNXYHsU5ja0CNcZWevJZIAaoX?=
 =?us-ascii?Q?vQ4et/VmJzlKlnAoKZwMMPOmw6Ze4EQfiK+QDwV1PaYTJo1IYcFeV4+j7Kc/?=
 =?us-ascii?Q?KDl5ukD3Po+bkJ2Ssx8aV7Mp0nbarZUpjkDA/AObMM0i6zKAJQwUFlm7P2f2?=
 =?us-ascii?Q?jBEcepyGDVLmRqPWJZuQl6iJdAUbJcLG3ZB0yW/JgsPB48q4b1vQLKVofKjZ?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72de85ae-153d-4e1e-a413-08dbfcf305e5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 22:21:31.1074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDDItNbimKDTzELPGoa/ZD+D3aa4z2NoZo4REX7m1x0Ua3ox8Uh6OI++ZMgXKrqrQh87vm2muiUGooIhBbV2l2ei8PCqwk1uMFAso/Yu5DE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6512
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

On Thu, Dec 14, 2023 at 10:47:08AM -0800, Matt Roper wrote:
>Several files were including register headers that they no longer
>require.  Drop the unnecessary includes to reduce build dependencies.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

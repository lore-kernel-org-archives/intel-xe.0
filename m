Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D22AC47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 15:23:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B33210E832;
	Tue, 23 Jan 2024 15:23:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E39810E844
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 15:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706023405; x=1737559405;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=78k9yCucmlJcUShGJm1Nno9ig9keo8vK8pNrMchtynM=;
 b=Zh9UqaRgDjDIHkBkm/bJOaG3+FHMiOXWYxKiTymW4ZR+l9A7JA1EewhT
 hlkvJQQSmlGt3PbQcOFMZj69mNMNU6532HZzBqPZ6i+VHSjczV673bLIk
 1Hkvd5I4LEM7BaPSTG9gIsyscm5xwghvmEzaqky5YO9wIC/rBCTAcjj3T
 vavI4H7YNU4PPQlUNTqzFm9yV9BY5kvy/A4WAW/5OWlowgaSrG74l1awj
 2fze9SNkj/rxXqUpYOSSv1bOMmJ6PEM+pAhN7fAieCfzZi09Mn8awF/T5
 C3aKAfQxVFRI01jYgKlZWC7781Vb6cJBKKr8uiB1DnEDTKXMT9ZVEsobq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="14906774"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="14906774"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 07:23:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909322284"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="909322284"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 07:23:24 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 07:23:24 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 07:23:24 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 07:23:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfA/YzF3zbzVOOhTsvqWHkKL/UO+l5d6VFW0KXH8C+HiLk6hkaZChkmbV4iqyZq2FbxpChUXxb+W4cBQoVf9F090uAKQsF2Dd/99cdP+QzPri7eyoQajPjFWtCTOpJRunijFeBVjACJt1eZpA3ea3MqnWSxIahf4vU0xZVtKIP3XQ4+nO/SEZIQc49dh8nx0cb8R6cZQBekxQn9UOXCmhtxRQamuO4eElCQ5tQsf4NdKTOFxUplRv/VW/l1EVPLbVy0qF45iHcgAXppzShnSXGLr7t4LWdMKs3SVp+B0zJ3x4tF9S0DvERKZof3VOZKrRGB0AlROUXNQvUz5Cp7Jpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EX7YqhdPPWubvNJf7ehTNWKymG8y5ZtCXPG+finnbKk=;
 b=AcvbTVsdgfMAks2hu5ULnDK9GXbh5kaN4aTGmqY+DaU2MiaOxYeAJjCvUHajvaE5NwpAakkbbn9awod/N88chnjsD53SqAqft1RvuNpKM1PI73qen2Dqc1zNsFrb2hChUKhNtMOYDHuInbW15P5dY2w+sOLWIN+iizxOtbCehNbeirTS3Rkhh6EiGlomFBV5qRVIoJYZuq0a7SP/3viz32yqZhsSD1F9Tv3mThhHDSroiQyFr1g3ClJb9cQgX4m61YNsFsOliDfsuuD2wypNSl2FaU8XtVDUfLMigBmqUBkF6TNOFVWslV+YshbD4JpTpQirZSLoQfuYuPHLUgQ5IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7833.namprd11.prod.outlook.com (2603:10b6:8:ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 15:23:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 15:23:22 +0000
Date: Tue, 23 Jan 2024 09:23:20 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Document nested struct members according to
 guidelines
Message-ID: <oed2nokuzwogk5wxdom4hqzeh3mkdjgyr5wwa6imaechd5iglj@b5za27wrxweo>
References: <20240123120840.8250-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123120840.8250-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0360.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: a4fd016c-413d-4d60-a557-08dc1c273c48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HKQJ+/Qt6O2e4kzM7zzRgX53JyVhARm97soO4hblF/n5QsJtCkG5eur4tmPSjgnc+eAwZoK6uCTi/09dFr2+3E7yBZKW7NL3LRdnDY9vTbPUB+AzXrxrSVWUPfNZ6yGh2V5n9jKnwsDjCwsWqBiXvbifCPR0u+2h/C8L29vi9NbsDY56fZj6VdWKkL6NdqXP8wE4qJvj1LDtAvZVPR7mutbZil8iyBO1omnXtPMXtdB8cGCKyAB8ZQcezItu1uBPGBClch2Gv6C45a9dof/GW9kv10OtUBHrQ6NYFLvVQsxnucBV6pB/FfMkE2svxGBpIwSHlE97PqkSDmQr6P4aZI0r950OF97IHCzB7pXWoKjW7J5Tqg0CFGgpDblWKsscTvU399I6XpgNwAFPNP3AVNtOjOLattSanqexFJQIa6EtDXIVhJcNBHSRZIzn+a5pzcBhFYJq1PYwGeZxv7k3k0vWMt8ETAKJgjiomIfVqp/44xzJUp0eH0/8GTW3p0R1c+OXp3tCBMH43bq1Dk17GtT//YismLYN+rHJTAtLTWxRQyJ6IuCTbQ5Igtd2nIGqwa9pcsQIv2/AiAIsiTjqsahC4KvVAFJkmfyRx8hDUWWl/XUqALpuROFFyliOpKtH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(346002)(39860400002)(136003)(376002)(230173577357003)(230273577357003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(9686003)(6506007)(478600001)(66476007)(6512007)(6916009)(66556008)(66946007)(8936002)(8676002)(316002)(6486002)(33716001)(26005)(66574015)(83380400001)(2906002)(5660300002)(4326008)(4744005)(41300700001)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ca+zPxsrJgRKsqhaPX1FcznZ9LbuDWe3caysBA3sTSdgzpJkS2mTgXXeBA?=
 =?iso-8859-1?Q?qxvylhYLMCwdh3u8qL5be3QTzc8fBSccpAv8LJlYXQccOTXjeTDnZSYLb6?=
 =?iso-8859-1?Q?WCFEGjnsSOgeALw0znXDmABhOgIivrm417dwfdlK827lXcPHY6f5GM5UHF?=
 =?iso-8859-1?Q?v7Z/hYe/doXXJWg9emCUr4NGVpPid7UsGOd6Qo80J3+UT8RnaL41fnOsAI?=
 =?iso-8859-1?Q?qJ/OH1nmNiSCER1nOYThjYajoCvbru+Ujq8dHcVxxSlbhIpwy6haE0TLtz?=
 =?iso-8859-1?Q?RWKl+b7kwIeOTP7z93xpFsFa8P/Q90qZ+5c76/Kf1R4tQA2xyFcb99Tqi+?=
 =?iso-8859-1?Q?S13xliEm3SnG/M+SbH4zx0lmM6Ex/lK25BQ0P+/TItxxKTVZ/nWcPpC9Xs?=
 =?iso-8859-1?Q?sHqYg832uBoTd6G/n+EoOMhG+q299LzHkgxA2RAy3cl0pYL3rtdt6TkSoZ?=
 =?iso-8859-1?Q?uERW+rQ269tLpopHA7hgKATZnLJoP+CeXXz7MY6vt2EjP6T+D0walOoTVg?=
 =?iso-8859-1?Q?uu8qhJzpgm+7St80xfCyGGwEp084sBsQD8qhAJkuHloIreno6mppPTJKff?=
 =?iso-8859-1?Q?mk0Aa+SDrqe/0UNqXmpulXN5+FHRoqth9dwnbcms8cSfBY2Lhu8UvHy0Ap?=
 =?iso-8859-1?Q?BI9CNedY69OIalAB6ql9h+pAQeXdzePotENFne95nsrLU38lu8+sZ1rMiB?=
 =?iso-8859-1?Q?fhcIjzGUm65HcHrXYuSC5f7Q6P5+I58cP5z/+IBu7n2PoPo5RuYY8fF+P0?=
 =?iso-8859-1?Q?edp2L2mHJqpShPYz7sFenxtkgFnR1cOPUzyhNKp4abetK9dB5PG1Sza9fU?=
 =?iso-8859-1?Q?2bMawE05hzTTCk9sQF6Hqd9pORl8sPv6rGjRlmvmewTNt4XrFT2A4azKoh?=
 =?iso-8859-1?Q?tHGNyZx/XoDX0RNHhFVGaoKc0OmvE+xtU78jBsT38JZvyrC6kWyPhLs2RO?=
 =?iso-8859-1?Q?yIU4ytO7fBz8upWGsShI/PhggBT7/dh23KkzCUl2iWO45muC0TwkBlFqOq?=
 =?iso-8859-1?Q?kyse4zJVl9vS/TaFRGB+RAKzxFtAVsvimHSc8xmTciplpo7SGj3id44f07?=
 =?iso-8859-1?Q?o/KneWA2L7TJVnEiU8PuuOhfxVLXOo4kvfuuxiSzPluEWcy7V/CVnwBqP6?=
 =?iso-8859-1?Q?cs6VgFAMnIR27Tj63wjGWfqEuwfXBWbcG6Z5m9adQclwhLf/vQ1ttl5x5v?=
 =?iso-8859-1?Q?X4roBXRWCA3SEvZYjQjqfQw4954lWvzK/sis7FNz3RfuVJv9tWMqW8Nxne?=
 =?iso-8859-1?Q?6eNdT81uO5PftvuXmT1jpGfZ30mDrT+8qWnVu2fm/od4pdz0JxHl1KMla/?=
 =?iso-8859-1?Q?C6fdtDKjcE4jow5fac983Cw+EZSAjJ1FDZh8qh08ivsNtyYc33YQK6Fgok?=
 =?iso-8859-1?Q?/rc0PVUfdY/lozEZZl1KkbWuoAkdwXUA6f/borLVV90Gut9a3JnaAhkR71?=
 =?iso-8859-1?Q?XPnunfXsSvcJwRCK//n3AwWsQjUwHzAuUCE8a0BzisG3x4TML2ojPHj9o5?=
 =?iso-8859-1?Q?tj4yC4d2Ou42AFkM3aqTHJAbx8odW0H6zh+cpH9s5JAeA9uC/VfbHsHB4E?=
 =?iso-8859-1?Q?7WJCTKqyJ7HSSl1r81VJSdDLTZ/gclNm9byjvC8YRRGjeW+rQa2RSZY31w?=
 =?iso-8859-1?Q?fXPl8JnfxkzBPlxZ/vbVmwrc71GuD4vlTj4XUCmVLtXx3bPWSeQgaEOg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4fd016c-413d-4d60-a557-08dc1c273c48
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 15:23:22.1770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1yhyXUARror3iAs05Pbd0a5TBQZLZb8W9krPST35eHIApzUK/zQ7Xfofu2+lBa4supX+pMq1H+yApWdWdvKnsYnvmmKGz6/MmFqbPRNIxyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7833
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

On Tue, Jan 23, 2024 at 01:08:40PM +0100, Thomas Hellström wrote:
>Document nested struct members with full names as described in
>Documentation/doc-guide/kernel-doc.rst.
>
>For this documentation we allow a column with of to make
>it more readable.
>
>This fixes warnings similar to:
>drivers/gpu/drm/xe/xe_lrc_types.h:45: warning: Excess struct member 'size' description in 'xe_lrc'
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


`git show --color-words` seems sane. CI result tells it took care of all
the warnings too.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thaks
Lucas De Marchi

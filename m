Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E31FC4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 03:44:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3E810E385;
	Fri,  3 Nov 2023 03:44:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5B910E385
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 03:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698983088; x=1730519088;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PSn2FPp8JCc3pRmBS6BmsEHflOLB2VeQLbVCfH/YPFw=;
 b=XKNZYwXvpL3fKfafV8oR6PIQ5+o65ei9vyhQu14WX279CMNlWtKKnzO4
 wR6zGfIg9pWTj/spFp7tn40IOg9IvzBPiG8lY3mpNetEizV4NJ5DsbsQ0
 8+a3GAKK77rnwM/tVWkYfVeWvGCE7lYI0QEQSxlaKhykn+BoG51Qcpkut
 eaTbS240VhK5EHnjsLSSX4w7fNnGXgr5ZYx0dT6TlHbkfNigfwwfk1RNG
 Lq/mexqxo/xEcl5NSzJSZbdD9jRx6Ul2NL15vTU9jS48WJLW/ARG1DeJ7
 nn8UzylJEVyQB6JeuM01PLQo6EqeBctwTvixaDdCJT/A7qRyS4Qm+2wmA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="453167609"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="453167609"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 20:44:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="761481901"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="761481901"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Nov 2023 20:44:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 20:44:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 20:44:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 2 Nov 2023 20:44:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqBTSL8bwb8zPKFlJKsc+sFaM0TKNmvRLtThPatMFo3oUsPb2iM/va8A/vufwp0gNItdo+oIdrKqtoy1HmE73xQrYjLEZet9uYVHMoky65yX7KqXbQpjBjGZ2t+JRArgSLOynIZDSXef3xiEvkvkRZhwfwz7GOG9o7zkTeB7Pu5T1UhVKFKna6kZOOIHNSRJJpwN7zlLSKur8m7xeZPyCtA8WtH4ENCjtDYpqSL7twU5fbN320/BxvirAZG7L6m2asCIIszTd8ikTFbNtx2uvn/c6JXEzX8UQEEtNu7kjZ9qBmNFGzreBheH+0nLBP+dAry/Wlq2i1rD2/C/qVQ8TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JI5rclPh4gnonz7OQjGdbutm6oDOTzrYiSa7abD3ZBE=;
 b=IfrBxmmwg3Z9zrsNxAH3nTj42EZtcjpOFUgyRUD9mq4z5rEIcJMV7U5A+TXArZ2impp/xIreBrukjD7raiXFe3iEhTw3QmRQTqlwnI/sD7xAjNQjBomBIyCulODLnUh7jFYc/NfyCY2/bnHWui0m0/wLJcN0oCNex+i7BEEkdvtN/4zzozbuw96efocWii+9nI1wtV8/dt0yR77dOhN+fNVYvweDsOvnUucptPSCOkxA2XRBu9da3TSRfjpSD654a2JAmEYsoIFn2SLIdAb2kp3rjsm69QF9foS0tSlhNiuPeToz5FolK/nIsu6DvwaGlbkGw/O8OizsOY9S19QjYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7896.namprd11.prod.outlook.com (2603:10b6:610:131::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 03:44:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6954.019; Fri, 3 Nov 2023
 03:44:40 +0000
Date: Thu, 2 Nov 2023 22:44:37 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <aat5rdnoxy75knd3rvfk57hjwtmu4cur4emfynwoalk3x72pv2@2fvv23cqtiab>
References: <20231102124855.1940491-1-lucas.demarchi@intel.com>
 <169893105022.1757.16240778729594724519@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <169893105022.1757.16240778729594724519@gjsousa-mobl2>
X-ClientProxiedBy: SJ0PR13CA0159.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae2d7ba-de28-4ce6-68aa-08dbdc1f353e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cZO+uDPyC86o9yXKgKyAPpiYycQ+yh7kJF0mxINSq5r4xB40D8hnUD+SIYCvwCPQyKhnRSUZT6hZMxtkg+Ma+wES5liCccV9vsUGJyYBaJPMXEWXee5kOV9K+soHYZqKGwweaBsfg6E5tNbo+x4oZrrWKjcHcRMx/Xro2U79JY9TnvL9bRkWvpMeYb7g7Is/8MeM326K4nYAh6q8MWxVmgqOBKsTdU11OOArCmEufbtigl9DVsSodR0rc3kSjM0tDzARh4GtX5h0gmv9FmYgGvyXkaGazMzw5KysuD0LK7ewFTGq5Xa2MZSVyUcV5VORBA2TgBmYdMDfqmjh56pz2JfKM/HKntb6nV2S8W6cthxiXqoI+RfI3i0R1qPOksO8JD5MIdqJ7MFGCI9Bwh71c/Fp29fU/lPpq2MdCsMiqVjPopyIBMO8KBLhLKPMuTJ8EGJrQawNAoOLJbp97GV14AJzbmefvvAmZkWWxJnixs9ZotS5dgNYyJkHNrR4gX8Ly9lvQOr7J4axbXgtcVJ8VA/sbh9Y8XJWmiWPrbPz8wFL0ZxP7lSlQfbM4xTF4FyB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(346002)(136003)(39860400002)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(66556008)(66946007)(316002)(6512007)(6506007)(66476007)(9686003)(6636002)(26005)(33716001)(6666004)(82960400001)(38100700002)(86362001)(6486002)(107886003)(478600001)(5660300002)(2906002)(4744005)(41300700001)(4326008)(6862004)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qmC8DbNluoJM6brYHD0G7nvJgENc2BbSxp8orWIHFTBBQI1xDbXqPDj2GSbu?=
 =?us-ascii?Q?loiCzsScupIWN2N7Z1ODiDxWfRUQaBjQW4HYII2NpAR1CHruuAjlGnOtFYPO?=
 =?us-ascii?Q?p7ZG+ZrNIxbrZqWIlv97ZVK0ayOyJkUCNp+MdTZJ578Zvd4Sx+Vm8K+jvkyY?=
 =?us-ascii?Q?nE1zt8c8mFb4d1UoKv3+n9j76Pb5S27hDaMGKD1bUWax5LtJZPCWzaNRv7zr?=
 =?us-ascii?Q?lViK/y9PabM+QBBe4kw/kUpFl+MxKuOBu/e7j58a+mAbz/emDhUrA07SGz7v?=
 =?us-ascii?Q?AhX3q6O1makQ2jkCxn5KNZjtQcS0ey7wBlqZA1dUekLEprvqJ5U2qTJ/tIY6?=
 =?us-ascii?Q?HjsQlhFOJu+t0RQO31tGaLU42VbQXTL8HlxApx+XwcFNCk2r2tjhsPKnD/WD?=
 =?us-ascii?Q?EHCGPzW3NEQCbqJKyRrRpWjPMsYa6NLpwnTLBXfkCqLVUGUzpTapY36Ac8Wm?=
 =?us-ascii?Q?gUPGKG5s/WF0Jz9Zn+2sBaf3itGnDrKMDJpvUxuCnTMC9exvqcE4oFFe7Iqk?=
 =?us-ascii?Q?S48img3s1SC8X+Z0iu78wxMcuo6aan41cINrmhSytVCIQMiXZjfVmV0KT7GZ?=
 =?us-ascii?Q?ye5WyAtPHsSViXdKvYbYb9RNvMqpvuFA9HusSB21MiZMKLsprerU4/Hw2dw5?=
 =?us-ascii?Q?xCghBKZBEa8tnYHU5LFyG/XQHeHEeQaOIG1HlpkHFMnsN+sewyU9nBiC1Os6?=
 =?us-ascii?Q?ue8kZl5WYJ4Th8bgNGZpBqEUzwSg4RKZ8SzVjrzISwHBCZ7sRfz1F7q6Y124?=
 =?us-ascii?Q?BHteqgjvwEdnalXlsooOydleLZBRs1sVf2k03/Q1ya2970UOiunabOdWswbN?=
 =?us-ascii?Q?3lWzwV1RlzcOfTbJ5xv6sS59HqHtWh/0BTvyCD0hmzVpzKWY7Ms187c0RSyk?=
 =?us-ascii?Q?mftZLk+8GBfDICboiE3dZQ8uN4NskQmHCjku4/b08fIZazwqKrwOA4PTKzh9?=
 =?us-ascii?Q?T9eqIjc8vtg1xAmU7cIf5hTUw/k8OO1Godh08ipAUTsm7Xfl9xYyebTlxP6V?=
 =?us-ascii?Q?P1Xbmsg1Hd6dkb40lgmxglV9QI+G/LrK1BKOjhVYiM+FLqRxtAGTPe+ILajo?=
 =?us-ascii?Q?ysUZ3LK6mkyVEiKYBTbYzzPdhyamI1apb/uX8BNRSXPjGgTkFNtNMoDvokcK?=
 =?us-ascii?Q?RbszPohk9JtwuxJJCk1aTAcndUqVXYsC9F7J+aoWtuSRQ+yLpnpiEDYlnCRE?=
 =?us-ascii?Q?Xc18y8kdlwa1bNPM7VLNZVl3IB83zqGSYXsWEREmWRqC0XTtS+XJ1dj38Uzk?=
 =?us-ascii?Q?YfcUa7mXow1DwWyZXMDLvCWI+c4ns8TEBQe/WXPCMCTiRO1VRyZZilZvZ3RD?=
 =?us-ascii?Q?1Pdoz1Om8l4FR0cvdOf8RhkWqZ3HzDAZbiELw4yhsKVuP/N17VSpbLdkSMil?=
 =?us-ascii?Q?Ty+MFysme0Pnj6CE4xSbJpOrMrrv1czJKWAIWqbUln9grq2TZ0+QnIDIW3ZQ?=
 =?us-ascii?Q?fqiZxpJv2zFeKKYcUehV9RW/U+q0S8H+Go4R3tv2Nu4X+5dHgNP0FwmckM5I?=
 =?us-ascii?Q?2r2soaP/mlzoTsflBfW/wlrZro3x7QML+kv7nVSCqNqlqAKYVG2oe8WkryDo?=
 =?us-ascii?Q?+6JmZvUGViBM9OlMvDjPG1va3D20Iu8eMItM1JOM7XhZyRQ/U2+e9GivoFVB?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae2d7ba-de28-4ce6-68aa-08dbdc1f353e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 03:44:39.9811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdLQk/OoXqQkEVlhuAU3+OrGwSPgQDkQcCzqPIUXbwxjwT7bE52xX1+JCFY+w+Pd9yLXe/lsYrCUw5P5JcPgQ5dWy3p+zaSqb6FnqxxurTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7896
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Add Wa_14019821291
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 02, 2023 at 10:17:30AM -0300, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2023-11-02 09:48:55-03:00)
>>From: Matt Roper <matthew.d.roper@intel.com>
>>
>>This workaround is primarily implemented by the BIOS.  However if the
>>BIOS applies the workaround it will reserve a small piece of our DSM
>>(which should be at the top, right below the WOPCM); we just need to
>>keep that region reserved so that nothing else attempts to re-use it.
>>
>>v2 (Gustavo):
>>  - Check for NULL media_gt
>>  - Mask bits [5:0] to avoid potential issues in future platforms
>>
>>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

thanks, applied to drm-xe-next.

Lucas De Marchi
